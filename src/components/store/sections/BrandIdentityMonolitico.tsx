'use client'

import { useState } from 'react'
import { 
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from '@/components/ui/select'
import { 
  Popover,
  PopoverContent,
  PopoverTrigger,
} from '@/components/ui/popover'
import { Button } from '@/components/ui/button'
import { 
  Palette, 
  ChevronDown,
  Square,
  Droplet,
  Navigation
} from 'lucide-react'
import { useStoreSettings, useStoreEditor } from '@/lib/store/store-store'
import { cn } from '@/lib/utils'

interface BrandIdentityMonoliticoProps {
  isCollapsed?: boolean
}

export default function BrandIdentityMonolitico({ isCollapsed = false }: BrandIdentityMonoliticoProps) {
  const store = useStoreSettings()
  const { dispatch } = useStoreEditor.getState()
  
  const [brandColor, setBrandColor] = useState(store.color_primario || '#ff6a00')
  const [showColorPicker, setShowColorPicker] = useState(false)

  // Paleta de colores exacta del monolítico (24 colores)
  const colorPalette = [
    { name: 'Rojo', value: '#FF0000' },
    { name: 'Rosa Instagram', value: '#E1306C' },
    { name: 'Fucsia', value: '#FF017B' },
    { name: 'Rosa Oscuro', value: '#BA2C5D' },
    { name: 'Naranja Done', value: '#ff6a00' },
    { name: 'Naranja Salmón', value: '#F16253' },
    { name: 'Naranja Ladrillo', value: '#D85427' },
    { name: 'Terracota', value: '#E07A5F' },
    { name: 'Camel', value: '#C19A6B' },
    { name: 'Marrón Café', value: '#794C1E' },
    { name: 'Mostaza', value: '#FFBF00' },
    { name: 'Dorado', value: '#D4AF37' },
    { name: 'Lima Limón', value: '#E1E66B' },
    { name: 'Verde WhatsApp', value: '#25D366' },
    { name: 'Verde Jade', value: '#00A86B' },
    { name: 'Menta', value: '#20c997' },
    { name: 'Teal', value: '#008080' },
    { name: 'Azul Facebook', value: '#1a73e8' },
    { name: 'Azul Cielo', value: '#038CB4' },
    { name: 'Morado Real', value: '#6A0DAD' },
    { name: 'Gris Pizarra', value: '#34495E' },
    { name: 'Gris', value: '#999999' },
    { name: 'Negro', value: '#000000' },
    { name: 'Blanco', value: '#FFFFFF' }
  ]

  // Actualizar color de marca
  const handleColorChange = (color: string) => {
    setBrandColor(color)
    dispatch({ type: 'UPDATE_STORE', payload: { color_primario: color } })
  }

  // Actualizar estilo de navegación
  const handleNavbarChange = (style: 'blanco' | 'color' | 'transparente') => {
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
    <div className="p-6 space-y-6">
      {/* COLOR DE MARCA - Exacto como monolítico */}
      <div className="space-y-3">
        <div className="flex items-center gap-2 mb-4">
          <Palette size={18} className="text-gray-700" />
          <h3 className="font-semibold text-gray-900">Color de Marca</h3>
        </div>
        
        {/* Dropdown de Color de Marca - Estilo monolítico */}
        <Popover open={showColorPicker} onOpenChange={setShowColorPicker}>
          <PopoverTrigger asChild>
            <Button
              variant="outline"
              className="w-full justify-between h-12 px-4"
            >
              <div className="flex items-center gap-3">
                <div 
                  className="w-6 h-6 rounded-md border-2 border-gray-300"
                  style={{ backgroundColor: brandColor }}
                />
                <span className="font-medium">Seleccionar Color</span>
              </div>
              <ChevronDown size={16} className="text-gray-400" />
            </Button>
          </PopoverTrigger>
          <PopoverContent className="w-80 p-4" align="start">
            <div className="space-y-4">
              <div>
                <h4 className="font-medium text-gray-900 mb-3">Selecciona tu color de marca</h4>
                <div className="grid grid-cols-7 gap-2">
                  {colorPalette.map((color) => (
                    <button
                      key={color.value}
                      onClick={() => {
                        handleColorChange(color.value)
                        setShowColorPicker(false)
                      }}
                      className={cn(
                        'w-full h-10 rounded-lg border-2 hover:border-gray-400 transition-all hover:scale-105',
                        brandColor === color.value ? 'border-blue-500 ring-2 ring-blue-200' : 'border-gray-300'
                      )}
                      style={{ backgroundColor: color.value }}
                      title={color.name}
                    >
                      <span className="sr-only">{color.name}</span>
                    </button>
                  ))}
                </div>
              </div>
              
              {/* Preview de colores */}
              <div className="pt-3 border-t">
                <div className="text-sm font-medium text-gray-700 mb-2">Vista previa</div>
                <div className="grid grid-cols-4 gap-2">
                  <div className="text-center">
                    <div 
                      className="w-full h-8 rounded mb-1"
                      style={{ backgroundColor: brandColor }}
                    />
                    <div className="text-xs text-gray-500">100%</div>
                  </div>
                  <div className="text-center">
                    <div 
                      className="w-full h-8 rounded mb-1"
                      style={{ backgroundColor: brandColor + '20' }}
                    />
                    <div className="text-xs text-gray-500">20%</div>
                  </div>
                  <div className="text-center">
                    <div 
                      className="w-full h-8 rounded mb-1"
                      style={{ backgroundColor: brandColor + '40' }}
                    />
                    <div className="text-xs text-gray-500">40%</div>
                  </div>
                  <div className="text-center">
                    <div 
                      className="w-full h-8 rounded mb-1"
                      style={{ backgroundColor: brandColor + '60' }}
                    />
                    <div className="text-xs text-gray-500">60%</div>
                  </div>
                </div>
              </div>
            </div>
          </PopoverContent>
        </Popover>
      </div>

      {/* BARRA DE NAVEGACIÓN - Exacto como monolítico */}
      <div className="space-y-3">
        <div className="flex items-center gap-2 mb-4">
          <Navigation size={18} className="text-gray-700" />
          <h3 className="font-semibold text-gray-900">Barra de Navegación</h3>
        </div>

        <Select 
          value={store.navbar_style || 'blanco'} 
          onValueChange={(value: 'blanco' | 'color' | 'transparente') => handleNavbarChange(value)}
        >
          <SelectTrigger className="w-full h-12">
            <div className="flex items-center gap-3">
              {store.navbar_style === 'color' ? (
                <Droplet size={20} className="text-gray-600" />
              ) : (
                <Square size={20} className="text-gray-600" />
              )}
              <SelectValue placeholder="Selecciona estilo de navegación" />
            </div>
          </SelectTrigger>
          <SelectContent>
            <SelectItem value="blanco">
              <div className="flex items-center gap-3">
                <Square size={20} className="text-gray-600" />
                <div>
                  <div className="font-medium">Blanco</div>
                  <div className="text-sm text-gray-500">Fondo blanco para la barra de navegación</div>
                </div>
              </div>
            </SelectItem>
            <SelectItem value="color">
              <div className="flex items-center gap-3">
                <Droplet size={20} className="text-gray-600" />
                <div>
                  <div className="font-medium">Color de Marca</div>
                  <div className="text-sm text-gray-500">Usa el color de la marca como fondo para la barra de navegación</div>
                </div>
              </div>
            </SelectItem>
          </SelectContent>
        </Select>
      </div>

      {/* FONDO DE PÁGINA - Exacto como monolítico */}
      <div className="space-y-3">
        <div className="flex items-center gap-2 mb-4">
          <Square size={18} className="text-gray-700" />
          <h3 className="font-semibold text-gray-900">Fondo de Página</h3>
        </div>

        <Select 
          value={store.background_style || 'blanco'} 
          onValueChange={(value: 'blanco' | 'color' | 'gris') => handleBackgroundChange(value)}
        >
          <SelectTrigger className="w-full h-12">
            <div className="flex items-center gap-3">
              <Square size={20} className="text-gray-600" />
              <SelectValue placeholder="Selecciona fondo de página" />
            </div>
          </SelectTrigger>
          <SelectContent>
            <SelectItem value="blanco">
              <div className="flex items-center gap-3">
                <div className="w-5 h-5 rounded border-2 border-gray-300 bg-white" />
                <div>
                  <div className="font-medium">Blanco</div>
                  <div className="text-sm text-gray-500">Fondo de página completamente blanco</div>
                </div>
              </div>
            </SelectItem>
            <SelectItem value="color">
              <div className="flex items-center gap-3">
                <div 
                  className="w-5 h-5 rounded border-2 border-gray-300"
                  style={{ backgroundColor: brandColor + '20' }}
                />
                <div>
                  <div className="font-medium">Color de Marca</div>
                  <div className="text-sm text-gray-500">Utiliza un tono del color de la marca para el fondo</div>
                </div>
              </div>
            </SelectItem>
            <SelectItem value="gris">
              <div className="flex items-center gap-3">
                <div className="w-5 h-5 rounded border-2 border-gray-300 bg-gray-100" />
                <div>
                  <div className="font-medium">Gris</div>
                  <div className="text-sm text-gray-500">Un fondo de color gris claro</div>
                </div>
              </div>
            </SelectItem>
          </SelectContent>
        </Select>
      </div>

      {/* Preview en vivo - Como monolítico */}
      <div className="p-4 bg-gray-50 rounded-lg border border-gray-200">
        <div className="text-sm font-medium text-gray-900 mb-3">Vista Previa</div>
        <div className="space-y-3">
          {/* Preview Navbar */}
          <div 
            className={cn(
              'h-12 rounded-lg flex items-center px-4 gap-3 border',
              store.navbar_style === 'color' ? 'border-transparent' : 'border-gray-200'
            )}
            style={{ 
              backgroundColor: store.navbar_style === 'color' ? brandColor : '#ffffff',
              color: store.navbar_style === 'color' ? '#ffffff' : '#374151'
            }}
          >
            <div 
              className="w-6 h-6 rounded"
              style={{ backgroundColor: brandColor }}
            />
            <span className="text-sm font-medium">
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
