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
import { Input } from '@/components/ui/input'
import { Switch } from '@/components/ui/switch'
import { 
  Palette, 
  ChevronDown,
  Square,
  Droplet,
  Navigation
} from 'lucide-react'
import { useStoreSettings, useStoreEditor } from '@/lib/store/store-store'
import { cn } from '@/lib/utils'
import LogoUploader from './LogoUploader'
import DropdownPortal from '@/components/ui/dropdown-portal'

interface BrandIdentityVacioProps {
  isCollapsed?: boolean
}

export default function BrandIdentityVacio({ isCollapsed = false }: BrandIdentityVacioProps) {
  const store = useStoreSettings()
  const { dispatch } = useStoreEditor.getState()
  
  const [brandColor, setBrandColor] = useState(store.color_primario || '#ff6a00')
  const [showColorPicker, setShowColorPicker] = useState(false)
  const [showName, setShowName] = useState(store.mostrar_nombre !== false)
  const [storeName, setStoreName] = useState(store.nombre || '')
  const [showLogo, setShowLogo] = useState(store.mostrar_logo !== false)
  const [logoUrl, setLogoUrl] = useState(store.logo_principal || '')

  // Paleta de colores exacta del monolítico
  const colorPalette = [
    '#FF6A00', '#1A73E8', '#34A853', '#FBBC04',
    '#EA4335', '#9333EA', '#06B6D4', '#F97316',
    '#8B5CF6', '#EC4899', '#14B8A6', '#84CC16',
    '#F59E0B', '#EF4444', '#3B82F6', '#10B981',
    '#6366F1', '#F43F5E', '#0EA5E9', '#22C55E',
    '#A855F7', '#F472B6', '#2DD4BF', '#65A30D'
  ]

  // Actualizar nombre de tienda
  const handleStoreNameChange = (name: string) => {
    setStoreName(name)
    dispatch({ type: 'UPDATE_STORE', payload: { nombre: name } })
  }

  // Actualizar mostrar/ocultar nombre
  const handleShowNameChange = (checked: boolean) => {
    setShowName(checked)
    dispatch({ type: 'UPDATE_STORE', payload: { mostrar_nombre: checked } })
  }

  // Actualizar mostrar/ocultar logo
  const handleShowLogoChange = (checked: boolean) => {
    setShowLogo(checked)
    dispatch({ type: 'UPDATE_STORE', payload: { mostrar_logo: checked } })
  }

  // Actualizar logo
  const handleLogoChange = (url: string) => {
    setLogoUrl(url)
    dispatch({ type: 'UPDATE_STORE', payload: { logo_principal: url } })
  }

  // Actualizar color de marca
  const handleColorChange = (color: string) => {
    setBrandColor(color)
    dispatch({ type: 'UPDATE_STORE', payload: { color_primario: color } })
  }

  // Validar y actualizar color desde input hex
  const handleHexInputChange = (value: string) => {
    // Validar formato hex
    const hexRegex = /^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$/
    if (hexRegex.test(value)) {
      setBrandColor(value)
      dispatch({ type: 'UPDATE_STORE', payload: { color_primario: value } })
    } else if (value.startsWith('#') && value.length <= 7) {
      setBrandColor(value)
    }
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
      {/* NOMBRE DE TIENDA - ESTILO ENTERPRISE */}
      <div className="space-y-4">
        <div className="flex items-center justify-between mb-4">
          <h3 className="font-semibold text-gray-900 text-base">Nombre</h3>
          <Switch
            checked={showName}
            onCheckedChange={handleShowNameChange}
            className="data-[state=checked]:bg-[#22226B]"
          />
        </div>
        
        <div className="relative">
          <Input
            value={storeName}
            onChange={(e) => handleStoreNameChange(e.target.value)}
            placeholder="Nombre de tu tienda"
            className={cn(
              "w-full h-12 px-4 text-base transition-all duration-300",
              "border-2 focus:border-[#22226B] focus:shadow-lg",
              "hover:border-[#22226B]/50 hover:shadow-md",
              "bg-white shadow-sm",
              "placeholder:text-gray-400"
            )}
            style={{
              boxShadow: '0 1px 3px rgba(34, 34, 107, 0.1), 0 1px 2px rgba(34, 34, 107, 0.06)',
            }}
          />
          
          {/* Efecto de gradiente sutil */}
          <div 
            className="absolute inset-0 rounded-lg opacity-0 hover:opacity-100 transition-opacity duration-300 pointer-events-none"
            style={{
              background: 'linear-gradient(135deg, rgba(34, 34, 107, 0.05) 0%, rgba(34, 34, 107, 0.02) 100%)',
            }}
          />
        </div>
      </div>

      {/* LOGO - ESTILO ENTERPRISE */}
      <div className="space-y-4">
        <div className="flex items-center justify-between mb-4">
          <h3 className="font-semibold text-gray-900 text-base">Logo</h3>
          <Switch
            checked={showLogo}
            onCheckedChange={handleShowLogoChange}
            className="data-[state=checked]:bg-[#22226B]"
          />
        </div>
        
        <LogoUploader
          currentLogo={logoUrl}
          onLogoChange={handleLogoChange}
          className="font-inter"
        />
      </div>

      {/* COLOR DE MARCA - ESTILO ENTERPRISE */}
      <div className="space-y-4">
        <h3 className="font-semibold text-gray-900 text-base">Color de Marca</h3>
        
        <Popover open={showColorPicker} onOpenChange={setShowColorPicker}>
          <PopoverTrigger asChild>
            <Button
              variant="outline"
              className={cn(
                "w-full h-12 px-4 justify-start transition-all duration-300",
                "border-2 hover:border-[#22226B]/50 hover:shadow-md",
                "bg-white shadow-sm"
              )}
              style={{
                boxShadow: '0 1px 3px rgba(34, 34, 107, 0.1), 0 1px 2px rgba(34, 34, 107, 0.06)',
              }}
            >
              <div className="flex items-center gap-3 flex-1">
                <div 
                  className="w-6 h-6 rounded-md border border-gray-300"
                  style={{ backgroundColor: brandColor }}
                />
                <span className="text-sm font-medium text-gray-900">
                  {brandColor || 'Seleccionar Color'}
                </span>
              </div>
              <ChevronDown className="w-4 h-4 text-gray-500" />
            </Button>
          </PopoverTrigger>
          
          <PopoverContent 
            className="w-[calc(100%+2px)] p-3 -ml-px" 
            align="start"
            side="bottom"
            alignOffset={0}
            style={{ backgroundColor: 'white' }}
          >
            {/* Grilla de Colores Compacta */}
            <div className="grid grid-cols-8 gap-1 mb-3">
              {colorPalette.map((color) => (
                <button
                  key={color}
                  onClick={() => handleColorChange(color)}
                  className={cn(
                    "w-5 h-5 rounded border transition-all duration-200",
                    "hover:scale-110",
                    brandColor === color 
                      ? "border-[#22226B] ring-1 ring-[#22226B]/30" 
                      : "border-gray-300"
                  )}
                  style={{ backgroundColor: color }}
                />
              ))}
            </div>

            {/* Campo de Código Hex Compacto */}
            <div className="space-y-2 pt-2 border-t">
              <div className="flex items-center gap-2">
                <div 
                  className="w-6 h-6 rounded border border-gray-300 flex-shrink-0"
                  style={{ backgroundColor: brandColor }}
                />
                <Input
                  value={brandColor}
                  onChange={(e) => handleHexInputChange(e.target.value)}
                  placeholder="#000000"
                  className={cn(
                    "flex-1 h-8 text-xs font-mono px-2",
                    "border focus:border-[#22226B]",
                    "hover:border-[#22226B]/50"
                  )}
                  maxLength={7}
                />
              </div>
              <p className="text-xs text-gray-500 font-inter">
                Código hexadecimal
              </p>
            </div>
          </PopoverContent>
        </Popover>
      </div>

      {/* BARRA DE NAVEGACIÓN - ESTILO ENTERPRISE */}
      <div className="space-y-4">
        <h3 className="font-semibold text-gray-900 text-base">Color de Marca</h3>
        
        <DropdownPortal
          value={store.navbar_style === 'transparente' ? 'blanco' : (store.navbar_style || 'blanco')}
          onValueChange={(value: 'blanco' | 'color') => dispatch({ type: 'UPDATE_STORE', payload: { navbar_style: value } })}
          placeholder="Seleccionar estilo"
          options={[
            { value: 'blanco', label: 'Blanco' },
            { value: 'color', label: 'Color de Marca' }
          ]}
        />
      </div>

      {/* FONDO DE PÁGINA - ESTILO ENTERPRISE */}
      <div className="space-y-4">
        <h3 className="font-semibold text-gray-900 text-base">Fondo de Página</h3>
        
        <DropdownPortal
          value={store.background_style || 'blanco'}
          onValueChange={(value: 'blanco' | 'gris' | 'color') => dispatch({ type: 'UPDATE_STORE', payload: { background_style: value } })}
          placeholder="Seleccionar fondo"
          options={[
            { value: 'blanco', label: 'Blanco' },
            { value: 'gris', label: 'Gris' },
            { value: 'color', label: 'Color de Marca' }
          ]}
        />
      </div>
    </div>
  )
}
