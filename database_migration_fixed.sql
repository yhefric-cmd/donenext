-- PostgreSQL version - Converted from MySQL/MariaDB for Supabase
-- Original database: if0_39881623_cambalache
-- Converted: 2026-03-10
-- Fixed: Correct table creation order

-- Start transaction
BEGIN;

-- Set timezone
SET timezone = 'UTC';

--
-- Core tables (no dependencies)
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

CREATE TABLE badges (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  slug VARCHAR(50) NOT NULL,
  descripcion TEXT,
  icono VARCHAR(100),
  color VARCHAR(20) DEFAULT '#007bff',
  creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE categorias (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  icono VARCHAR(100) NOT NULL,
  descripcion TEXT,
  orden INTEGER DEFAULT 0,
  activa BOOLEAN DEFAULT true,
  creada_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE ciudades (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  departamento VARCHAR(50) NOT NULL
);

CREATE TABLE configuracion (
  id SERIAL PRIMARY KEY,
  clave VARCHAR(100) NOT NULL UNIQUE,
  valor TEXT,
  descripcion TEXT,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE feria_sectores (
  id SERIAL PRIMARY KEY,
  slug VARCHAR(50) NOT NULL UNIQUE,
  titulo VARCHAR(100) NOT NULL,
  descripcion TEXT,
  icono VARCHAR(100),
  color VARCHAR(20) DEFAULT '#28a745',
  activo BOOLEAN DEFAULT true,
  creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE password_resets (
  email VARCHAR(255) NOT NULL,
  token VARCHAR(255) NOT NULL UNIQUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  expires_at TIMESTAMP DEFAULT (CURRENT_TIMESTAMP + INTERVAL '1 hour')
);

CREATE TABLE usuarios (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  fecha_nacimiento DATE,
  email VARCHAR(100) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  telefono VARCHAR(20),
  whatsapp VARCHAR(20),
  ciudad VARCHAR(50),
  departamento VARCHAR(50),
  direccion TEXT,
  foto VARCHAR(255),
  bio TEXT,
  verificado BOOLEAN DEFAULT false,
  activo BOOLEAN DEFAULT true,
  tipo VARCHAR(20) DEFAULT 'usuario',
  social_login VARCHAR(50),
  social_id VARCHAR(100),
  fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  ultimo_acceso TIMESTAMP,
  ip_registro VARCHAR(45)
);

--
-- Tables with dependencies on core tables
--

CREATE TABLE subcategorias (
  id SERIAL PRIMARY KEY,
  categoria_id INTEGER NOT NULL REFERENCES categorias(id),
  nombre VARCHAR(100) NOT NULL,
  slug VARCHAR(100) NOT NULL,
  descripcion TEXT,
  orden INTEGER DEFAULT 0,
  activa BOOLEAN DEFAULT true,
  UNIQUE(categoria_id, slug)
);

CREATE TABLE feria_bloques (
  id SERIAL PRIMARY KEY,
  sector_id INTEGER NOT NULL REFERENCES feria_sectores(id),
  nombre VARCHAR(100) NOT NULL,
  descripcion TEXT,
  capacidad INTEGER DEFAULT 1,
  posicion_x INTEGER,
  posicion_y INTEGER,
  activo BOOLEAN DEFAULT true
);

CREATE TABLE tiendas (
  id SERIAL PRIMARY KEY,
  usuario_id INTEGER NOT NULL REFERENCES usuarios(id),
  nombre VARCHAR(100) NOT NULL,
  slug VARCHAR(100) NOT NULL UNIQUE,
  descripcion TEXT,
  logo VARCHAR(255),
  portada VARCHAR(255),
  telefono VARCHAR(20),
  whatsapp VARCHAR(20),
  email VARCHAR(100),
  direccion TEXT,
  ciudad VARCHAR(50),
  departamento VARCHAR(50),
  latitud DECIMAL(10,8),
  longitud DECIMAL(11,8),
  estado VARCHAR(20) DEFAULT 'activa',
  calificacion DECIMAL(3,2) DEFAULT 0,
  total_calificaciones INTEGER DEFAULT 0,
  fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UNIQUE(usuario_id)
);

CREATE TABLE productos (
  id SERIAL PRIMARY KEY,
  usuario_id INTEGER NOT NULL REFERENCES usuarios(id),
  categoria_id INTEGER NOT NULL REFERENCES categorias(id),
  subcategoria_id INTEGER REFERENCES subcategorias(id),
  titulo VARCHAR(200) NOT NULL,
  descripcion TEXT,
  precio DECIMAL(10,2),
  precio_original DECIMAL(10,2),
  moneda VARCHAR(3) DEFAULT 'BOB',
  condicion VARCHAR(20) DEFAULT 'nuevo',
  estado VARCHAR(20) DEFAULT 'activo',
  destacado BOOLEAN DEFAULT false,
  visitas INTEGER DEFAULT 0,
  ciudad VARCHAR(50),
  direccion TEXT,
  latitud DECIMAL(10,8),
  longitud DECIMAL(11,8),
  telefono VARCHAR(20),
  whatsapp VARCHAR(20),
  negociable BOOLEAN DEFAULT false,
  tags TEXT,
  fecha_publicacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  fecha_expiracion TIMESTAMP DEFAULT (CURRENT_TIMESTAMP + INTERVAL '30 days')
);

--
-- Tables with dependencies on products and shops
--

CREATE TABLE busquedas (
  id SERIAL PRIMARY KEY,
  usuario_id INTEGER REFERENCES usuarios(id),
  termino VARCHAR(255) NOT NULL,
  frecuencia INTEGER DEFAULT 1,
  ultima_busqueda TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE calificaciones (
  id SERIAL PRIMARY KEY,
  usuario_calificado_id INTEGER NOT NULL REFERENCES usuarios(id),
  usuario_calificador_id INTEGER NOT NULL REFERENCES usuarios(id),
  calificacion INTEGER CHECK (calificacion >= 1 AND calificacion <= 5),
  comentario TEXT,
  fecha_calificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UNIQUE(usuario_calificado_id, usuario_calificador_id)
);

CREATE TABLE conversiones (
  id SERIAL PRIMARY KEY,
  tipo VARCHAR(50) NOT NULL,
  usuario_id INTEGER REFERENCES usuarios(id),
  producto_id INTEGER REFERENCES productos(id),
  tienda_id INTEGER REFERENCES tiendas(id),
  fecha_conversion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  ip_address VARCHAR(45)
);

CREATE TABLE denuncias (
  id SERIAL PRIMARY KEY,
  producto_id INTEGER NOT NULL REFERENCES productos(id),
  usuario_reporta_id INTEGER NOT NULL REFERENCES usuarios(id),
  motivo VARCHAR(100) NOT NULL,
  descripcion TEXT,
  estado VARCHAR(20) DEFAULT 'pendiente',
  fecha_denuncia TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE denuncias_tiendas (
  id SERIAL PRIMARY KEY,
  tienda_id INTEGER NOT NULL REFERENCES tiendas(id),
  usuario_reporta_id INTEGER REFERENCES usuarios(id),
  motivo VARCHAR(100) NOT NULL,
  descripcion TEXT,
  estado VARCHAR(20) DEFAULT 'pendiente',
  fecha_denuncia TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE favoritos (
  id SERIAL PRIMARY KEY,
  usuario_id INTEGER NOT NULL REFERENCES usuarios(id),
  producto_id INTEGER NOT NULL REFERENCES productos(id),
  fecha_favorito TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UNIQUE(usuario_id, producto_id)
);

CREATE TABLE feria_posiciones (
  id SERIAL PRIMARY KEY,
  sector_id INTEGER NOT NULL REFERENCES feria_sectores(id),
  ciudad VARCHAR(5) DEFAULT 'LPZ',
  bloque_id INTEGER REFERENCES feria_bloques(id),
  posicion INTEGER,
  disponible BOOLEAN DEFAULT true
);

CREATE TABLE feria_puestos (
  id SERIAL PRIMARY KEY,
  sector VARCHAR(50) NOT NULL,
  ciudad VARCHAR(10) NOT NULL,
  numero INTEGER NOT NULL,
  usuario_id INTEGER REFERENCES usuarios(id),
  estado VARCHAR(20) DEFAULT 'disponible',
  fecha_asignacion TIMESTAMP
);

CREATE TABLE log_acciones (
  id SERIAL PRIMARY KEY,
  usuario_id INTEGER REFERENCES usuarios(id),
  accion VARCHAR(100) NOT NULL,
  detalles TEXT,
  ip_address VARCHAR(45),
  user_agent TEXT,
  fecha_accion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE producto_badges (
  id SERIAL PRIMARY KEY,
  producto_id INTEGER NOT NULL REFERENCES productos(id),
  badge_id INTEGER NOT NULL REFERENCES badges(id),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UNIQUE(producto_id, badge_id)
);

CREATE TABLE producto_imagenes (
  id SERIAL PRIMARY KEY,
  producto_id INTEGER NOT NULL REFERENCES productos(id),
  nombre_archivo VARCHAR(255) NOT NULL,
  orden INTEGER DEFAULT 0,
  principal BOOLEAN DEFAULT false,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE producto_likes (
  id SERIAL PRIMARY KEY,
  producto_id INTEGER NOT NULL REFERENCES productos(id),
  usuario_id INTEGER REFERENCES usuarios(id),
  ip_address VARCHAR(45),
  fecha_like TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create unique indexes for different scenarios
CREATE UNIQUE INDEX idx_producto_likes_usuario 
  ON producto_likes (producto_id, usuario_id) 
  WHERE usuario_id IS NOT NULL;

CREATE UNIQUE INDEX idx_producto_likes_anonymous 
  ON producto_likes (producto_id, ip_address) 
  WHERE usuario_id IS NULL;

CREATE TABLE reportes (
  id SERIAL PRIMARY KEY,
  reportador_id INTEGER REFERENCES usuarios(id),
  tipo VARCHAR(50) NOT NULL,
  elemento_id INTEGER NOT NULL,
  motivo VARCHAR(100) NOT NULL,
  descripcion TEXT,
  estado VARCHAR(20) DEFAULT 'pendiente',
  fecha_reporte TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE tienda_configuracion_inicio (
  id SERIAL PRIMARY KEY,
  tienda_id INTEGER NOT NULL REFERENCES tiendas(id),
  seccion VARCHAR(255) NOT NULL,
  contenido TEXT,
  activo BOOLEAN DEFAULT true,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE traffic_logs (
  id BIGSERIAL PRIMARY KEY,
  ip_address VARCHAR(45) NOT NULL,
  user_agent TEXT,
  pagina VARCHAR(255) NOT NULL,
  metodo VARCHAR(10) NOT NULL,
  codigo_estado INTEGER,
  usuario_id INTEGER REFERENCES usuarios(id),
  fecha_visita TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE visitas (
  id SERIAL PRIMARY KEY,
  usuario_id INTEGER REFERENCES usuarios(id),
  pagina VARCHAR(255) NOT NULL,
  ip_address VARCHAR(45),
  user_agent TEXT,
  fecha_visita TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create indexes for better performance
CREATE INDEX idx_productos_usuario_id ON productos(usuario_id);
CREATE INDEX idx_productos_categoria_id ON productos(categoria_id);
CREATE INDEX idx_productos_estado ON productos(estado);
CREATE INDEX idx_productos_ciudad ON productos(ciudad);
CREATE INDEX idx_usuarios_email ON usuarios(email);
CREATE INDEX idx_favoritos_usuario_id ON favoritos(usuario_id);
CREATE INDEX idx_favoritos_producto_id ON favoritos(producto_id);
CREATE INDEX idx_tiendas_usuario_id ON tiendas(usuario_id);
CREATE INDEX idx_tiendas_slug ON tiendas(slug);

-- Add unique constraint for admin email
ALTER TABLE administradores ADD CONSTRAINT unique_admin_email UNIQUE (email);

COMMIT;
