'use client'

import { useState, useEffect } from 'react'
import { motion, AnimatePresence } from 'framer-motion'
import { useStoreEditor, useStoreSettings, useStoreProducts, useStoreTheme } from '@/lib/store/store-store'
import { cn } from '@/lib/utils/cn'
import { Monitor, Smartphone, Eye, Loader2 } from 'lucide-react'
import StorePreviewFunctional from './StorePreviewFunctional'
import BrandIdentityVacio from './sections/BrandIdentityVacio'
import { useAuth } from '@/contexts/AuthContext'

interface StoreEditorFunctionalProps {
  initialStoreId?: string;
  collapsed: boolean;
}

export default function StoreEditorFunctional({ initialStoreId, collapsed }: StoreEditorFunctionalProps) {
  const { user } = useAuth()
  const { dispatch, isSaving, lastSaved, previewMode } = useStoreEditor()
  const sidebarCollapsed = collapsed; // Usar la prop en lugar del estado global
  const store = useStoreSettings()
  const products = useStoreProducts()
  const theme = useStoreTheme()
  const [activeSection, setActiveSection] = useState('brand')
  const [isLoading, setIsLoading] = useState(true)

  // Cargar tienda del usuario al iniciar
  useEffect(() => {
    async function loadUserStore() {
      if (!user) return
      
      try {
        setIsLoading(true)
        
        // Obtener tienda del usuario
        const response = await fetch('/api/user/store')
        const result = await response.json()
        
        if (result.success && result.store) {
          // Cargar tienda completa
          const storeResponse = await fetch(`/api/store/${result.store.slug}`)
          const storeResult = await storeResponse.json()
          
          if (storeResult.success && storeResult.data) {
            dispatch({ type: 'SET_STORE', payload: storeResult.data })
          }
        }
      } catch (error) {
        console.error('Error cargando tienda:', error)
      } finally {
        setIsLoading(false)
      }
    }

    loadUserStore()
  }, [user, dispatch])

  // Auto-save
  useEffect(() => {
    const timeoutId = setTimeout(() => {
      const editorState = useStoreEditor.getState()
      if (editorState.isDirty && !isSaving) {
        editorState.saveStore()
      }
    }, 2000)

    return () => clearTimeout(timeoutId)
  }, [isSaving])

  const sidebarSections = [
    {
      id: 'brand',
      label: 'Identidad Visual',
      icon: '🎨',
      component: BrandIdentityVacio
    }
  ]

  const ActiveComponent = sidebarSections.find(s => s.id === activeSection)?.component

  if (isLoading) {
    return (
      <div className="flex h-screen bg-gray-50">
        <div className="flex-1 flex items-center justify-center">
          <div className="text-center">
            <Loader2 className="w-8 h-8 animate-spin text-blue-600 mx-auto mb-4" />
            <p className="text-gray-600">Cargando editor...</p>
          </div>
        </div>
      </div>
    )
  }

  return (
    <div className="flex h-screen bg-gray-50">
      {/* Sidebar */}
      <AnimatePresence>
        {!sidebarCollapsed && (
          <motion.div
            initial={{ width: 0, opacity: 0 }}
            animate={{ width: 320, opacity: 1 }}
            exit={{ width: 0, opacity: 0 }}
            transition={{ duration: 0.3, ease: "easeInOut" }}
            className="bg-white border-r border-gray-200 overflow-hidden flex flex-col"
          >
            {/* Sidebar Header */}
            <div className="p-4 border-b border-gray-200">
              <div className="flex items-center justify-between">
                <h2 className="text-lg font-semibold text-gray-900">Editor de Tienda</h2>
                <button
                  onClick={() => dispatch({ type: 'TOGGLE_SIDEBAR' })}
                  className="p-1 hover:bg-gray-100 rounded"
                >
                  <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M11 19l-7-7 7-7m8 14l-7-7 7-7" />
                  </svg>
                </button>
              </div>
              
              {/* Store Name */}
              <div className="mt-3">
                <input
                  type="text"
                  value={store.nombre || ''}
                  onChange={(e) => dispatch({ type: 'UPDATE_STORE', payload: { nombre: e.target.value } })}
                  className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                  placeholder="Nombre de la tienda"
                />
              </div>
            </div>

            {/* Sidebar Navigation */}
            <div className="flex-1 overflow-y-auto p-4">
              <div className="space-y-2">
                {sidebarSections.map((section) => (
                  <button
                    key={section.id}
                    onClick={() => setActiveSection(section.id)}
                    className={cn(
                      "w-full text-left px-4 py-3 rounded-lg transition-all duration-200",
                      "flex items-center gap-3",
                      activeSection === section.id
                        ? "bg-blue-50 text-blue-600 border border-blue-200"
                        : "hover:bg-gray-50 text-gray-700"
                    )}
                  >
                    <span className="text-xl">{section.icon}</span>
                    <span className="font-medium">{section.label}</span>
                  </button>
                ))}
              </div>
            </div>

            {/* Sidebar Footer */}
            <div className="p-4 border-t border-gray-200">
              <div className="text-sm text-gray-500 text-center">
                {isSaving ? (
                  <span className="flex items-center gap-2">
                    <Loader2 className="w-4 h-4 animate-spin" />
                    Guardando...
                  </span>
                ) : lastSaved ? (
                  <span>Guardado {lastSaved.toLocaleTimeString()}</span>
                ) : (
                  <span>No hay cambios</span>
                )}
              </div>
            </div>
          </motion.div>
        )}
      </AnimatePresence>

      {/* Toggle Sidebar Button */}
      {sidebarCollapsed && (
        <div className="w-12 bg-white border-r border-gray-200 flex flex-col items-center py-4 space-y-4">
          <button
            onClick={() => dispatch({ type: 'TOGGLE_SIDEBAR' })}
            className="p-2 hover:bg-gray-100 rounded"
          >
            <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13 5l7 7-7 7M5 5l7 7-7 7" />
            </svg>
          </button>
          
          {sidebarSections.map((section) => (
            <button
              key={section.id}
              onClick={() => setActiveSection(section.id)}
              className={cn(
                "p-2 rounded transition-all duration-200",
                activeSection === section.id
                  ? "bg-blue-50 text-blue-600"
                  : "hover:bg-gray-50 text-gray-700"
              )}
              title={section.label}
            >
              <span className="text-lg">{section.icon}</span>
            </button>
          ))}
        </div>
      )}

      {/* Main Content */}
      <div className="flex-1 flex flex-col">
        {/* Header */}
        <header className="bg-white border-b border-gray-200 px-6 py-4 flex items-center justify-between" style={{ backgroundColor: '#22226B' }}>
          <div className="flex items-center gap-4">
            <h1 className="text-xl font-semibold text-white">Editor de Tienda</h1>
            <span className="text-white/70 text-sm">
              {store.nombre || 'Sin nombre'}
            </span>
          </div>
          
          {/* Preview Controls */}
          <div className="flex items-center gap-2">
            <button
              onClick={() => dispatch({ type: 'SET_PREVIEW_MODE', payload: 'desktop' })}
              className={cn(
                "p-2 rounded transition-all duration-200",
                previewMode === 'desktop'
                  ? "bg-white/20 text-white"
                  : "text-white/70 hover:text-white hover:bg-white/10"
              )}
              title="Vista escritorio"
            >
              <Monitor className="w-5 h-5" />
            </button>
            <button
              onClick={() => dispatch({ type: 'SET_PREVIEW_MODE', payload: 'mobile' })}
              className={cn(
                "p-2 rounded transition-all duration-200",
                previewMode === 'mobile'
                  ? "bg-white/20 text-white"
                  : "text-white/70 hover:text-white hover:bg-white/10"
              )}
              title="Vista móvil"
            >
              <Smartphone className="w-5 h-5" />
            </button>
            <button
              onClick={() => window.open(`/tienda/${store.slug || 'preview'}`, '_blank')}
              className="p-2 rounded text-white/70 hover:text-white hover:bg-white/10 transition-all duration-200"
              title="Ver tienda en nueva pestaña"
            >
              <Eye className="w-5 h-5" />
            </button>
          </div>
        </header>

        {/* Editor Content */}
        <div className="flex-1 flex">
          {/* Form Section */}
          <div className="w-96 bg-white border-r border-gray-200 overflow-y-auto">
            {ActiveComponent && <ActiveComponent />}
          </div>

          {/* Preview Section */}
          <StorePreviewFunctional mode={previewMode} />
        </div>
      </div>
    </div>
  )
}
