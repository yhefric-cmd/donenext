
# Project Handover Notes

## Project Goal

The main goal is to modernize a legacy PHP application (`monolitico` folder) into a professional, responsive Next.js application. We are focusing on UI/UX, using a professional component library, and setting up a robust backend structure.

## Current State (As of Last Session)

We have successfully:
1.  Set up a basic Next.js project.
2.  Established a database connection to a Supabase PostgreSQL instance.
3.  Created and applied database migrations for `departments`, `municipalities`, and `users` tables.
4.  Built a functional, secure user registration form and API endpoint.
5.  Started redesigning the homepage (`/`) with a new, branded navigation bar.

## Tech Stack & Key Decisions

*   **Framework:** Next.js with App Router.
*   **Styling:** Tailwind CSS.
*   **UI Components:** **Shadcn/UI**. This is a critical choice. We are using its CLI to add components (`Input`, `Button`, `Select`, etc.) directly into the `src/components/ui` directory. This gives us full control over the code.
*   **Database ORM:** **Drizzle ORM**. We chose Drizzle for its speed and type-safety.
*   **Database Provider:** PostgreSQL hosted on **Supabase**. The connection string is stored in the `.env.local` file under the key `DATABASE_URL`.

## Workflow & Important Processes

### Database Migrations

**IMPORTANT:** Drizzle Kit was causing issues. We have adopted a **manual but effective migration process**:

1.  **Define Schema:** Changes to the database are first defined in the schema files located in `src/db/schema.ts`.
2.  **Write SQL Migration File:** A new `.sql` file is created in the `src/db/` directory for each set of changes, numbered sequentially (e.g., `0000_...`, `0001_...`).
3.  **Run Migration Script:** The migrations are applied by running the command: `npx tsx src/db/migrate.ts`.

This script is idempotent; it tracks executed migrations in a `drizzle_migrations` table and will only run pending ones.

### Brand Assets

*   The primary brand color is **`#ff6a00`**. This is defined as a CSS variable `--brand` in `src/app/globals.css` and registered in `tailwind.config.ts`.
*   Logos and other static assets from the original PHP project are located in the `d:/windsurf p2/enterprise-nextjs/monolitico/assets/img/` directory.
*   **CRITICAL:** My file-copying tools have been unreliable. When a new asset is needed, the user will manually copy it into the `public/assets/` directory of the Next.js project.

## Current Task & Next Steps

We are in the middle of fixing the logos on the homepage.

*   **Problem:** The logos (one in the navbar, one in the main content) are broken.
*   **Reason:** My previous attempts to copy the image files resulted in corrupted files.
*   **The Fix (In Progress):** The user has just manually copied the necessary logo files:
    *   `monolitico/assets/img/doneback.svg` -> `public/assets/logo-navbar.svg` (for the white logo on the orange navbar).
    *   `monolitico/assets/img/done.png` -> `public/assets/done.png` (for the black logo on the white background).

*   **Your Immediate Next Step:** Your next action is to update the `Navbar.tsx` and `page.tsx` components to correctly use these newly copied image files with the `<Image>` component from Next.js.

---