// Tipos para el Store Editor - TypeScript completo y escalable

export interface StoreSettings {
  id?: string
  nombre: string
  slug: string
  logo?: string
  banner_images?: string[]
  color_primario: string
  color_secundario: string
  tema: 'claro' | 'oscuro' | 'custom'
  fuente: string
  navbar_style: 'blanco' | 'transparente' | 'color'
  background_style: 'blanco' | 'color' | 'gris'
  grid_density: 1 | 2 | 3 | 4
  facebook_url?: string
  instagram_url?: string
  whatsapp?: string
  telefono?: string
  email?: string
  direccion?: string
  ciudad?: string
  departamento?: string
  descripcion?: string
  menu_items?: StoreMenuItem[]
  activo: boolean
  mostrar_nombre?: boolean
  mostrar_logo?: boolean
  logo_principal?: string
}

export interface StoreMenuItem {
  id: string
  label: string
  slug: string
  tipo: 'categoria' | 'enlace' | 'seccion'
  orden: number
  activo: boolean
}

export interface StoreProduct {
  id: string
  titulo: string
  descripcion?: string
  precio: number
  categoria_id?: string
  categoria_tienda?: string
  estado: 'activo' | 'pausado' | 'vendido'
  condicion: 'nuevo' | 'usado'
  imagenes: ProductImage[]
  badges: string[]
  fecha_publicacion: string
  destacado: boolean
}

export interface ProductImage {
  id: string
  nombre_archivo: string
  es_principal: boolean
  orden: number
}

export interface StoreTheme {
  id: string
  nombre: string
  colores: {
    primario: string
    secundario: string
    acento: string
    fondo: string
    texto: string
  }
  fuentes: {
    principal: string
    secundaria: string
  }
  spacing: {
    xs: string
    sm: string
    md: string
    lg: string
    xl: string
  }
}

export interface StoreStats {
  total_productos: number
  productos_activos: number
  total_visitas: number
  visitas_hoy: number
  calificacion_promedio: number
  total_resenias: number
}

export interface StoreEditorState {
  store: StoreSettings
  products: StoreProduct[]
  theme: StoreTheme
  isDirty: boolean
  isSaving: boolean
  lastSaved?: Date
  previewMode: 'desktop' | 'tablet' | 'mobile'
  sidebarCollapsed: boolean
}

// Tipos para acciones del store
export type StoreEditorAction =
  | { type: 'SET_STORE'; payload: StoreSettings }
  | { type: 'UPDATE_STORE'; payload: Partial<StoreSettings> }
  | { type: 'SET_PRODUCTS'; payload: StoreProduct[] }
  | { type: 'ADD_PRODUCT'; payload: StoreProduct }
  | { type: 'UPDATE_PRODUCT'; payload: { id: string; updates: Partial<StoreProduct> } }
  | { type: 'DELETE_PRODUCT'; payload: string }
  | { type: 'SET_THEME'; payload: StoreTheme }
  | { type: 'SET_DIRTY'; payload: boolean }
  | { type: 'SET_SAVING'; payload: boolean }
  | { type: 'SET_LAST_SAVED'; payload: Date }
  | { type: 'SET_PREVIEW_MODE'; payload: 'desktop' | 'tablet' | 'mobile' }
  | { type: 'TOGGLE_SIDEBAR' }

// Tipos para componentes UI
export interface UIComponentProps {
  className?: string
  children?: React.ReactNode
}

export interface FormFieldProps extends UIComponentProps {
  label?: string
  error?: string
  required?: boolean
  disabled?: boolean
}

export interface ImageUploadProps extends UIComponentProps {
  maxFiles?: number
  accept?: string
  onUpload: (files: File[]) => void
  onRemove?: (index: number) => void
  images?: string[]
}

// Tipos para API responses
export interface ApiResponse<T> {
  success: boolean
  data?: T
  error?: string
  message?: string
}

export interface StoreApiResponse extends ApiResponse<StoreSettings> {}
export interface ProductsApiResponse extends ApiResponse<StoreProduct[]> {}
export interface ProductApiResponse extends ApiResponse<StoreProduct> {}
