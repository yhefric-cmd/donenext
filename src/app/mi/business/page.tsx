'use client'

import { useAuth } from '@/contexts/AuthContext'
import { Store } from 'lucide-react'
import Link from 'next/link'

export default function BusinessPage() {
  const { user } = useAuth()

  return (
    <div className="min-h-screen bg-gray-50">
      <div className="max-w-4xl mx-auto py-12 px-4">
        {/* Header */}
        <div className="text-center mb-12">
          <h1 className="text-4xl font-bold text-gray-900 mb-4">
            Mi Negocio
          </h1>
          <p className="text-xl text-gray-600">
            Gestiona tu tienda virtual en DoneBolivia
          </p>
        </div>

        {/* Tarjeta principal */}
        <div className="bg-white rounded-xl shadow-lg p-8">
          <div className="flex items-center justify-center mb-6">
            <div className="w-16 h-16 bg-orange-100 rounded-full flex items-center justify-center">
              <Store size={32} className="text-orange-600" />
            </div>
          </div>

          <div className="text-center">
            <h2 className="text-2xl font-semibold text-gray-900 mb-4">
              Bienvenido a tu Panel de Negocio
            </h2>
            
            <p className="text-gray-600 mb-8">
              Aquí podrás gestionar tu tienda virtual, ver estadísticas, 
              administrar productos y mucho más.
            </p>

            {/* Enlace al editor (futuro) */}
            <div className="bg-gray-50 rounded-lg p-6">
              <h3 className="text-lg font-medium text-gray-900 mb-2">
                Editor de Tienda
              </h3>
              <p className="text-gray-600 mb-4">
                Accede al editor para personalizar tu tienda virtual
              </p>
              <Link
                href="/mi/business/editor"
                className="inline-flex items-center gap-2 bg-orange-600 text-white px-6 py-3 rounded-lg hover:bg-orange-700 transition-colors"
              >
                <Store size={20} />
                Ir al Editor
              </Link>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}
