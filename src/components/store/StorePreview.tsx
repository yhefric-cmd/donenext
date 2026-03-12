'use client'

import { useState } from 'react'
import { motion } from 'framer-motion'
import { useStoreSettings, useStoreProducts, useStoreTheme } from '@/lib/store/store-store'
import { cn } from '@/lib/utils/cn'

interface StorePreviewProps {
  mode: 'desktop' | 'tablet' | 'mobile'
}

export default function StorePreview({ mode }: StorePreviewProps) {
  const store = useStoreSettings()
  const products = useStoreProducts()
  const theme = useStoreTheme()

  const previewSizes = {
    desktop: { width: '100%', maxWidth: '1200px' },
    tablet: { width: '768px' },
    mobile: { width: '375px' }
  }

  const currentSize = previewSizes[mode]

  return (
    <div className="flex justify-center">
      <motion.div
        key={mode}
        initial={{ opacity: 0, scale: 0.95 }}
        animate={{ opacity: 1, scale: 1 }}
        transition={{ duration: 0.3 }}
        className={cn(
          'bg-white rounded-lg shadow-xl overflow-hidden',
          'border border-gray-200',
          mode === 'mobile' ? 'h-[812px]' : 'min-h-[800px]'
        )}
        style={{
          width: currentSize.width,
          ...(mode === 'mobile' && { height: '812px' })
        }}
      >
        {/* Store Preview Content */}
        <div 
          className="h-full overflow-y-auto"
          style={{ 
            backgroundColor: theme.colores.fondo,
            fontFamily: theme.fuentes.principal,
            color: theme.colores.texto
          }}
        >
          {/* Navbar Preview */}
          <StoreNavbarPreview />
          
          {/* Hero Section */}
          <StoreHeroPreview />
          
          {/* Products Grid */}
          <StoreProductsPreview products={products} />
          
          {/* Footer */}
          <StoreFooterPreview />
        </div>
      </motion.div>
    </div>
  )
}

// Componentes de preview internos
function StoreNavbarPreview() {
  const store = useStoreSettings()
  const theme = useStoreTheme()

  const navbarStyles = {
    blanco: 'bg-white border-b border-gray-200',
    transparente: 'bg-transparent absolute top-0 left-0 right-0 z-10',
    color: 'bg-blue-600 text-white'
  }

  return (
    <nav className={cn(
      'h-16 flex items-center justify-between px-6',
      navbarStyles[store.navbar_style] || navbarStyles.blanco
    )}>
      {/* Logo */}
      <div className="flex items-center gap-3">
        {store.logo ? (
          <img 
            src={`/uploads/logos/${store.logo}`} 
            alt={store.nombre}
            className="w-10 h-10 rounded-lg object-cover"
          />
        ) : (
          <div 
            className="w-10 h-10 rounded-lg flex items-center justify-center text-white font-bold"
            style={{ backgroundColor: theme.colores.primario }}
          >
            {store.nombre.charAt(0)}
          </div>
        )}
        <span className="font-semibold text-lg">{store.nombre}</span>
      </div>

      {/* Navigation Links */}
      <div className="hidden md:flex items-center gap-6">
        {store.menu_items?.slice(0, 4).map((item) => (
          <button
            key={item.id}
            className="hover:opacity-80 transition-opacity"
            style={{ color: store.navbar_style === 'color' ? 'white' : theme.colores.texto }}
          >
            {item.label}
          </button>
        ))}
      </div>

      {/* Contact Button */}
      <button
        className="px-4 py-2 rounded-lg font-medium transition-colors"
        style={{
          backgroundColor: theme.colores.secundario,
          color: 'white'
        }}
      >
        Contactar
      </button>
    </nav>
  )
}

function StoreHeroPreview() {
  const store = useStoreSettings()
  const theme = useStoreTheme()

  return (
    <div className="relative h-96 bg-gradient-to-br from-blue-50 to-indigo-100 overflow-hidden">
      {store.banner_images?.[0] ? (
        <img
          src={`/uploads/banners/${store.banner_images[0]}`}
          alt="Banner"
          className="w-full h-full object-cover"
        />
      ) : (
        <div className="absolute inset-0 flex items-center justify-center">
          <div className="text-center">
            <h1 
              className="text-4xl font-bold mb-4"
              style={{ color: theme.colores.primario }}
            >
              {store.nombre || 'Mi Tienda'}
            </h1>
            <p className="text-lg text-gray-600 max-w-md mx-auto">
              {store.descripcion || 'Descubre nuestros productos'}
            </p>
          </div>
        </div>
      )}
    </div>
  )
}

function StoreProductsPreview({ products }: { products: any[] }) {
  const store = useStoreSettings()
  const theme = useStoreTheme()

  const gridCols = {
    1: 'grid-cols-1',
    2: 'grid-cols-2',
    3: 'grid-cols-3',
    4: 'grid-cols-4'
  }

  return (
    <div className="p-6">
      <h2 className="text-2xl font-bold mb-6" style={{ color: theme.colores.primario }}>
        Nuestros Productos
      </h2>
      
      <div className={cn(
        'grid gap-6',
        gridCols[store.grid_density] || gridCols[3]
      )}>
        {products.slice(0, 6).map((product) => (
          <motion.div
            key={product.id}
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            className="bg-white rounded-lg shadow-md overflow-hidden hover:shadow-lg transition-shadow"
          >
            {/* Product Image */}
            <div className="h-48 bg-gray-100 flex items-center justify-center">
              {product.imagenes?.[0] ? (
                <img
                  src={`/uploads/products/${product.imagenes[0].nombre_archivo}`}
                  alt={product.titulo}
                  className="w-full h-full object-cover"
                />
              ) : (
                <div className="text-gray-400">
                  <svg className="w-12 h-12" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z" />
                  </svg>
                </div>
              )}
            </div>
            
            {/* Product Info */}
            <div className="p-4">
              <h3 className="font-semibold text-gray-900 mb-2">{product.titulo}</h3>
              <p className="text-2xl font-bold mb-2" style={{ color: theme.colores.secundario }}>
                ${product.precio}
              </p>
              <button
                className="w-full py-2 rounded-lg font-medium transition-colors"
                style={{
                  backgroundColor: theme.colores.primario,
                  color: 'white'
                }}
              >
                Ver Detalles
              </button>
            </div>
          </motion.div>
        ))}
      </div>
    </div>
  )
}

function StoreFooterPreview() {
  const store = useStoreSettings()
  const theme = useStoreTheme()

  return (
    <div className="bg-gray-900 text-white p-8 mt-12">
      <div className="max-w-6xl mx-auto grid grid-cols-1 md:grid-cols-4 gap-8">
        <div>
          <h3 className="font-semibold mb-4">{store.nombre}</h3>
          <p className="text-gray-400 text-sm">{store.descripcion}</p>
        </div>
        
        <div>
          <h4 className="font-semibold mb-4">Contacto</h4>
          <p className="text-gray-400 text-sm">{store.telefono}</p>
          <p className="text-gray-400 text-sm">{store.email}</p>
        </div>
        
        <div>
          <h4 className="font-semibold mb-4">Ubicación</h4>
          <p className="text-gray-400 text-sm">{store.ciudad}</p>
          <p className="text-gray-400 text-sm">{store.departamento}</p>
        </div>
        
        <div>
          <h4 className="font-semibold mb-4">Síguenos</h4>
          <div className="flex gap-4">
            {store.facebook_url && (
              <button className="text-gray-400 hover:text-white transition-colors">
                Facebook
              </button>
            )}
            {store.instagram_url && (
              <button className="text-gray-400 hover:text-white transition-colors">
                Instagram
              </button>
            )}
          </div>
        </div>
      </div>
      
      <div className="text-center mt-8 pt-8 border-t border-gray-800">
        <p className="text-gray-400 text-sm">
          © 2024 {store.nombre}. Todos los derechos reservados.
        </p>
      </div>
    </div>
  )
}
