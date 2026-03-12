
import { drizzle } from 'drizzle-orm/postgres-js';
import postgres from 'postgres';
import * as dotenv from 'dotenv';
import { users } from './schema';
import { desc } from 'drizzle-orm';

dotenv.config({ path: '.env.local' });

const connectionString = process.env.DATABASE_URL;

if (!connectionString) {
  throw new Error('DATABASE_URL is not set in .env.local');
}

const client = postgres(connectionString);
const db = drizzle(client);

async function main() {
  try {
    console.log('Checking for the latest user...');
    const latestUser = await db.select().from(users).orderBy(desc(users.id)).limit(1);

    if (latestUser.length > 0) {
      console.log('\n--- LATEST USER FOUND ---\n');
      console.log(latestUser[0]);
      console.log('\n-------------------------\n');
    } else {
      console.log('No users found in the database.');
    }

  } catch (error) {
    console.error('Error checking user:', error);
    process.exit(1);
  } finally {
    await client.end();
    console.log('Connection closed.');
  }
}

main();
