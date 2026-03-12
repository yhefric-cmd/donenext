// Tipos TypeScript para la base de datos de Done! Marketplace
// Basado en la estructura de la base de datos migrada a Supabase

// Definición del tipo Database para Supabase
export interface Database {
  public: {
    Tables: {
      administradores: {
        Row: Administrador
        Insert: Omit<Administrador, 'id' | 'fecha_creacion'>
        Update: Partial<Omit<Administrador, 'id' | 'fecha_creacion'>>
      }
      badges: {
        Row: Badge
        Insert: Omit<Badge, 'id' | 'creado_en'>
        Update: Partial<Omit<Badge, 'id' | 'creado_en'>>
      }
      busquedas: {
        Row: Busqueda
        Insert: Omit<Busqueda, 'id' | 'ultima_busqueda'>
        Update: Partial<Omit<Busqueda, 'id' | 'ultima_busqueda'>>
      }
      calificaciones: {
        Row: Calificacion
        Insert: Omit<Calificacion, 'id' | 'fecha_calificacion'>
        Update: Partial<Omit<Calificacion, 'id' | 'fecha_calificacion'>>
      }
      categorias: {
        Row: Categoria
        Insert: Omit<Categoria, 'id' | 'creada_en'>
        Update: Partial<Omit<Categoria, 'id' | 'creada_en'>>
      }
      ciudades: {
        Row: Ciudad
        Insert: Omit<Ciudad, 'id'>
        Update: Partial<Omit<Ciudad, 'id'>>
      }
      configuracion: {
        Row: Configuracion
        Insert: Omit<Configuracion, 'id' | 'updated_at'>
        Update: Partial<Omit<Configuracion, 'id' | 'updated_at'>>
      }
      conversiones: {
        Row: Conversion
        Insert: Omit<Conversion, 'id' | 'fecha_conversion'>
        Update: Partial<Omit<Conversion, 'id' | 'fecha_conversion'>>
      }
      denuncias: {
        Row: Denuncia
        Insert: Omit<Denuncia, 'id' | 'fecha_denuncia'>
        Update: Partial<Omit<Denuncia, 'id' | 'fecha_denuncia'>>
      }
      denuncias_tiendas: {
        Row: DenunciaTienda
        Insert: Omit<DenunciaTienda, 'id' | 'fecha_denuncia'>
        Update: Partial<Omit<DenunciaTienda, 'id' | 'fecha_denuncia'>>
      }
      favoritos: {
        Row: Favorito
        Insert: Omit<Favorito, 'id' | 'fecha_favorito'>
        Update: Partial<Omit<Favorito, 'id' | 'fecha_favorito'>>
      }
      feria_bloques: {
        Row: FeriaBloque
        Insert: Omit<FeriaBloque, 'id'>
        Update: Partial<Omit<FeriaBloque, 'id'>>
      }
      feria_posiciones: {
        Row: FeriaPosicion
        Insert: Omit<FeriaPosicion, 'id'>
        Update: Partial<Omit<FeriaPosicion, 'id'>>
      }
      feria_puestos: {
        Row: FeriaPuesto
        Insert: Omit<FeriaPuesto, 'id' | 'fecha_asignacion'>
        Update: Partial<Omit<FeriaPuesto, 'id' | 'fecha_asignacion'>>
      }
      feria_sectores: {
        Row: FeriaSector
        Insert: Omit<FeriaSector, 'id' | 'creado_en'>
        Update: Partial<Omit<FeriaSector, 'id' | 'creado_en'>>
      }
      log_acciones: {
        Row: LogAccion
        Insert: Omit<LogAccion, 'id' | 'fecha_accion'>
        Update: Partial<Omit<LogAccion, 'id' | 'fecha_accion'>>
      }
      password_resets: {
        Row: PasswordReset
        Insert: Omit<PasswordReset, 'created_at' | 'expires_at'>
        Update: Partial<Omit<PasswordReset, 'created_at' | 'expires_at'>>
      }
      productos: {
        Row: Producto
        Insert: Omit<Producto, 'id' | 'fecha_publicacion' | 'fecha_actualizacion' | 'fecha_expiracion'>
        Update: Partial<Omit<Producto, 'id' | 'fecha_publicacion' | 'fecha_actualizacion' | 'fecha_expiracion'>>
      }
      producto_badges: {
        Row: ProductoBadge
        Insert: Omit<ProductoBadge, 'id' | 'created_at'>
        Update: Partial<Omit<ProductoBadge, 'id' | 'created_at'>>
      }
      producto_imagenes: {
        Row: ProductoImagen
        Insert: Omit<ProductoImagen, 'id' | 'created_at'>
        Update: Partial<Omit<ProductoImagen, 'id' | 'created_at'>>
      }
      producto_likes: {
        Row: ProductoLike
        Insert: Omit<ProductoLike, 'id' | 'fecha_like'>
        Update: Partial<Omit<ProductoLike, 'id' | 'fecha_like'>>
      }
      reportes: {
        Row: Reporte
        Insert: Omit<Reporte, 'id' | 'fecha_reporte'>
        Update: Partial<Omit<Reporte, 'id' | 'fecha_reporte'>>
      }
      subcategorias: {
        Row: Subcategoria
        Insert: Omit<Subcategoria, 'id'>
        Update: Partial<Omit<Subcategoria, 'id'>>
      }
      tiendas: {
        Row: Tienda
        Insert: Omit<Tienda, 'id' | 'fecha_creacion'>
        Update: Partial<Omit<Tienda, 'id' | 'fecha_creacion'>>
      }
      tienda_configuracion_inicio: {
        Row: TiendaConfiguracionInicio
        Insert: Omit<TiendaConfiguracionInicio, 'id' | 'created_at'>
        Update: Partial<Omit<TiendaConfiguracionInicio, 'id' | 'created_at'>>
      }
      traffic_logs: {
        Row: TrafficLog
        Insert: Omit<TrafficLog, 'id' | 'fecha_visita'>
        Update: Partial<Omit<TrafficLog, 'id' | 'fecha_visita'>>
      }
      usuarios: {
        Row: Usuario
        Insert: Omit<Usuario, 'id' | 'fecha_registro'>
        Update: Partial<Omit<Usuario, 'id' | 'fecha_registro'>>
      }
      visitas: {
        Row: Visita
        Insert: Omit<Visita, 'id' | 'fecha_visita'>
        Update: Partial<Omit<Visita, 'id' | 'fecha_visita'>>
      }
    }
    Views: {
      [_ in never]: never
    }
    Functions: {
      [_ in never]: never
    }
    Enums: {
      [_ in never]: never
    }
  }
}

// =============================================
// USUARIOS Y AUTENTICACIÓN
// =============================================

export interface Usuario {
  id: number;
  nombre: string;
  fecha_nacimiento: string | null;
  email: string;
  password: string;
  telefono: string | null;
  whatsapp: string | null;
  ciudad: string | null;
  departamento: string | null;
  direccion: string | null;
  foto: string | null;
  bio: string | null;
  verificado: boolean;
  activo: boolean;
  tipo: string; // 'usuario', 'admin', 'super_admin'
  social_login: string | null;
  social_id: string | null;
  fecha_registro: string;
  ultimo_acceso: string | null;
  ip_registro: string | null;
}

export interface Administrador {
  id: number;
  nombre: string;
  email: string;
  password: string;
  nivel: string; // 'admin', 'super_admin'
  activo: boolean;
  ultimo_acceso: string | null;
  fecha_creacion: string;
}

// =============================================
// PRODUCTOS
// =============================================

export interface Producto {
  id: number;
  usuario_id: number;
  categoria_id: number;
  subcategoria_id: number | null;
  titulo: string;
  descripcion: string | null;
  precio: number | null;
  precio_original: number | null;
  moneda: string; // 'BOB', 'USD', etc.
  condicion: string; // 'nuevo', 'usado'
  estado: string; // 'activo', 'inactivo', 'eliminado'
  destacado: boolean;
  visitas: number;
  ciudad: string | null;
  direccion: string | null;
  latitud: number | null;
  longitud: number | null;
  telefono: string | null;
  whatsapp: string | null;
  negociable: boolean;
  tags: string | null;
  fecha_publicacion: string;
  fecha_actualizacion: string;
  fecha_expiracion: string;
}

export interface ProductoImagen {
  id: number;
  producto_id: number;
  nombre_archivo: string;
  orden: number;
  principal: boolean;
  created_at: string;
}

export interface ProductoBadge {
  id: number;
  producto_id: number;
  badge_id: number;
  created_at: string;
}

export interface Badge {
  id: number;
  nombre: string;
  slug: string;
  descripcion: string | null;
  icono: string | null;
  color: string;
  creado_en: string;
}

// =============================================
// CATEGORÍAS
// =============================================

export interface Categoria {
  id: number;
  nombre: string;
  icono: string;
  descripcion: string | null;
  orden: number;
  activa: boolean;
  creada_en: string;
}

export interface Subcategoria {
  id: number;
  categoria_id: number;
  nombre: string;
  slug: string;
  descripcion: string | null;
  orden: number;
  activa: boolean;
}

// =============================================
// TIENDAS
// =============================================

export interface Tienda {
  id: number;
  usuario_id: number;
  nombre: string;
  slug: string;
  descripcion: string | null;
  logo: string | null;
  portada: string | null;
  telefono: string | null;
  whatsapp: string | null;
  email: string | null;
  direccion: string | null;
  ciudad: string | null;
  departamento: string | null;
  latitud: number | null;
  longitud: number | null;
  estado: string; // 'activa', 'inactiva'
  calificacion: number;
  total_calificaciones: number;
  fecha_creacion: string;
}

export interface TiendaConfiguracionInicio {
  id: number;
  tienda_id: number;
  seccion: string;
  contenido: string | null;
  activo: boolean;
  created_at: string;
}

// =============================================
// FAVORITOS Y LIKES
// =============================================

export interface Favorito {
  id: number;
  usuario_id: number;
  producto_id: number;
  fecha_favorito: string;
}

export interface ProductoLike {
  id: number;
  producto_id: number;
  usuario_id: number | null;
  ip_address: string | null;
  fecha_like: string;
}

// =============================================
// CALIFICACIONES
// =============================================

export interface Calificacion {
  id: number;
  usuario_calificado_id: number;
  usuario_calificador_id: number;
  calificacion: number; // 1-5
  comentario: string | null;
  fecha_calificacion: string;
}

// =============================================
// UBICACIONES
// =============================================

export interface Ciudad {
  id: number;
  nombre: string;
  departamento: string;
}

// =============================================
// FERIAS VIRTUALES
// =============================================

export interface FeriaSector {
  id: number;
  slug: string;
  titulo: string;
  descripcion: string | null;
  icono: string | null;
  color: string;
  activo: boolean;
  creado_en: string;
}

export interface FeriaBloque {
  id: number;
  sector_id: number;
  nombre: string;
  descripcion: string | null;
  capacidad: number;
  posicion_x: number | null;
  posicion_y: number | null;
  activo: boolean;
}

export interface FeriaPosicion {
  id: number;
  sector_id: number;
  ciudad: string; // 'LPZ', 'SCZ', etc.
  bloque_id: number | null;
  posicion: number | null;
  disponible: boolean;
}

export interface FeriaPuesto {
  id: number;
  sector: string;
  ciudad: string;
  numero: number;
  usuario_id: number | null;
  estado: string; // 'disponible', 'ocupado', 'reservado'
  fecha_asignacion: string | null;
}

// =============================================
// BÚSQUEDAS Y TRÁFICO
// =============================================

export interface Busqueda {
  id: number;
  usuario_id: number | null;
  termino: string;
  frecuencia: number;
  ultima_busqueda: string;
}

export interface Visita {
  id: number;
  usuario_id: number | null;
  pagina: string;
  ip_address: string | null;
  user_agent: string | null;
  fecha_visita: string;
}

export interface TrafficLog {
  id: number;
  ip_address: string;
  user_agent: string | null;
  pagina: string;
  metodo: string; // 'GET', 'POST', etc.
  codigo_estado: number | null;
  usuario_id: number | null;
  fecha_visita: string;
}

// =============================================
// REPORTES Y DENUNCIAS
// =============================================

export interface Denuncia {
  id: number;
  producto_id: number;
  usuario_reporta_id: number;
  motivo: string;
  descripcion: string | null;
  estado: string; // 'pendiente', 'resuelta', 'rechazada'
  fecha_denuncia: string;
}

export interface DenunciaTienda {
  id: number;
  tienda_id: number;
  usuario_reporta_id: number | null;
  motivo: string;
  descripcion: string | null;
  estado: string;
  fecha_denuncia: string;
}

export interface Reporte {
  id: number;
  reportador_id: number | null;
  tipo: string; // 'usuario', 'producto', 'comentario'
  elemento_id: number;
  motivo: string;
  descripcion: string | null;
  estado: string;
  fecha_reporte: string;
}

// =============================================
// CONFIGURACIÓN
// =============================================

export interface Configuracion {
  id: number;
  clave: string;
  valor: string | null;
  descripcion: string | null;
  updated_at: string;
}

export interface PasswordReset {
  email: string;
  token: string;
  created_at: string;
  expires_at: string;
}

// =============================================
// LOGS Y ACCIONES
// =============================================

export interface LogAccion {
  id: number;
  usuario_id: number | null;
  accion: string; // 'login', 'logout', 'registro', 'publicar', etc.
  detalles: string | null;
  ip_address: string | null;
  user_agent: string | null;
  fecha_accion: string;
}

export interface Conversion {
  id: number;
  tipo: string; // 'registro', 'publicacion', 'contacto', 'favorito'
  usuario_id: number | null;
  producto_id: number | null;
  tienda_id: number | null;
  fecha_conversion: string;
  ip_address: string | null;
}

// =============================================
// TIPOS PARA FORMULARIOS Y API
// =============================================

export interface CreateUsuarioData {
  nombre: string;
  email: string;
  password: string;
  telefono?: string;
  ciudad?: string;
  departamento?: string;
}

export interface LoginData {
  email: string;
  password: string;
}

export interface CreateProductoData {
  titulo: string;
  descripcion: string;
  categoria_id: number;
  subcategoria_id?: number;
  precio?: number;
  moneda?: string;
  condicion?: string;
  ciudad?: string;
  direccion?: string;
  telefono?: string;
  whatsapp?: string;
  negociable?: boolean;
  tags?: string;
}

export interface UpdateProductoData extends Partial<CreateProductoData> {
  id: number;
}

export interface CreateTiendaData {
  nombre: string;
  slug: string;
  descripcion?: string;
  telefono?: string;
  whatsapp?: string;
  email?: string;
  direccion?: string;
  ciudad?: string;
  departamento?: string;
}

export interface ProductFilters {
  categoria_id?: number;
  subcategoria_id?: number;
  ciudad?: string;
  precio_min?: number;
  precio_max?: number;
  condicion?: string;
  estado?: string;
  busqueda?: string;
  page?: number;
  limit?: number;
  offset?: number;
}

export interface ApiResponse<T> {
  success: boolean;
  data?: T;
  error?: string;
  message?: string;
}

export interface PaginatedResponse<T> extends ApiResponse<T[]> {
  pagination: {
    total: number;
    page: number;
    limit: number;
    totalPages: number;
  };
}
