
import { drizzle } from 'drizzle-orm/postgres-js';
import postgres from 'postgres';
import * as dotenv from 'dotenv';
import * as fs from 'fs';
import * as path from 'path';

dotenv.config({ path: '.env.local' });

const connectionString = process.env.DATABASE_URL;

if (!connectionString) {
  throw new Error('DATABASE_URL is not set in .env.local');
}

const client = postgres(connectionString, { max: 1 });
const db = drizzle(client);

const MIGRATIONS_TABLE = 'drizzle_migrations';
const MIGRATIONS_FOLDER = __dirname;

async function main() {
  try {
    console.log('Starting migration process...');

    // 1. Crear la tabla de migraciones si no existe
    await client.unsafe(`
      CREATE TABLE IF NOT EXISTS ${MIGRATIONS_TABLE} (
        id SERIAL PRIMARY KEY,
        file_name VARCHAR(255) NOT NULL UNIQUE,
        created_at TIMESTAMP NOT NULL DEFAULT NOW()
      );
    `);
    console.log('Migrations table is ready.');

    // 2. Obtener las migraciones ya ejecutadas
    const executedMigrations = await client.unsafe(`SELECT file_name FROM ${MIGRATIONS_TABLE};`);
    const executedFiles = new Set(executedMigrations.map((row: any) => row.file_name));
    console.log('Executed migrations:', Array.from(executedFiles));

    // 3. Leer todos los archivos de migración de la carpeta
    const migrationFiles = fs.readdirSync(MIGRATIONS_FOLDER)
      .filter(file => file.endsWith('.sql'))
      .sort(); // Ordenar alfabéticamente

    console.log('Found migration files:', migrationFiles);

    // 4. Ejecutar las migraciones pendientes
    for (const file of migrationFiles) {
      if (!executedFiles.has(file)) {
        console.log(`Applying migration: ${file}...`);
        const sql = fs.readFileSync(path.join(MIGRATIONS_FOLDER, file)).toString();
        await client.unsafe(sql);
        await client.unsafe(`INSERT INTO ${MIGRATIONS_TABLE} (file_name) VALUES ('${file}');`);
        console.log(`-> Migration ${file} applied successfully.`);
      } else {
        console.log(`Skipping already executed migration: ${file}`);
      }
    }

    console.log('All pending migrations applied successfully!');

  } catch (error) {
    console.error('Error during migration process:', error);
    process.exit(1);
  } finally {
    await client.end();
    console.log('Migration process finished. Connection closed.');
  }
}

main();
