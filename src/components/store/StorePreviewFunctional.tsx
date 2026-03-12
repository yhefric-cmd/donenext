'use client'

import { useState, useEffect, useRef } from 'react'
import { motion } from 'framer-motion'
import { useStoreSettings, useStoreProducts, useStoreTheme } from '@/lib/store/store-store'
import { cn } from '@/lib/utils/cn'

interface StorePreviewFunctionalProps {
  mode: 'desktop' | 'tablet' | 'mobile'
}

export default function StorePreviewFunctional({ mode }: StorePreviewFunctionalProps) {
  const store = useStoreSettings()
  const products = useStoreProducts()
  const theme = useStoreTheme()
  const [isLoading, setIsLoading] = useState(false)

  const previewFrameRef = useRef<HTMLIFrameElement>(null)

  const previewSizes = {
    desktop: { width: '100%', maxWidth: '1200px', height: '800px' },
    tablet: { width: '768px', height: '800px' },
    mobile: { width: '375px', height: '812px' }
  }

  const currentSize = previewSizes[mode as keyof typeof previewSizes]

  // Generate store URL with cache-busting y editor_mode
  const getStoreUrl = () => {
    const baseUrl = `/tienda/${store.slug || 'preview'}`
    const timestamp = Date.now()
    return `${baseUrl}?editor_mode=1&v=${timestamp}`
  }

  // Handle iframe load
  const handleFrameLoad = () => {
    setIsLoading(false)
  }

  // Reload preview
  const reloadPreview = () => {
    setIsLoading(true)
    if (previewFrameRef.current) {
      previewFrameRef.current.src = getStoreUrl()
    }
  }

  // Auto reload when store data changes
  useEffect(() => {
    reloadPreview()
  }, [store, products, theme, mode])

  return (
    <div className="flex-1 bg-gray-100 p-6 overflow-auto">
      <div className="flex justify-center">
        <motion.div
          initial={{ opacity: 0, scale: 0.95 }}
          animate={{ opacity: 1, scale: 1 }}
          transition={{ duration: 0.3 }}
          className="bg-white rounded-lg shadow-xl overflow-hidden"
          style={{
            width: currentSize.width,
            height: currentSize.height || '800px'
          }}
        >
          {/* Preview Header */}
          <div className="bg-gray-50 px-4 py-2 border-b flex items-center justify-between">
            <div className="flex items-center space-x-2">
              <div className="w-3 h-3 rounded-full bg-red-500"></div>
              <div className="w-3 h-3 rounded-full bg-yellow-500"></div>
              <div className="w-3 h-3 rounded-full bg-green-500"></div>
            </div>
            <div className="text-sm text-gray-600 font-medium">
              {store.nombre || 'Preview'}
            </div>
            <div className="w-16"></div>
          </div>

          {/* Loading State */}
          {isLoading && (
            <div className="flex items-center justify-center h-96">
              <div className="text-center">
                <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600 mx-auto mb-4"></div>
                <p className="text-gray-600">Cargando vista previa...</p>
              </div>
            </div>
          )}

          {/* Iframe Preview */}
          <iframe
            ref={previewFrameRef}
            src={getStoreUrl()}
            className="w-full h-full border-0"
            onLoad={handleFrameLoad}
            style={{ 
              display: isLoading ? 'none' : 'block',
              height: currentSize.height ? `${parseInt(currentSize.height) - 40}px` : '760px'
            }}
          />
        </motion.div>
      </div>
    </div>
  )
}
