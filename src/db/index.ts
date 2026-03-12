
import { drizzle } from 'drizzle-orm/postgres-js';
import postgres from 'postgres';
import * as schema from './schema'; // Importar todo el esquema

const connectionString = process.env.DATABASE_URL;

if (!connectionString) {
  throw new Error('DATABASE_URL is not set in environment variables');
}

// Define SSL configuration for production environment
const sslConfig = process.env.NODE_ENV === 'production' 
  ? { ssl: 'require' as const } 
  : undefined;

// La función getDb crea y devuelve una nueva conexión cada vez que se llama
export const getDb = () => {
  // Pass connection string and SSL config separately for robustness
  const client = postgres(connectionString, sslConfig);
  return drizzle(client, { schema });
};
