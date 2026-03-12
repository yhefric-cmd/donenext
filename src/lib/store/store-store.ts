import { create } from 'zustand'
import { devtools, persist } from 'zustand/middleware'
import { StoreEditorState, StoreEditorAction, StoreSettings, StoreProduct, StoreTheme } from './store-types'

// Estado inicial del store
const initialState: Omit<StoreEditorState, 'store'> = {
  products: [],
  theme: {
    id: 'default',
    nombre: 'Default Theme',
    colores: {
      primario: '#22226B',
      secundario: '#ff6b1a',
      acento: '#10b981',
      fondo: '#ffffff',
      texto: '#1e293b'
    },
    fuentes: {
      principal: 'Inter',
      secundaria: 'Outfit'
    },
    spacing: {
      xs: '0.5rem',
      sm: '1rem',
      md: '1.5rem',
      lg: '2rem',
      xl: '3rem'
    }
  },
  isDirty: false,
  isSaving: false,
  previewMode: 'desktop',
  sidebarCollapsed: false
}

// Reducer para manejar acciones
function storeReducer(state: StoreEditorState, action: StoreEditorAction): StoreEditorState {
  switch (action.type) {
    case 'SET_STORE':
      return {
        ...state,
        store: action.payload,
        isDirty: false
      }

    case 'UPDATE_STORE':
      return {
        ...state,
        store: {
          ...state.store,
          ...action.payload
        },
        isDirty: true
      }

    case 'SET_PRODUCTS':
      return {
        ...state,
        products: action.payload,
        isDirty: false
      }

    case 'ADD_PRODUCT':
      return {
        ...state,
        products: [action.payload, ...state.products],
        isDirty: true
      }

    case 'UPDATE_PRODUCT':
      return {
        ...state,
        products: state.products.map(p =>
          p.id === action.payload.id
            ? { ...p, ...action.payload.updates }
            : p
        ),
        isDirty: true
      }

    case 'DELETE_PRODUCT':
      return {
        ...state,
        products: state.products.filter(p => p.id !== action.payload),
        isDirty: true
      }

    case 'SET_THEME':
      return {
        ...state,
        theme: action.payload,
        isDirty: true
      }

    case 'SET_DIRTY':
      return {
        ...state,
        isDirty: action.payload
      }

    case 'SET_SAVING':
      return {
        ...state,
        isSaving: action.payload
      }

    case 'SET_LAST_SAVED':
      return {
        ...state,
        lastSaved: action.payload,
        isDirty: false
      }

    case 'SET_PREVIEW_MODE':
      return {
        ...state,
        previewMode: action.payload
      }

    case 'TOGGLE_SIDEBAR':
      return {
        ...state,
        sidebarCollapsed: !state.sidebarCollapsed
      }

    default:
      return state
  }
}

// Store principal con Zustand
export const useStoreEditor = create<StoreEditorState & {
  dispatch: (action: StoreEditorAction) => void
  reset: () => void
  saveStore: () => Promise<void>
  loadStore: (storeId: string) => Promise<void>
  addProduct: (product: Omit<StoreProduct, 'id' | 'fecha_publicacion'>) => Promise<void>
  updateProduct: (id: string, updates: Partial<StoreProduct>) => Promise<void>
  deleteProduct: (id: string) => Promise<void>
}>()(
  devtools(
    persist(
      (set, get) => ({
        // Estado inicial
        store: {
          id: '',
          nombre: '',
          slug: '',
          color_primario: '#22226B',
          color_secundario: '#ff6b1a',
          tema: 'claro',
          fuente: 'Inter',
          navbar_style: 'blanco',
          background_style: 'blanco',
          grid_density: 3,
          activo: true,
          menu_items: []
        },
        ...initialState,

        // Dispatch para acciones
        dispatch: (action) => {
          set((state) => storeReducer(state, action))
        },

        // Reset store
        reset: () => {
          set({
            store: {
              id: '',
              nombre: '',
              slug: '',
              color_primario: '#22226B',
              color_secundario: '#ff6b1a',
              tema: 'claro',
              fuente: 'Inter',
              navbar_style: 'blanco',
              background_style: 'blanco',
              grid_density: 3,
              activo: true,
              menu_items: []
            },
            ...initialState
          })
        },

        // Guardar tienda
        saveStore: async () => {
          const { store, isDirty, dispatch } = get()
          
          if (!isDirty) return

          dispatch({ type: 'SET_SAVING', payload: true })

          try {
            const response = await fetch('/api/store/save', {
              method: 'POST',
              headers: {
                'Content-Type': 'application/json'
              },
              body: JSON.stringify(store)
            })

            if (response.ok) {
              const result = await response.json()
              dispatch({ type: 'SET_LAST_SAVED', payload: new Date() })
              console.log('Tienda guardada:', result.message)
            } else {
              throw new Error('Error al guardar tienda')
            }
          } catch (error) {
            console.error('Error saving store:', error)
            throw error
          } finally {
            dispatch({ type: 'SET_SAVING', payload: false })
          }
        },

        // Cargar tienda
        loadStore: async (storeId: string) => {
          try {
            const response = await fetch(`/api/user/store`)
            if (response.ok) {
              const result = await response.json()
              if (result.success && result.data) {
                get().dispatch({ type: 'SET_STORE', payload: result.data })
              }
            }
          } catch (error) {
            console.error('Error loading store:', error)
            throw error
          }
        },

        // Agregar producto
        addProduct: async (productData) => {
          try {
            const response = await fetch('/api/store/products', {
              method: 'POST',
              headers: {
                'Content-Type': 'application/json'
              },
              body: JSON.stringify(productData)
            })

            if (response.ok) {
              const result = await response.json()
              if (result.success && result.data) {
                get().dispatch({ type: 'ADD_PRODUCT', payload: result.data })
              }
            }
          } catch (error) {
            console.error('Error adding product:', error)
            throw error
          }
        },

        // Actualizar producto
        updateProduct: async (id, updates) => {
          try {
            const response = await fetch(`/api/store/products/${id}`, {
              method: 'PUT',
              headers: {
                'Content-Type': 'application/json'
              },
              body: JSON.stringify(updates)
            })

            if (response.ok) {
              get().dispatch({ type: 'UPDATE_PRODUCT', payload: { id, updates } })
            }
          } catch (error) {
            console.error('Error updating product:', error)
            throw error
          }
        },

        // Eliminar producto
        deleteProduct: async (id) => {
          try {
            const response = await fetch(`/api/store/products/${id}`, {
              method: 'DELETE'
            })

            if (response.ok) {
              get().dispatch({ type: 'DELETE_PRODUCT', payload: id })
            }
          } catch (error) {
            console.error('Error deleting product:', error)
            throw error
          }
        }
      }),
      {
        name: 'store-editor-storage',
        partialize: (state) => ({
          store: state.store,
          theme: state.theme,
          previewMode: state.previewMode,
          sidebarCollapsed: state.sidebarCollapsed
        })
      }
    ),
    { name: 'store-editor' }
  )
)

// Selectores para mejor performance
export const useStoreSettings = () => useStoreEditor((state) => state.store)
export const useStoreProducts = () => useStoreEditor((state) => state.products)
export const useStoreTheme = () => useStoreEditor((state) => state.theme)
export const useStoreIsDirty = () => useStoreEditor((state) => state.isDirty)
export const useStoreIsSaving = () => useStoreEditor((state) => state.isSaving)
export const useStorePreviewMode = () => useStoreEditor((state) => state.previewMode)
export const useStoreSidebarCollapsed = () => useStoreEditor((state) => state.sidebarCollapsed)
