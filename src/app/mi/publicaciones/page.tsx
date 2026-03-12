'use client'

import { useState, useEffect } from 'react'
import { useAuth } from '@/contexts/AuthContext'
import { Box, Plus, Edit, Trash2, Eye } from 'lucide-react'
import Link from 'next/link'

interface Product {
  id: string
  titulo: string
  precio: number
  descripcion?: string
  estado: string
  fecha_publicacion: string
  img?: string
}

export default function PublicacionesPage() {
  const { user } = useAuth()
  const [products, setProducts] = useState<Product[]>([])
  const [isLoading, setIsLoading] = useState(true)
  const [message, setMessage] = useState('')

  useEffect(() => {
    if (user) {
      loadProducts()
    }
  }, [user])

  const loadProducts = async () => {
    try {
      const response = await fetch('/api/user/products')
      if (response.ok) {
        const data = await response.json()
        setProducts(data)
      }
    } catch (error) {
      console.error('Error loading products:', error)
    } finally {
      setIsLoading(false)
    }
  }

  const handleDeleteProduct = async (productId: string) => {
    if (!confirm('¿Estás seguro de que quieres eliminar esta publicación?')) {
      return
    }

    try {
      const response = await fetch(`/api/products/${productId}`, {
        method: 'DELETE'
      })

      if (response.ok) {
        setProducts(products.filter(p => p.id !== productId))
        setMessage('Publicación eliminada exitosamente')
        setTimeout(() => setMessage(''), 3000)
      } else {
        setMessage('Error al eliminar la publicación')
      }
    } catch (error) {
      console.error('Error deleting product:', error)
      setMessage('Error al eliminar la publicación')
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

  const getStatusColor = (estado: string) => {
    switch (estado) {
      case 'activo':
        return '#10b981'
      case 'pausado':
        return '#f59e0b'
      case 'vendido':
        return '#6b7280'
      default:
        return '#6b7280'
    }
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
          padding: '0 1rem',
          display: 'flex',
          justifyContent: 'space-between',
          alignItems: 'center'
        }}>
          <h1 style={{ fontSize: '1.5rem', fontWeight: '600', color: '#111827' }}>
            Mis Publicaciones
          </h1>
          
          <Link
            href="/products/add"
            style={{
              background: '#ff6b1a',
              color: 'white',
              textDecoration: 'none',
              borderRadius: '8px',
              padding: '0.75rem 1.5rem',
              display: 'flex',
              alignItems: 'center',
              gap: '0.5rem',
              fontSize: '0.95rem',
              fontWeight: '500',
              transition: 'all 0.2s ease'
            }}
            onMouseEnter={(e) => {
              e.currentTarget.style.background = '#e85e00'
            }}
            onMouseLeave={(e) => {
              e.currentTarget.style.background = '#ff6b1a'
            }}
          >
            <Plus size={18} />
            Nueva Publicación
          </Link>
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
            background: message.includes('eliminada') ? '#10b98120' : '#ef444420',
            border: `1px solid ${message.includes('eliminada') ? '#10b981' : '#ef4444'}`,
            color: message.includes('eliminada') ? '#10b981' : '#ef4444',
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
              background: '#ff6b1a20',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              margin: '0 auto 1rem'
            }}>
              <Box size={20} color="#ff6b1a" />
            </div>
            <div style={{ fontSize: '2rem', fontWeight: '600', color: '#111827' }}>
              {products.length}
            </div>
            <div style={{ fontSize: '0.875rem', color: '#6b7280' }}>
              Total Publicaciones
            </div>
          </div>
        </div>

        {/* Lista de productos */}
        {isLoading ? (
          <div style={{ textAlign: 'center', padding: '2rem' }}>
            Cargando publicaciones...
          </div>
        ) : products.length === 0 ? (
          <div style={{
            background: 'white',
            padding: '3rem',
            borderRadius: '12px',
            boxShadow: '0 1px 3px rgba(0,0,0,0.1)',
            textAlign: 'center'
          }}>
            <Box size={48} color="#9ca3af" style={{ marginBottom: '1rem' }} />
            <h3 style={{ fontSize: '1.25rem', fontWeight: '600', color: '#111827', marginBottom: '0.5rem' }}>
              No tienes publicaciones
            </h3>
            <p style={{ color: '#6b7280', marginBottom: '2rem' }}>
              Comienza vendiendo creando tu primera publicación
            </p>
            <Link
              href="/products/add"
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
              <Plus size={18} />
              Crear Primera Publicación
            </Link>
          </div>
        ) : (
          <div style={{
            display: 'grid',
            gridTemplateColumns: 'repeat(auto-fill, minmax(300px, 1fr))',
            gap: '1.5rem'
          }}>
            {products.map((product) => (
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
                    <Box size={48} color="#9ca3af" />
                  )}
                  
                  {/* Badge de estado */}
                  <div style={{
                    position: 'absolute',
                    top: '1rem',
                    right: '1rem',
                    background: getStatusColor(product.estado),
                    color: 'white',
                    padding: '0.25rem 0.75rem',
                    borderRadius: '9999px',
                    fontSize: '0.75rem',
                    fontWeight: '500',
                    textTransform: 'capitalize'
                  }}>
                    {product.estado}
                  </div>
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
                        background: '#f3f4f6',
                        color: '#374151',
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
                        e.currentTarget.style.background = '#e5e7eb'
                      }}
                      onMouseLeave={(e) => {
                        e.currentTarget.style.background = '#f3f4f6'
                      }}
                    >
                      <Eye size={16} />
                      Ver
                    </Link>
                    
                    <Link
                      href={`/products/${product.id}/edit`}
                      style={{
                        flex: 1,
                        background: '#3b82f6',
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
                        e.currentTarget.style.background = '#2563eb'
                      }}
                      onMouseLeave={(e) => {
                        e.currentTarget.style.background = '#3b82f6'
                      }}
                    >
                      <Edit size={16} />
                      Editar
                    </Link>
                    
                    <button
                      onClick={() => handleDeleteProduct(product.id)}
                      style={{
                        flex: 1,
                        background: '#ef4444',
                        color: 'white',
                        border: 'none',
                        borderRadius: '6px',
                        padding: '0.5rem',
                        display: 'flex',
                        alignItems: 'center',
                        justifyContent: 'center',
                        gap: '0.25rem',
                        fontSize: '0.875rem',
                        cursor: 'pointer',
                        transition: 'background 0.2s ease'
                      }}
                      onMouseEnter={(e) => {
                        e.currentTarget.style.background = '#dc2626'
                      }}
                      onMouseLeave={(e) => {
                        e.currentTarget.style.background = '#ef4444'
                      }}
                    >
                      <Trash2 size={16} />
                      Eliminar
                    </button>
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
