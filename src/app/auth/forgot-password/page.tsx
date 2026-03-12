'use client'

import { useState } from 'react'
import Link from 'next/link'
import { ArrowLeft, Mail } from 'lucide-react'

export default function ForgotPasswordPage() {
  const [email, setEmail] = useState('')
  const [isLoading, setIsLoading] = useState(false)
  const [message, setMessage] = useState('')

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setIsLoading(true)
    setMessage('')

    try {
      // TODO: Implementar lógica de recuperación de contraseña
      setMessage('Funcionalidad de recuperación de contraseña próximamente.')
    } catch (error) {
      setMessage('Error al procesar la solicitud. Inténtalo de nuevo.')
    } finally {
      setIsLoading(false)
    }
  }

  return (
    <div className="min-h-screen bg-gray-50 flex flex-col justify-center py-12 sm:px-6 lg:px-8">
      <div className="sm:mx-auto sm:w-full sm:max-w-md">
        <div className="bg-white py-8 px-4 shadow sm:rounded-lg sm:px-10">
          {/* Logo y título */}
          <div className="text-center mb-8">
            <Link href="/" className="inline-block">
              <img 
                src="/logo-navbar.svg" 
                alt="DoneBolivia" 
                className="h-12 w-auto mx-auto"
              />
            </Link>
            <h2 className="mt-6 text-3xl font-extrabold text-gray-900">
              Recuperar Contraseña
            </h2>
            <p className="mt-2 text-sm text-gray-600">
              Ingresa tu correo electrónico y te enviaremos las instrucciones
            </p>
          </div>

          {/* Formulario */}
          <form onSubmit={handleSubmit} className="space-y-6">
            <div>
              <label htmlFor="email" className="block text-sm font-medium text-gray-700">
                Correo Electrónico
              </label>
              <div className="mt-1">
                <input
                  id="email"
                  name="email"
                  type="email"
                  autoComplete="email"
                  required
                  value={email}
                  onChange={(e) => setEmail(e.target.value)}
                  className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md placeholder-gray-400 focus:outline-none focus:ring-orange-500 focus:border-orange-500 sm:text-sm"
                  placeholder="tu@email.com"
                />
              </div>
            </div>

            {message && (
              <div className={`p-3 rounded-md text-sm ${
                message.includes('próximamente') 
                  ? 'bg-blue-50 text-blue-800' 
                  : 'bg-red-50 text-red-800'
              }`}>
                {message}
              </div>
            )}

            <div>
              <button
                type="submit"
                disabled={isLoading}
                className="w-full flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-orange-600 hover:bg-orange-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-orange-500 disabled:opacity-50 disabled:cursor-not-allowed"
              >
                {isLoading ? 'Enviando...' : 'Enviar Instrucciones'}
              </button>
            </div>
          </form>

          {/* Link de regreso */}
          <div className="mt-6">
            <div className="flex items-center justify-center">
              <div className="text-sm">
                <Link 
                  href="/auth/login" 
                  className="font-medium text-orange-600 hover:text-orange-500 inline-flex items-center gap-1"
                >
                  <ArrowLeft size={16} />
                  Volver al Login
                </Link>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}
