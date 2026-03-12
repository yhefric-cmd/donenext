'use client'

import { useState } from 'react'
import { HexColorPicker } from 'react-colorful'
import { Listbox, Transition } from '@headlessui/react'
import { 
  Palette, 
  ChevronDown, 
  Check, 
  Square,
  Droplet,
  Navigation
} from 'lucide-react'
import { useStoreSettings, useStoreEditor } from '@/lib/store/store-store'
import { cn } from '@/lib/utils/cn'

interface BrandIdentityProps {
  isCollapsed?: boolean
}

export default function BrandIdentity({ isCollapsed = false }: BrandIdentityProps) {
  const store = useStoreSettings()
  const { dispatch } = useStoreEditor.getState()
  
  const [brandColor, setBrandColor] = useState(store.color_primario || '#ff6b1a')
  const [showColorPicker, setShowColorPicker] = useState(false)

  // Opciones para la barra de navegación
  const navbarOptions = [
    { 
      id: 'blanco', 
      label: 'Blanco', 
      description: 'Fondo blanco para la barra de navegación',
      icon: Square,
      color: '#ffffff'
    },
    { 
      id: 'color', 
      label: 'Color de Marca', 
      description: 'Usa el color de la marca como fondo para la barra de navegación',
      icon: Droplet,
      color: brandColor
    }
  ]

  // Opciones para el fondo de página
  const backgroundOptions = [
    { 
      id: 'blanco', 
      label: 'Blanco', 
      description: 'Fondo de página completamente blanco',
      icon: Square,
      color: '#ffffff'
    },
    { 
      id: 'color', 
      label: 'Color de Marca', 
      description: 'Utiliza un tono del color de la marca para el fondo',
      icon: Droplet,
      color: brandColor + '20' // 20% opacity
    },
    { 
      id: 'gris', 
      label: 'Gris', 
      description: 'Un fondo de color gris claro',
      icon: Square,
      color: '#f3f4f6'
    }
  ]

  // Actualizar color de marca
  const handleBrandColorChange = (color: string) => {
    setBrandColor(color)
    dispatch({ type: 'UPDATE_STORE', payload: { color_primario: color } })
  }

  // Actualizar estilo de navegación
  const handleNavbarStyleChange = (style: 'blanco' | 'color' | 'transparente') => {
    dispatch({ type: 'UPDATE_STORE', payload: { navbar_style: style } })
  }

  // Actualizar fondo de página
  const handleBackgroundChange = (background: 'blanco' | 'color' | 'gris') => {
    dispatch({ type: 'UPDATE_STORE', payload: { background_style: background } })
  }

  if (isCollapsed) {
    return (
      <div className="p-4 space-y-4">
        <div className="text-center">
          <Palette size={24} className="mx-auto text-gray-600 mb-2" />
          <div className="text-xs text-gray-500">Marca</div>
        </div>
      </div>
    )
  }

  return (
    <div className="p-6 space-y-8">
      {/* Color de Marca */}
      <div className="space-y-3">
        <div className="flex items-center gap-2 mb-4">
          <Palette size={18} className="text-gray-700" />
          <h3 className="font-semibold text-gray-900">Color de Marca</h3>
        </div>
        
        <div className="space-y-4">
          {/* Color Picker */}
          <div className="relative">
            <button
              onClick={() => setShowColorPicker(!showColorPicker)}
              className="w-full flex items-center gap-3 p-3 border border-gray-200 rounded-lg hover:border-gray-300 transition-colors"
            >
              <div 
                className="w-10 h-10 rounded-lg border-2 border-gray-300"
                style={{ backgroundColor: brandColor }}
              />
              <div className="flex-1 text-left">
                <div className="font-medium text-gray-900">{brandColor.toUpperCase()}</div>
                <div className="text-sm text-gray-500">Click para cambiar color</div>
              </div>
              <ChevronDown size={20} className="text-gray-400" />
            </button>

            {/* Color Picker Dropdown */}
            {showColorPicker && (
              <div className="absolute top-full left-0 right-0 mt-2 p-4 bg-white border border-gray-200 rounded-lg shadow-xl z-50">
                <div className="flex justify-center mb-4">
                  <HexColorPicker color={brandColor} onChange={handleBrandColorChange} />
                </div>
                <div className="flex gap-2 justify-center">
                  {/* Preset Colors */}
                  {['#ff6b1a', '#3b82f6', '#10b981', '#8b5cf6', '#ef4444', '#f59e0b'].map((color) => (
                    <button
                      key={color}
                      onClick={() => handleBrandColorChange(color)}
                      className="w-8 h-8 rounded-lg border-2 border-gray-300 hover:border-gray-400 transition-colors"
                      style={{ backgroundColor: color }}
                      title={color}
                    />
                  ))}
                </div>
                <div className="mt-4 flex justify-end gap-2">
                  <button
                    onClick={() => setShowColorPicker(false)}
                    className="px-4 py-2 text-sm text-gray-600 hover:text-gray-900"
                  >
                    Cancelar
                  </button>
                  <button
                    onClick={() => setShowColorPicker(false)}
                    className="px-4 py-2 text-sm bg-blue-600 text-white rounded-lg hover:bg-blue-700"
                  >
                    Aplicar
                  </button>
                </div>
              </div>
            )}
          </div>

          {/* Color Preview */}
          <div className="grid grid-cols-4 gap-2">
            <div className="text-center">
              <div 
                className="w-full h-12 rounded-lg mb-1"
                style={{ backgroundColor: brandColor }}
              />
              <div className="text-xs text-gray-500">Principal</div>
            </div>
            <div className="text-center">
              <div 
                className="w-full h-12 rounded-lg mb-1"
                style={{ backgroundColor: brandColor + '20' }}
              />
              <div className="text-xs text-gray-500">20%</div>
            </div>
            <div className="text-center">
              <div 
                className="w-full h-12 rounded-lg mb-1"
                style={{ backgroundColor: brandColor + '40' }}
              />
              <div className="text-xs text-gray-500">40%</div>
            </div>
            <div className="text-center">
              <div 
                className="w-full h-12 rounded-lg mb-1"
                style={{ backgroundColor: brandColor + '60' }}
              />
              <div className="text-xs text-gray-500">60%</div>
            </div>
          </div>
        </div>
      </div>

      {/* Barra de Navegación */}
      <div className="space-y-3">
        <div className="flex items-center gap-2 mb-4">
          <Navigation size={18} className="text-gray-700" />
          <h3 className="font-semibold text-gray-900">Barra de Navegación</h3>
        </div>

        <Listbox value={store.navbar_style || 'blanco'} onChange={handleNavbarStyleChange}>
          <div className="relative">
            <Listbox.Button className="w-full flex items-center gap-3 p-3 border border-gray-200 rounded-lg hover:border-gray-300 transition-colors text-left">
              {(() => {
                const selected = navbarOptions.find(opt => opt.id === (store.navbar_style || 'blanco'))
                return (
                  <>
                    {selected?.icon && <selected.icon size={20} className="text-gray-600" />}
                    <div className="flex-1">
                      <div className="font-medium text-gray-900">{selected?.label}</div>
                      <div className="text-sm text-gray-500">{selected?.description}</div>
                    </div>
                    <ChevronDown size={20} className="text-gray-400" />
                  </>
                )
              })()}
            </Listbox.Button>

            <Transition
              leave="transition ease-in duration-100"
              leaveFrom="opacity-100"
              leaveTo="opacity-0"
            >
              <Listbox.Options className="absolute z-10 mt-1 w-full bg-white border border-gray-200 rounded-lg shadow-lg max-h-60 overflow-auto">
                {navbarOptions.map((option) => (
                  <Listbox.Option
                    key={option.id}
                    value={option.id}
                    className={({ active }) =>
                      cn(
                        'relative cursor-default select-none p-3 hover:bg-gray-50 transition-colors',
                        active ? 'bg-gray-50' : ''
                      )
                    }
                  >
                    {({ selected }) => (
                      <div className="flex items-center gap-3">
                        <option.icon size={20} className="text-gray-600" />
                        <div className="flex-1">
                          <div className="font-medium text-gray-900">{option.label}</div>
                          <div className="text-sm text-gray-500">{option.description}</div>
                        </div>
                        {selected && (
                          <Check size={20} className="text-blue-600" />
                        )}
                      </div>
                    )}
                  </Listbox.Option>
                ))}
              </Listbox.Options>
            </Transition>
          </div>
        </Listbox>
      </div>

      {/* Fondo de Página */}
      <div className="space-y-3">
        <div className="flex items-center gap-2 mb-4">
          <Square size={18} className="text-gray-700" />
          <h3 className="font-semibold text-gray-900">Fondo de Página</h3>
        </div>

        <Listbox value={store.background_style || 'blanco'} onChange={handleBackgroundChange}>
          <div className="relative">
            <Listbox.Button className="w-full flex items-center gap-3 p-3 border border-gray-200 rounded-lg hover:border-gray-300 transition-colors text-left">
              {(() => {
                const selected = backgroundOptions.find(opt => opt.id === (store.background_style || 'blanco'))
                return (
                  <>
                    {selected?.icon && <selected.icon size={20} className="text-gray-600" />}
                    <div className="flex-1">
                      <div className="font-medium text-gray-900">{selected?.label}</div>
                      <div className="text-sm text-gray-500">{selected?.description}</div>
                    </div>
                    <ChevronDown size={20} className="text-gray-400" />
                  </>
                )
              })()}
            </Listbox.Button>

            <Transition
              leave="transition ease-in duration-100"
              leaveFrom="opacity-100"
              leaveTo="opacity-0"
            >
              <Listbox.Options className="absolute z-10 mt-1 w-full bg-white border border-gray-200 rounded-lg shadow-lg max-h-60 overflow-auto">
                {backgroundOptions.map((option) => (
                  <Listbox.Option
                    key={option.id}
                    value={option.id}
                    className={({ active }) =>
                      cn(
                        'relative cursor-default select-none p-3 hover:bg-gray-50 transition-colors',
                        active ? 'bg-gray-50' : ''
                      )
                    }
                  >
                    {({ selected }) => (
                      <div className="flex items-center gap-3">
                        <div className="flex items-center gap-2">
                          <option.icon size={20} className="text-gray-600" />
                          <div 
                            className="w-4 h-4 rounded border border-gray-300"
                            style={{ backgroundColor: option.color }}
                          />
                        </div>
                        <div className="flex-1">
                          <div className="font-medium text-gray-900">{option.label}</div>
                          <div className="text-sm text-gray-500">{option.description}</div>
                        </div>
                        {selected && (
                          <Check size={20} className="text-blue-600" />
                        )}
                      </div>
                    )}
                  </Listbox.Option>
                ))}
              </Listbox.Options>
            </Transition>
          </div>
        </Listbox>
      </div>

      {/* Preview en vivo */}
      <div className="p-4 bg-gray-50 rounded-lg">
        <div className="text-sm font-medium text-gray-900 mb-2">Vista Previa</div>
        <div className="space-y-2">
          {/* Preview Navbar */}
          <div 
            className={cn(
              'h-12 rounded-lg flex items-center px-4 gap-3',
              store.navbar_style === 'color' ? '' : 'bg-white border border-gray-200'
            )}
            style={{ 
              backgroundColor: store.navbar_style === 'color' ? brandColor : undefined 
            }}
          >
            <div 
              className="w-6 h-6 rounded"
              style={{ backgroundColor: brandColor }}
            />
            <span className="text-sm font-medium" style={{ 
              color: store.navbar_style === 'color' ? 'white' : '#374151' 
            }}>
              Mi Tienda
            </span>
          </div>
          
          {/* Preview Background */}
          <div 
            className="h-24 rounded-lg p-4 border border-gray-200"
            style={{ 
              backgroundColor: store.background_style === 'color' ? brandColor + '10' :
                           store.background_style === 'gris' ? '#f3f4f6' : '#ffffff'
            }}
          >
            <div className="flex items-center gap-2">
              <div 
                className="w-8 h-8 rounded"
                style={{ backgroundColor: brandColor }}
              />
              <div className="text-sm" style={{ color: '#374151' }}>
                Producto ejemplo
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}
