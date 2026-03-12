# 🔄 Backup de Supabase - Instrucciones

## 📋 PASOS PARA BACKUP SEGURO:

### 1. Exportar Datos Actuales
```sql
-- En Supabase Dashboard → SQL Editor
-- Exportar tablas principales:

-- Usuarios
SELECT * FROM users;

-- Tiendas  
SELECT * FROM tiendas;

-- Productos
SELECT * FROM productos;

-- Imágenes de productos
SELECT * FROM producto_imagenes;
```

### 2. Descargar CSV
- Dashboard → Table Editor → Select table
- Click "Export" → Download CSV
- Guardar en: `backups/supabase-original/`

### 3. Crear Nuevo Proyecto
- Supabase Dashboard → New Project
- Nombre: `mi-tienda-v2`
- Region: misma que actual
- Database password: guardar segura

### 4. Setup Nuevo Schema
```sql
-- Crear tablas nuevas y limpias
CREATE TABLE users (...);
CREATE TABLE stores (...);
CREATE TABLE products (...);
```

### 5. Migrar (Opcional)
- Solo usuarios importantes
- Solo tiendas activas
- O empezar con datos de prueba

## 🎯 FLUJO RECOMENDADO:

1. ✅ Backup actual
2. ✅ Nuevo proyecto  
3. ✅ Implementar APIs nuevas
4. ✅ Testing con datos de prueba
5. ✅ Migrar si todo funciona
6. ✅ Borrar antiguo (solo al final)

## 🔒 SEGURIDAD:
- Nunca borrar sin backup
- Probar todo en nuevo proyecto
- Mantener antiguo 1 semana
- Documentar cambios
