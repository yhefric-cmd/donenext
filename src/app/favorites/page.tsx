'use client'

import { useState, useEffect } from 'react'
import { useAuth } from '@/contexts/AuthContext'
import { Heart, ExternalLink, Trash2 } from 'lucide-react'
import Link from 'next/link'

interface Product {
  id: string
  titulo: string
  precio: number
  descripcion?: string
  ciudad_nombre?: string
  fecha_publicacion: string
  img?: string
}

export default function FavoritesPage() {
  const { user } = useAuth()
  const [favorites, setFavorites] = useState<Product[]>([])
  const [isLoading, setIsLoading] = useState(true)
  const [message, setMessage] = useState('')

  useEffect(() => {
    if (user) {
      loadFavorites()
    }
  }, [user])

  const loadFavorites = async () => {
    try {
      const response = await fetch('/api/user/favorites')
      if (response.ok) {
        const data = await response.json()
        setFavorites(data)
      }
    } catch (error) {
      console.error('Error loading favorites:', error)
    } finally {
      setIsLoading(false)
    }
  }

  const handleRemoveFavorite = async (productId: string) => {
    try {
      const response = await fetch(`/api/favorites/${productId}`, {
        method: 'DELETE'
      })

      if (response.ok) {
        setFavorites(favorites.filter(f => f.id !== productId))
        setMessage('Eliminado de favoritos')
        setTimeout(() => setMessage(''), 3000)
      } else {
        setMessage('Error al eliminar de favoritos')
      }
    } catch (error) {
      console.error('Error removing favorite:', error)
      setMessage('Error al eliminar de favoritos')
    }
  }

  const formatPrice = (price: number) => {
    return new Intl.NumberFormat('es-BO', {
      style: 'currency',
      currency: 'BOB'
    }).format(price)
  }

  const formatDate = (dateString: string) => {
    return new Date(dateString).toLocaleDateString('es-BO')
  }

  if (!user) {
    return (
      <div style={{ minHeight: '100vh', display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
        <div>Cargando...</div>
      </div>
    )
  }

  return (
    <div style={{ minHeight: '100vh', backgroundColor: '#f9fafb' }}>
      {/* Header */}
      <div style={{
        background: 'white',
        borderBottom: '1px solid #e5e7eb',
        padding: '1rem 0'
      }}>
        <div style={{
          maxWidth: '1200px',
          margin: '0 auto',
          padding: '0 1rem'
        }}>
          <h1 style={{ fontSize: '1.5rem', fontWeight: '600', color: '#111827' }}>
            Mis Favoritos
          </h1>
        </div>
      </div>

      <div style={{
        maxWidth: '1200px',
        margin: '0 auto',
        padding: '2rem 1rem'
      }}>
        {/* Mensaje */}
        {message && (
          <div style={{
            background: '#ef444420',
            border: '1px solid #ef4444',
            color: '#ef4444',
            padding: '1rem',
            borderRadius: '8px',
            marginBottom: '2rem'
          }}>
            {message}
          </div>
        )}

        {/* Estadísticas */}
        <div style={{
          display: 'grid',
          gridTemplateColumns: 'repeat(auto-fit, minmax(200px, 1fr))',
          gap: '1rem',
          marginBottom: '2rem'
        }}>
          <div style={{
            background: 'white',
            padding: '1.5rem',
            borderRadius: '12px',
            boxShadow: '0 1px 3px rgba(0,0,0,0.1)',
            textAlign: 'center'
          }}>
            <div style={{
              width: '50px',
              height: '50px',
              borderRadius: '50%',
              background: '#ef444420',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              margin: '0 auto 1rem'
            }}>
              <Heart size={20} color="#ef4444" />
            </div>
            <div style={{ fontSize: '2rem', fontWeight: '600', color: '#111827' }}>
              {favorites.length}
            </div>
            <div style={{ fontSize: '0.875rem', color: '#6b7280' }}>
              Favoritos Guardados
            </div>
          </div>
        </div>

        {/* Lista de favoritos */}
        {isLoading ? (
          <div style={{ textAlign: 'center', padding: '2rem' }}>
            Cargando favoritos...
          </div>
        ) : favorites.length === 0 ? (
          <div style={{
            background: 'white',
            padding: '3rem',
            borderRadius: '12px',
            boxShadow: '0 1px 3px rgba(0,0,0,0.1)',
            textAlign: 'center'
          }}>
            <Heart size={48} color="#9ca3af" style={{ marginBottom: '1rem' }} />
            <h3 style={{ fontSize: '1.25rem', fontWeight: '600', color: '#111827', marginBottom: '0.5rem' }}>
              No tienes favoritos
            </h3>
            <p style={{ color: '#6b7280', marginBottom: '2rem' }}>
              Guarda tus productos favoritos para encontrarlos fácilmente
            </p>
            <Link
              href="/"
              style={{
                background: '#ff6b1a',
                color: 'white',
                textDecoration: 'none',
                borderRadius: '8px',
                padding: '0.75rem 1.5rem',
                display: 'inline-flex',
                alignItems: 'center',
                gap: '0.5rem',
                fontSize: '0.95rem',
                fontWeight: '500'
              }}
            >
              Explorar Productos
            </Link>
          </div>
        ) : (
          <div style={{
            display: 'grid',
            gridTemplateColumns: 'repeat(auto-fill, minmax(300px, 1fr))',
            gap: '1.5rem'
          }}>
            {favorites.map((product) => (
              <div key={product.id} style={{
                background: 'white',
                borderRadius: '12px',
                boxShadow: '0 1px 3px rgba(0,0,0,0.1)',
                overflow: 'hidden',
                transition: 'all 0.2s ease'
              }}>
                {/* Imagen */}
                <div style={{
                  height: '200px',
                  background: '#f3f4f6',
                  display: 'flex',
                  alignItems: 'center',
                  justifyContent: 'center',
                  position: 'relative'
                }}>
                  {product.img ? (
                    <img
                      src={`/uploads/products/${product.img}`}
                      alt={product.titulo}
                      style={{
                        width: '100%',
                        height: '100%',
                        objectFit: 'cover'
                      }}
                    />
                  ) : (
                    <Heart size={48} color="#9ca3af" />
                  )}
                  
                  {/* Botón de eliminar favorito */}
                  <button
                    onClick={() => handleRemoveFavorite(product.id)}
                    style={{
                      position: 'absolute',
                      top: '1rem',
                      right: '1rem',
                      background: 'white',
                      color: '#ef4444',
                      border: 'none',
                      borderRadius: '50%',
                      width: '36px',
                      height: '36px',
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'center',
                      cursor: 'pointer',
                      boxShadow: '0 2px 8px rgba(0,0,0,0.1)',
                      transition: 'all 0.2s ease'
                    }}
                    onMouseEnter={(e) => {
                      e.currentTarget.style.background = '#fef2f2'
                      e.currentTarget.style.transform = 'scale(1.1)'
                    }}
                    onMouseLeave={(e) => {
                      e.currentTarget.style.background = 'white'
                      e.currentTarget.style.transform = 'scale(1)'
                    }}
                  >
                    <Heart size={18} fill="#ef4444" />
                  </button>
                </div>

                {/* Información */}
                <div style={{ padding: '1.5rem' }}>
                  <h3 style={{
                    fontSize: '1.125rem',
                    fontWeight: '600',
                    color: '#111827',
                    marginBottom: '0.5rem',
                    lineHeight: '1.4'
                  }}>
                    {product.titulo}
                  </h3>
                  
                  <div style={{
                    fontSize: '1.5rem',
                    fontWeight: '700',
                    color: '#ff6b1a',
                    marginBottom: '1rem'
                  }}>
                    {formatPrice(product.precio)}
                  </div>
                  
                  {product.ciudad_nombre && (
                    <div style={{
                      fontSize: '0.875rem',
                      color: '#6b7280',
                      marginBottom: '0.5rem',
                      display: 'flex',
                      alignItems: 'center',
                      gap: '0.25rem'
                    }}>
                      📍 {product.ciudad_nombre}
                    </div>
                  )}
                  
                  <div style={{
                    fontSize: '0.875rem',
                    color: '#6b7280',
                    marginBottom: '1.5rem'
                  }}>
                    {formatDate(product.fecha_publicacion)}
                  </div>

                  {/* Acciones */}
                  <div style={{
                    display: 'flex',
                    gap: '0.5rem'
                  }}>
                    <Link
                      href={`/products/${product.id}`}
                      style={{
                        flex: 1,
                        background: '#ff6b1a',
                        color: 'white',
                        textDecoration: 'none',
                        borderRadius: '6px',
                        padding: '0.5rem',
                        display: 'flex',
                        alignItems: 'center',
                        justifyContent: 'center',
                        gap: '0.25rem',
                        fontSize: '0.875rem',
                        transition: 'background 0.2s ease'
                      }}
                      onMouseEnter={(e) => {
                        e.currentTarget.style.background = '#e85e00'
                      }}
                      onMouseLeave={(e) => {
                        e.currentTarget.style.background = '#ff6b1a'
                      }}
                    >
                      <ExternalLink size={16} />
                      Ver Producto
                    </Link>
                  </div>
                </div>
              </div>
            ))}
          </div>
        )}
      </div>
    </div>
  )
}
