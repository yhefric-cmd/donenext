'use client'

import { useState } from 'react'
import { motion, AnimatePresence } from 'framer-motion'
import { 
  Store, 
  Palette, 
  Package, 
  Image, 
  Settings, 
  ChevronRight, 
  ChevronDown,
  Plus,
  Edit,
  Trash2,
  Eye,
  EyeOff
} from 'lucide-react'
import { useStoreSettings, useStoreProducts, useStoreEditor } from '@/lib/store/store-store'
import { cn } from '@/lib/utils/cn'

interface StoreSidebarProps {
  collapsed: boolean
}

export default function StoreSidebar({ collapsed }: StoreSidebarProps) {
  const [activeSection, setActiveSection] = useState('general')
  const [expandedSections, setExpandedSections] = useState(['general'])
  const store = useStoreSettings()
  const products = useStoreProducts()
  const dispatch = useStoreEditor()

  const toggleSection = (section: string) => {
    setExpandedSections(prev =>
      prev.includes(section)
        ? prev.filter(s => s !== section)
        : [...prev, section]
    )
  }

  const sidebarSections = [
    {
      id: 'general',
      label: 'Información General',
      icon: Store,
      children: [
        { id: 'basic', label: 'Datos Básicos', component: 'BasicInfo' },
        { id: 'brand', label: 'Identidad Visual', component: 'BrandIdentity' },
        { id: 'contact', label: 'Contacto', component: 'ContactInfo' }
      ]
    },
    {
      id: 'design',
      label: 'Diseño y Apariencia',
      icon: Palette,
      children: [
        { id: 'theme', label: 'Tema y Colores', component: 'ThemeCustomizer' },
        { id: 'layout', label: 'Layout y Espaciado', component: 'LayoutSettings' },
        { id: 'typography', label: 'Tipografía', component: 'TypographySettings' }
      ]
    },
    {
      id: 'products',
      label: 'Productos',
      icon: Package,
      badge: products.length,
      children: [
        { id: 'list', label: 'Todos los Productos', component: 'ProductList' },
        { id: 'add', label: 'Agregar Producto', component: 'AddProduct' },
        { id: 'categories', label: 'Categorías', component: 'Categories' }
      ]
    },
    {
      id: 'media',
      label: 'Multimedia',
      icon: Image,
      children: [
        { id: 'banners', label: 'Banners', component: 'BannerManager' },
        { id: 'gallery', label: 'Galería', component: 'GalleryManager' },
        { id: 'logo', label: 'Logo y Branding', component: 'LogoManager' }
      ]
    },
    {
      id: 'advanced',
      label: 'Configuración Avanzada',
      icon: Settings,
      children: [
        { id: 'seo', label: 'SEO y Metadatos', component: 'SEOSettings' },
        { id: 'analytics', label: 'Analytics', component: 'AnalyticsSettings' },
        { id: 'social', label: 'Redes Sociales', component: 'SocialSettings' }
      ]
    }
  ]

  if (collapsed) {
    return (
      <div className="w-full h-full flex flex-col items-center py-4">
        {sidebarSections.map((section) => (
          <button
            key={section.id}
            onClick={() => setActiveSection(section.id)}
            className={cn(
              'w-12 h-12 rounded-lg flex items-center justify-center mb-2 transition-colors',
              activeSection === section.id
                ? 'bg-blue-100 text-blue-600'
                : 'hover:bg-gray-100 text-gray-600'
            )}
            title={section.label}
          >
            <section.icon size={20} />
          </button>
        ))}
      </div>
    )
  }

  return (
    <div className="w-full h-full flex flex-col">
      {/* Header */}
      <div className="p-4 border-b border-gray-200">
        <h2 className="text-lg font-semibold text-gray-900">Editor de Tienda</h2>
        <p className="text-sm text-gray-500 mt-1">{store.nombre || 'Mi Tienda'}</p>
      </div>

      {/* Navigation */}
      <div className="flex-1 overflow-y-auto">
        {sidebarSections.map((section) => (
          <div key={section.id} className="mb-2">
            <button
              onClick={() => toggleSection(section.id)}
              className="w-full px-4 py-3 flex items-center justify-between hover:bg-gray-50 transition-colors"
            >
              <div className="flex items-center gap-3">
                <section.icon size={18} className="text-gray-600" />
                <span className="font-medium text-gray-900">{section.label}</span>
                {section.badge && (
                  <span className="bg-blue-100 text-blue-600 text-xs px-2 py-1 rounded-full">
                    {section.badge}
                  </span>
                )}
              </div>
              {expandedSections.includes(section.id) ? (
                <ChevronDown size={16} className="text-gray-400" />
              ) : (
                <ChevronRight size={16} className="text-gray-400" />
              )}
            </button>

            <AnimatePresence>
              {expandedSections.includes(section.id) && (
                <motion.div
                  initial={{ height: 0, opacity: 0 }}
                  animate={{ height: 'auto', opacity: 1 }}
                  exit={{ height: 0, opacity: 0 }}
                  className="overflow-hidden"
                >
                  {section.children.map((child) => (
                    <button
                      key={child.id}
                      onClick={() => setActiveSection(`${section.id}-${child.id}`)}
                      className={cn(
                        'w-full px-12 py-2 text-left hover:bg-gray-50 transition-colors text-sm',
                        activeSection === `${section.id}-${child.id}`
                          ? 'bg-blue-50 text-blue-600 border-l-2 border-blue-600'
                          : 'text-gray-600'
                      )}
                    >
                      {child.label}
                    </button>
                  ))}
                </motion.div>
              )}
            </AnimatePresence>
          </div>
        ))}
      </div>

      {/* Footer */}
      <div className="p-4 border-t border-gray-200">
        <div className="flex items-center gap-2 text-sm text-gray-500">
          <div className="w-2 h-2 bg-green-500 rounded-full" />
          <span>Tienda online</span>
        </div>
      </div>
    </div>
  )
}
