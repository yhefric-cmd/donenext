'use client'

import React, { useState, useEffect } from 'react'
import { use } from 'react'
import { notFound } from 'next/navigation'
import chroma from 'chroma-js'
import { useStoreSettings } from '@/lib/store/store-store'

interface StorePageProps {
  params: Promise<{ slug: string }>
  searchParams: Promise<{ editor_mode?: string }>
}

export default function StorePage({ params, searchParams }: StorePageProps) {
  const { slug } = use(params)
  const { editor_mode } = use(searchParams)
  
  // Obtener datos de la tienda desde la API
  const [store, setStore] = useState<any>(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    async function fetchStoreData() {
      try {
        const response = await fetch(`/api/store/${slug}`)
        const result = await response.json()
        
        if (result.success) {
          setStore(result.data)
        } else {
          setError(result.error || 'Error cargando tienda')
        }
      } catch (err) {
        setError('Error de conexión')
      } finally {
        setLoading(false)
      }
    }

    fetchStoreData()
  }, [slug])

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="text-center">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600 mx-auto mb-4"></div>
          <p className="text-gray-600">Cargando tienda...</p>
        </div>
      </div>
    )
  }

  if (error || !store) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="text-center">
          <h1 className="text-2xl font-bold text-gray-900 mb-4">Tienda no encontrada</h1>
          <p className="text-gray-600">{error || 'La tienda solicitada no existe'}</p>
        </div>
      </div>
    )
  }

  // Calcular color de texto con contraste inteligente
  const getTextColor = (backgroundColor: string) => {
    const color = chroma(backgroundColor)
    const luminance = color.luminance()
    return luminance > 0.5 ? '#000000' : '#FFFFFF'
  }

  const navbarColor = store.color_primario || '#22226B'
  const textColor = getTextColor(navbarColor)
  const isEditorMode = editor_mode === '1'

  return (
    <div className="min-h-screen" style={{ backgroundColor: '#ffffff' }}>
      {/* Navbar Principal */}
      <nav 
        className="sticky top-0 z-50 shadow-md"
        style={{ backgroundColor: navbarColor }}
      >
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex justify-between items-center h-16">
            {/* Logo y Nombre a la izquierda */}
            <div className="flex items-center space-x-3">
              {store.mostrar_logo && store.logo_principal && (
                <img 
                  src={store.logo_principal} 
                  alt={store.nombre}
                  className="h-8 w-auto"
                />
              )}
              {store.mostrar_nombre && (
                <h1 
                  className="text-xl font-bold"
                  style={{ color: textColor }}
                >
                  {store.nombre}
                </h1>
              )}
            </div>

            {/* Navegación */}
            <div className="hidden md:flex space-x-8">
              <a 
                href="#inicio" 
                className="font-medium transition-colors hover:opacity-80"
                style={{ color: textColor }}
              >
                Inicio
              </a>
              <a 
                href="#contacto" 
                className="font-medium transition-colors hover:opacity-80"
                style={{ color: textColor }}
              >
                Contáctanos
              </a>
              <a 
                href="#acerca" 
                className="font-medium transition-colors hover:opacity-80"
                style={{ color: textColor }}
              >
                Acerca de Nosotros
              </a>
            </div>

            {/* Mobile menu button */}
            <div className="md:hidden">
              <button
                className="p-2 rounded-md"
                style={{ color: textColor }}
              >
                <svg className="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 6h16M4 12h16M4 18h16" />
                </svg>
              </button>
            </div>
          </div>
        </div>
      </nav>

      {/* Hero Section */}
      <section id="inicio" className="py-20 px-4">
        <div className="max-w-7xl mx-auto text-center">
          <h2 className="text-4xl font-bold text-gray-900 mb-4">
            Bienvenido a {store.nombre}
          </h2>
          <p className="text-xl text-gray-600 mb-8">
            {store.descripcion || 'Descubre nuestros productos exclusivos'}
          </p>
          <button 
            className="px-8 py-3 rounded-lg font-medium text-white transition-colors hover:opacity-90"
            style={{ backgroundColor: navbarColor }}
          >
            Ver Productos
          </button>
        </div>
      </section>

      {/* Products Section */}
      <section className="py-16 px-4 bg-gray-50">
        <div className="max-w-7xl mx-auto">
          <h3 className="text-2xl font-bold text-gray-900 mb-8 text-center">
            Nuestros Productos
          </h3>
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            {store.productos && store.productos.length > 0 ? (
              store.productos.map((product: any) => (
                <div key={product.id} className="bg-white rounded-lg shadow-md overflow-hidden">
                  <div className="h-48 bg-gray-200 flex items-center justify-center">
                    {product.imagen_principal ? (
                      <img 
                        src={product.imagen_principal} 
                        alt={product.titulo}
                        className="w-full h-full object-cover"
                      />
                    ) : (
                      <span className="text-gray-400">Producto</span>
                    )}
                  </div>
                  <div className="p-4">
                    <h4 className="font-semibold text-gray-900 mb-2">{product.titulo}</h4>
                    <p className="text-2xl font-bold" style={{ color: navbarColor }}>
                      ${product.precio}
                    </p>
                  </div>
                </div>
              ))
            ) : (
              <div className="col-span-full text-center py-12">
                <i className="fas fa-box-open text-6xl text-gray-300 mb-4"></i>
                <p className="text-gray-500">No hay productos publicados aún.</p>
              </div>
            )}
          </div>
        </div>
      </section>

      {/* Contact Section */}
      <section id="contacto" className="py-16 px-4">
        <div className="max-w-7xl mx-auto">
          <h3 className="text-2xl font-bold text-gray-900 mb-8 text-center">
            Contáctanos
          </h3>
          <div className="max-w-2xl mx-auto">
            <form className="space-y-6">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Nombre
                </label>
                <input
                  type="text"
                  className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                  placeholder="Tu nombre"
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Email
                </label>
                <input
                  type="email"
                  className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                  placeholder="tu@email.com"
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Mensaje
                </label>
                <textarea
                  className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                  rows={4}
                  placeholder="Tu mensaje..."
                />
              </div>
              <button
                type="submit"
                className="w-full py-3 rounded-lg font-medium text-white transition-colors hover:opacity-90"
                style={{ backgroundColor: navbarColor }}
              >
                Enviar Mensaje
              </button>
            </form>
          </div>
        </div>
      </section>

      {/* About Section */}
      <section id="acerca" className="py-16 px-4 bg-gray-50">
        <div className="max-w-7xl mx-auto">
          <h3 className="text-2xl font-bold text-gray-900 mb-8 text-center">
            Acerca de Nosotros
          </h3>
          <div className="max-w-3xl mx-auto text-center">
            <p className="text-lg text-gray-600 mb-6">
              Somos {store.nombre}, tu tienda de confianza para productos de calidad. 
              Nos apasiona ofrecer la mejor experiencia de compra con productos seleccionados 
              y un servicio excepcional.
            </p>
            <p className="text-lg text-gray-600">
              Nuestra misión es brindarte productos que mejoren tu vida diaria, 
              con la calidad y atención que mereces.
            </p>
          </div>
        </div>
      </section>

      {/* Footer */}
      <footer className="bg-gray-900 text-white py-8 px-4">
        <div className="max-w-7xl mx-auto text-center">
          <p>&copy; 2024 {store.nombre}. Todos los derechos reservados.</p>
        </div>
      </footer>

      {/* Editor Mode Indicator */}
      {isEditorMode && (
        <div className="fixed top-20 right-4 bg-yellow-500 text-black px-3 py-1 rounded-full text-sm font-medium z-50">
          Modo Editor
        </div>
      )}
    </div>
  )
}
