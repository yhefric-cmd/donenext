// 🎯 STORE SIMPLE - NUEVA ESTRUCTURA

import { create } from 'zustand'
import { devtools, persist } from 'zustand/middleware'
import { Store, StoreEditorState, StoreEditorAction } from '@/lib/types/simple'

// Estado inicial
const initialState: Omit<StoreEditorState, 'store'> = {
  isDirty: false,
  isSaving: false
}

// Reducer simple
function storeReducer(
  state: StoreEditorState,
  action: StoreEditorAction
): StoreEditorState {
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
        store: state.store ? { ...state.store, ...action.payload } : null,
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

    default:
      return state
  }
}

// Store principal
export const useSimpleStore = create<StoreEditorState & {
  dispatch: (action: StoreEditorAction) => void
  reset: () => void
  saveStore: () => Promise<void>
  loadStore: () => Promise<void>
}>()(
  devtools(
    persist(
      (set, get) => ({
        // Estado inicial
        store: null,
        ...initialState,

        // Dispatch
        dispatch: (action) => {
          set((state) => storeReducer(state, action))
        },

        // Reset
        reset: () => {
          set({
            store: null,
            ...initialState
          })
        },

        // Guardar tienda
        saveStore: async () => {
          const { store, isDirty, dispatch } = get()
          
          if (!store || !isDirty) return

          dispatch({ type: 'SET_SAVING', payload: true })

          try {
            const response = await fetch('/api/stores', {
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
        loadStore: async () => {
          try {
            const response = await fetch('/api/stores/my-store')
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
        }
      }),
      {
        name: 'simple-store-storage'
      }
    )
  )
)

// Hooks específicos
export const useStore = () => useSimpleStore((state) => state.store)
export const useIsDirty = () => useSimpleStore((state) => state.isDirty)
export const useIsSaving = () => useSimpleStore((state) => state.isSaving)
