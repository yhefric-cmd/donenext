// 🎯 TIPOS SIMPLES - NUEVA ESTRUCTURA

export interface User {
  id: string
  email: string
  name: string
  department_id?: string
  municipality_id?: string
  created_at: string
  updated_at: string
}

export interface Department {
  id: string
  name: string
  code: string
  created_at: string
}

export interface Municipality {
  id: string
  name: string
  department_id: string
  created_at: string
}

export interface Store {
  id: string
  user_id: string
  slug: string
  name: string
  description?: string
  brand_color: string
  navbar_style: 'blanco' | 'color' | 'transparente'
  background_style: 'blanco' | 'gris' | 'color'
  logo_url?: string
  is_active: boolean
  created_at: string
  updated_at: string
}

export interface StoreWithUser extends Store {
  user: User
}

// 🔄 API Responses
export interface ApiResponse<T> {
  success: boolean
  data?: T
  error?: string
  message?: string
}

// 📝 Form Types
export interface CreateUserForm {
  email: string
  name: string
  password: string
  department_id?: string
  municipality_id?: string
}

export interface CreateStoreForm {
  name: string
  slug: string
  description?: string
  brand_color?: string
  navbar_style?: 'blanco' | 'color' | 'transparente'
  background_style?: 'blanco' | 'gris' | 'color'
}

// 🎯 Editor Types (Simplificados)
export interface StoreEditorState {
  store: Store | null
  isDirty: boolean
  isSaving: boolean
  lastSaved?: Date
}

export interface StoreEditorAction {
  type: 'SET_STORE' | 'UPDATE_STORE' | 'SET_DIRTY' | 'SET_SAVING' | 'SET_LAST_SAVED'
  payload?: any
}
