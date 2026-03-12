-- PostgreSQL version - Converted from MySQL/MariaDB
-- Original: MariaDB 11.4.10
-- Target: PostgreSQL (Supabase)

-- Start transaction
BEGIN;

-- Set timezone
SET timezone = 'UTC';

--
-- Table: administradores
--

CREATE TABLE administradores (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  password VARCHAR(255) NOT NULL,
  nivel VARCHAR(20) DEFAULT 'admin',
  activo BOOLEAN DEFAULT true,
  ultimo_acceso TIMESTAMP,
  fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

--
-- Data for table: administradores
--

INSERT INTO administradores (id, nombre, email, password, nivel, activo, ultimo_acceso, fecha_creacion) VALUES
(1, 'Administrador', 'admin@done.com', '$2y$10$fbEHAL0612L7UYW9OjbC2Ogg.zDAsnmS/91WXv3Zvfa6dT3u6CfZa', 'super_admin', true, '2026-03-09 08:51:18', '2025-12-26 18:05:47');

-- Add unique constraint for email
ALTER TABLE administradores ADD CONSTRAINT unique_admin_email UNIQUE (email);

COMMIT;
