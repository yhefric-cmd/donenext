'use client'

import { useState, useEffect } from 'react'
import { useAuth } from '@/contexts/AuthContext'
import { User, MapPin, Phone, Mail, Box, Heart, Edit } from 'lucide-react'

interface Product {
  id: string
  titulo: string
  precio: number
  imagen_principal?: string
  fecha_publicacion: string
}

interface UserStats {
  total_productos: number
  total_favoritos: number
  productos: Product[]
  favoritos: Product[]
}

export default function PerfilPage() {
  const { user, updateUser } = useAuth()
  const [stats, setStats] = useState<UserStats | null>(null)
  const [isLoading, setIsLoading] = useState(true)
  const [isEditing, setIsEditing] = useState(false)
  const [formData, setFormData] = useState({
    nombre: '',
    email: '',
    telefono: '',
    ciudad: '',
    departamento: ''
  })

  useEffect(() => {
    if (user) {
      setFormData({
        nombre: user.fullName,
        email: user.email,
        telefono: user.phone,
        ciudad: '', // No existe en el nuevo schema
        departamento: '' // No existe en el nuevo schema
      })
      loadUserStats()
    }
  }, [user])

  const loadUserStats = async () => {
    try {
      const [productosRes, favoritosRes] = await Promise.all([
        fetch('/api/user/products'),
        fetch('/api/user/favorites')
      ])

      const productos = productosRes.ok ? await productosRes.json() : []
      const favoritos = favoritosRes.ok ? await favoritosRes.json() : []

      setStats({
        total_productos: productos.length,
        total_favoritos: favoritos.length,
        productos: productos,
        favoritos: favoritos
      })
    } catch (error) {
      console.error('Error loading stats:', error)
    } finally {
      setIsLoading(false)
    }
  }

  const handleSaveProfile = async () => {
    try {
      const response = await fetch('/api/user/profile', {
        method: 'PUT',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(formData)
      })

      if (response.ok) {
        const result = await response.json()
        updateUser(result.user)
        setIsEditing(false)
      }
    } catch (error) {
      console.error('Error saving profile:', error)
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
            Mi Perfil
          </h1>
        </div>
      </div>

      <div style={{
        maxWidth: '1200px',
        margin: '0 auto',
        padding: '2rem 1rem'
      }}>
        <div style={{
          display: 'grid',
          gridTemplateColumns: '1fr 2fr',
          gap: '2rem'
        }}>
          {/* Card de información del usuario */}
          <div style={{
            background: 'white',
            borderRadius: '12px',
            padding: '2rem',
            boxShadow: '0 1px 3px rgba(0,0,0,0.1)'
          }}>
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '1.5rem' }}>
              <h2 style={{ fontSize: '1.25rem', fontWeight: '600', color: '#111827' }}>
                Información Personal
              </h2>
              <button
                onClick={() => setIsEditing(!isEditing)}
                style={{
                  background: isEditing ? '#ef4444' : '#ff6b1a',
                  color: 'white',
                  border: 'none',
                  borderRadius: '8px',
                  padding: '0.5rem 1rem',
                  cursor: 'pointer',
                  display: 'flex',
                  alignItems: 'center',
                  gap: '0.5rem',
                  fontSize: '0.875rem'
                }}
              >
                <Edit size={16} />
                {isEditing ? 'Cancelar' : 'Editar'}
              </button>
            </div>

            {/* Foto de perfil */}
            <div style={{ textAlign: 'center', marginBottom: '2rem' }}>
              <div style={{
                width: '120px',
                height: '120px',
                borderRadius: '50%',
                background: '#ff6b1a',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                margin: '0 auto 1rem'
              }}>
                <User size={48} color="white" />
              </div>
              <div style={{ fontSize: '1.25rem', fontWeight: '600', color: '#111827' }}>
                {user.fullName}
              </div>
            </div>

            {/* Información del usuario */}
            <div style={{ display: 'flex', flexDirection: 'column', gap: '1rem' }}>
              {isEditing ? (
                <>
                  <div>
                    <label style={{ display: 'block', fontSize: '0.875rem', color: '#6b7280', marginBottom: '0.25rem' }}>
                      Nombre
                    </label>
                    <input
                      type="text"
                      value={formData.nombre}
                      onChange={(e) => setFormData({...formData, nombre: e.target.value})}
                      style={{
                        width: '100%',
                        padding: '0.5rem',
                        border: '1px solid #d1d5db',
                        borderRadius: '6px',
                        fontSize: '1rem'
                      }}
                    />
                  </div>
                  
                  <div>
                    <label style={{ display: 'block', fontSize: '0.875rem', color: '#6b7280', marginBottom: '0.25rem' }}>
                      Email
                    </label>
                    <input
                      type="email"
                      value={formData.email}
                      onChange={(e) => setFormData({...formData, email: e.target.value})}
                      style={{
                        width: '100%',
                        padding: '0.5rem',
                        border: '1px solid #d1d5db',
                        borderRadius: '6px',
                        fontSize: '1rem'
                      }}
                    />
                  </div>

                  <div>
                    <label style={{ display: 'block', fontSize: '0.875rem', color: '#6b7280', marginBottom: '0.25rem' }}>
                      Teléfono
                    </label>
                    <input
                      type="tel"
                      value={formData.telefono}
                      onChange={(e) => setFormData({...formData, telefono: e.target.value})}
                      style={{
                        width: '100%',
                        padding: '0.5rem',
                        border: '1px solid #d1d5db',
                        borderRadius: '6px',
                        fontSize: '1rem'
                      }}
                    />
                  </div>

                  <div>
                    <label style={{ display: 'block', fontSize: '0.875rem', color: '#6b7280', marginBottom: '0.25rem' }}>
                      Ciudad
                    </label>
                    <input
                      type="text"
                      value={formData.ciudad}
                      onChange={(e) => setFormData({...formData, ciudad: e.target.value})}
                      style={{
                        width: '100%',
                        padding: '0.5rem',
                        border: '1px solid #d1d5db',
                        borderRadius: '6px',
                        fontSize: '1rem'
                      }}
                    />
                  </div>

                  <button
                    onClick={handleSaveProfile}
                    style={{
                      background: '#10b981',
                      color: 'white',
                      border: 'none',
                      borderRadius: '8px',
                      padding: '0.75rem',
                      cursor: 'pointer',
                      fontSize: '1rem',
                      fontWeight: '500'
                    }}
                  >
                    Guardar Cambios
                  </button>
                </>
              ) : (
                <>
                  <div style={{ display: 'flex', alignItems: 'center', gap: '0.75rem' }}>
                    <User size={18} color="#6b7280" />
                    <div>
                      <div style={{ fontSize: '0.875rem', color: '#6b7280' }}>Nombre</div>
                      <div style={{ fontSize: '1rem', color: '#111827' }}>{user.fullName}</div>
                    </div>
                  </div>

                  <div style={{ display: 'flex', alignItems: 'center', gap: '0.75rem' }}>
                    <Mail size={18} color="#6b7280" />
                    <div>
                      <div style={{ fontSize: '0.875rem', color: '#6b7280' }}>Email</div>
                      <div style={{ fontSize: '1rem', color: '#111827' }}>{user.email}</div>
                    </div>
                  </div>

                  <div style={{ display: 'flex', alignItems: 'center', gap: '0.75rem' }}>
                    <Phone size={18} color="#6b7280" />
                    <div>
                      <div style={{ fontSize: '0.875rem', color: '#6b7280' }}>Teléfono</div>
                      <div style={{ fontSize: '1rem', color: '#111827' }}>{user.phone}</div>
                    </div>
                  </div>

                  </>
              )}
            </div>
          </div>

          {/* Estadísticas y actividad reciente */}
          <div>
            {/* Estadísticas */}
            <div style={{
              background: 'white',
              borderRadius: '12px',
              padding: '2rem',
              marginBottom: '2rem',
              boxShadow: '0 1px 3px rgba(0,0,0,0.1)'
            }}>
              <h2 style={{ fontSize: '1.25rem', fontWeight: '600', color: '#111827', marginBottom: '1.5rem' }}>
                Estadísticas
              </h2>
              
              <div style={{
                display: 'grid',
                gridTemplateColumns: 'repeat(2, 1fr)',
                gap: '1.5rem'
              }}>
                <div style={{ textAlign: 'center' }}>
                  <div style={{
                    width: '60px',
                    height: '60px',
                    borderRadius: '50%',
                    background: '#ff6b1a20',
                    display: 'flex',
                    alignItems: 'center',
                    justifyContent: 'center',
                    margin: '0 auto 1rem'
                  }}>
                    <Box size={24} color="#ff6b1a" />
                  </div>
                  <div style={{ fontSize: '2rem', fontWeight: '600', color: '#111827' }}>
                    {stats?.total_productos || 0}
                  </div>
                  <div style={{ fontSize: '0.875rem', color: '#6b7280' }}>
                    Publicaciones
                  </div>
                </div>

                <div style={{ textAlign: 'center' }}>
                  <div style={{
                    width: '60px',
                    height: '60px',
                    borderRadius: '50%',
                    background: '#ef444420',
                    display: 'flex',
                    alignItems: 'center',
                    justifyContent: 'center',
                    margin: '0 auto 1rem'
                  }}>
                    <Heart size={24} color="#ef4444" />
                  </div>
                  <div style={{ fontSize: '2rem', fontWeight: '600', color: '#111827' }}>
                    {stats?.total_favoritos || 0}
                  </div>
                  <div style={{ fontSize: '0.875rem', color: '#6b7280' }}>
                    Favoritos
                  </div>
                </div>
              </div>
            </div>

            {/* Actividad reciente */}
            <div style={{
              background: 'white',
              borderRadius: '12px',
              padding: '2rem',
              boxShadow: '0 1px 3px rgba(0,0,0,0.1)'
            }}>
              <h2 style={{ fontSize: '1.25rem', fontWeight: '600', color: '#111827', marginBottom: '1.5rem' }}>
                Actividad Reciente
              </h2>
              
              {isLoading ? (
                <div>Cargando actividad...</div>
              ) : (
                <div style={{ display: 'flex', flexDirection: 'column', gap: '1rem' }}>
                  {stats?.productos.slice(0, 3).map((product) => (
                    <div key={product.id} style={{
                      display: 'flex',
                      gap: '1rem',
                      padding: '1rem',
                      border: '1px solid #f3f4f6',
                      borderRadius: '8px'
                    }}>
                      <div style={{
                        width: '60px',
                        height: '60px',
                        borderRadius: '8px',
                        background: '#f3f4f6',
                        display: 'flex',
                        alignItems: 'center',
                        justifyContent: 'center',
                        flexShrink: 0
                      }}>
                        {product.imagen_principal ? (
                          <img
                            src={`/uploads/products/${product.imagen_principal}`}
                            alt={product.titulo}
                            style={{
                              width: '100%',
                              height: '100%',
                              objectFit: 'cover',
                              borderRadius: '8px'
                            }}
                          />
                        ) : (
                          <Box size={24} color="#9ca3af" />
                        )}
                      </div>
                      
                      <div style={{ flex: 1 }}>
                        <div style={{ fontWeight: '500', color: '#111827', marginBottom: '0.25rem' }}>
                          {product.titulo}
                        </div>
                        <div style={{ fontSize: '1.125rem', fontWeight: '600', color: '#ff6b1a', marginBottom: '0.25rem' }}>
                          {formatPrice(product.precio)}
                        </div>
                        <div style={{ fontSize: '0.875rem', color: '#6b7280' }}>
                          {formatDate(product.fecha_publicacion)}
                        </div>
                      </div>
                    </div>
                  ))}
                </div>
              )}
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}
