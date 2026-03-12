# 🔄 BACKUP INMEDIATO - PASOS

## 📋 PASO 1: EXPORTAR DATOS ACTUALES

### En Supabase Dashboard:
1. **Ir a tu proyecto actual**
2. **SQL Editor** (en menú lateral)
3. **Ejecutar estos queries uno por uno:**

```sql
-- Exportar Usuarios
SELECT * FROM users;

-- Exportar Tiendas  
SELECT * FROM tiendas;

-- Exportar Productos
SELECT * FROM productos;

-- Exportar Imágenes
SELECT * FROM producto_imagenes;
```

### Para cada query:
1. **Ejecutar** → Ver resultados
2. **Click "Download"** → CSV
3. **Guardar en carpeta** `backups/`

## 📋 PASO 2: CREAR NUEVO PROYECTO

### En Supabase:
1. **Dashboard** → **New Project**
2. **Nombre**: `mi-tienda-nextjs`
3. **Database Password**: `MiTienda2024!` (guárdala)
4. **Region**: misma que actual
5. **Create Project**

## 📋 PASO 3: SETUP NUEVO SCHEMA

### En nuevo proyecto:
1. **SQL Editor** → **New query**
2. **Pegar este código:**

```sql
-- Users Table
CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  email VARCHAR(255) UNIQUE NOT NULL,
  name VARCHAR(255),
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- Stores Table  
CREATE TABLE stores (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  slug VARCHAR(255) UNIQUE NOT NULL,
  name VARCHAR(255) NOT NULL,
  brand_color VARCHAR(7) DEFAULT '#22226B',
  navbar_style VARCHAR(20) DEFAULT 'blanco',
  background_style VARCHAR(20) DEFAULT 'blanco',
  logo_url TEXT,
  description TEXT,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- Products Table
CREATE TABLE products (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  store_id UUID REFERENCES stores(id) ON DELETE CASCADE,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  price DECIMAL(10,2),
  image_url TEXT,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- Crear índices
CREATE INDEX stores_user_id_idx ON stores(user_id);
CREATE INDEX stores_slug_idx ON stores(slug);
CREATE INDEX products_store_id_idx ON products(store_id);
CREATE INDEX products_active_idx ON products(is_active);
```

## 📋 PASO 4: CONFIGURAR AUTH

### En nuevo proyecto:
1. **Authentication** → **Settings**
2. **Site URL**: `http://localhost:3010`
3. **Redirect URLs**: `http://localhost:3010/auth/callback`
4. **Email templates** → Personalizar si quieres

## 📋 PASO 5: VARIABLES DE ENTORNO

### Crear nuevo `.env.local`:
```env
NEXT_PUBLIC_SUPABASE_URL=https://[nuevo-proyecto-id].supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=[nueva-key]
SUPABASE_SERVICE_ROLE_KEY=[service-key]
```

## ✅ LISTO PARA SIGUIENTE PASO

Una vez que tengas:
- ✅ Backup CSV descargado
- ✅ Nuevo proyecto creado
- ✅ Schema ejecutado
- ✅ Variables actualizadas

**AVÍSAME y procedo con las APIs nuevas**
