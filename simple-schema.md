# 🗄️ ESQUEMA SIMPLE - BASE DE DATOS NUEVA

## 📋 TABLAS ESENCIALES

### 1. Users Table
```sql
CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  email VARCHAR(255) UNIQUE NOT NULL,
  name VARCHAR(255) NOT NULL,
  department_id UUID REFERENCES departments(id),
  municipality_id UUID REFERENCES municipalities(id),
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);
```

### 2. Departments Table
```sql
CREATE TABLE departments (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name VARCHAR(100) UNIQUE NOT NULL,
  code VARCHAR(10) UNIQUE NOT NULL, -- Ej: "LP", "CB", "SC"
  created_at TIMESTAMP DEFAULT NOW()
);
```

### 3. Municipalities Table
```sql
CREATE TABLE municipalities (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name VARCHAR(100) NOT NULL,
  department_id UUID REFERENCES departments(id),
  created_at TIMESTAMP DEFAULT NOW()
);
```

### 4. Stores Table
```sql
CREATE TABLE stores (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  slug VARCHAR(255) UNIQUE NOT NULL,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  brand_color VARCHAR(7) DEFAULT '#22226B',
  navbar_style VARCHAR(20) DEFAULT 'blanco',
  background_style VARCHAR(20) DEFAULT 'blanco',
  logo_url TEXT,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);
```

## 🌱 SEED DATA - DEPARTAMENTOS BOLIVIA

```sql
-- Insertar Departamentos
INSERT INTO departments (name, code) VALUES
('La Paz', 'LP'),
('Cochabamba', 'CB'),
('Santa Cruz', 'SC'),
('Potosí', 'PT'),
('Chuquisaca', 'CH'),
('Tarija', 'TJ'),
('Oruro', 'OR'),
('Beni', 'BN'),
('Pando', 'PA');

-- Insertar Municipios Principales
INSERT INTO municipalities (name, department_id) VALUES
-- La Paz
('La Paz', (SELECT id FROM departments WHERE code = 'LP')),
('El Alto', (SELECT id FROM departments WHERE code = 'LP')),
-- Santa Cruz  
('Santa Cruz de la Sierra', (SELECT id FROM departments WHERE code = 'SC')),
('Cochabamba', (SELECT id FROM departments WHERE code = 'CB')),
-- Y más municipios...
;
```

## 📊 ÍNDICES PARA PERFORMANCE

```sql
CREATE INDEX users_email_idx ON users(email);
CREATE INDEX users_department_idx ON users(department_id);
CREATE INDEX stores_user_id_idx ON stores(user_id);
CREATE INDEX stores_slug_idx ON stores(slug);
CREATE INDEX stores_active_idx ON stores(is_active);
CREATE INDEX municipalities_department_idx ON municipalities(department_id);
```

## 🎯 ESTRUCTURA SIMPLE

- **Users** → Tiene email, nombre, ubicación
- **Stores** → Cada usuario tiene una tienda
- **Departments/Municipalities** → Para ubicación geográfica
- **Relaciones limpias** → User → Store, Department → Municipality

## ✅ VENTAJAS

- **Fácil de entender** - 4 tablas simples
- **Rápido de implementar** - Sin complejidades
- **Escalable** - Fácil agregar productos después
- **Performance** - Queries simples y rápidas
