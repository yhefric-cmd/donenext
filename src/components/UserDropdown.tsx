
'use client'

import { useState, useRef, useEffect } from 'react'
import Link from 'next/link'
import { useAuth } from '@/contexts/AuthContext'
import { User, ChevronDown, Box, Heart, Store, LogOut } from 'lucide-react'

export default function UserDropdown() {
  const { user, logout, hasStore } = useAuth()
  const [isOpen, setIsOpen] = useState(false)
  const dropdownRef = useRef<HTMLDivElement>(null)

  useEffect(() => {
    const handleClickOutside = (event: MouseEvent) => {
      if (dropdownRef.current && !dropdownRef.current.contains(event.target as Node)) {
        setIsOpen(false)
      }
    }
    document.addEventListener('mousedown', handleClickOutside)
    return () => document.removeEventListener('mousedown', handleClickOutside)
  }, [])

  const getFirstName = (fullName: string | null | undefined) => {
    if (!fullName) return ''
    return fullName.split(' ')[0]
  }

  // Determinar el elemento de la tienda condicionalmente
  const storeMenuItem = hasStore
    ? { href: '/mi/business/editor', icon: Store, label: 'Mi tienda' }
    : { href: '/mi/business/create', icon: Store, label: 'Crear Tienda' }

  const menuItems = [
    { href: '/mi/perfil', icon: User, label: 'Mi perfil' },
    { href: '/mi/publicaciones', icon: Box, label: 'Mis publicaciones' },
    { href: '/favorites', icon: Heart, label: 'Mis favoritos' },
    storeMenuItem,
  ]

  if (!user) return null

  return (
    <div className="relative" ref={dropdownRef}>
      {/* Aplicando la clase rainbow-btn al botón que abre el dropdown */}
      <button
        onClick={() => setIsOpen(!isOpen)}
        className="rainbow-btn flex items-center gap-2"
      >
        {/* Se mantiene el ícono de usuario */}
        <User size={18} color="#000" />
        <span className="font-semibold text-black">
          {getFirstName(user.fullName)}
        </span>
        <ChevronDown
          size={14}
          color="#000"
          className={`transition-transform ${isOpen ? 'rotate-180' : ''}`}
        />
      </button>

      {/* El menú desplegable */}
      {isOpen && (
        <div className="absolute right-0 mt-2 w-56 origin-top-right rounded-md bg-white shadow-lg ring-1 ring-black ring-opacity-5 focus:outline-none">
          <div className="py-1">
            <div className="px-4 py-3 border-b border-gray-200">
              <p className="text-sm font-medium text-gray-900 truncate">
                {user.fullName}
              </p>
              <p className="text-sm text-gray-500 truncate">
                {user.email}
              </p>
            </div>
            {menuItems.map((item) => (
              <Link
                key={item.label}
                href={item.href}
                className="flex items-center gap-3 px-4 py-2 text-sm text-gray-700 hover:bg-gray-100"
                onClick={() => setIsOpen(false)}
              >
                <item.icon size={16} className="text-gray-500" />
                <span>{item.label}</span>
              </Link>
            ))}
            <div className="border-t border-gray-100"></div>
            <button
              onClick={() => {
                logout()
                setIsOpen(false)
              }}
              className="flex items-center gap-3 w-full px-4 py-2 text-sm text-red-600 hover:bg-red-50"
            >
              <LogOut size={16} />
              <span>Cerrar sesión</span>
            </button>
          </div>
        </div>
      )}
    </div>
  )
}
