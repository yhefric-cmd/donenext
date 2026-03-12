'use client'

import { useEffect } from 'react'
import StoreLayout from '@/components/store/StoreLayout'
import { useStoreEditor } from '@/lib/store/store-store'

export default function DevEditorPage() {
  const loadStore = useStoreEditor((state) => state.loadStore)

  useEffect(() => {
    // Cargar datos de prueba directamente sin login
    const mockStore = {
      id: 'dev-store',
      nombre: 'Tienda Demo',
      slug: 'tienda-demo',
      color_primario: '#ff6a00',
      color_secundario: '#1a73e8',
      tema: 'claro' as const,
      fuente: 'Inter',
      navbar_style: 'blanco' as const,
      background_style: 'blanco' as const,
      grid_density: 3 as const,
      mostrar_nombre: true,
      mostrar_logo: false,
      activo: true,
      menu_items: [],
      facebook_url: '',
      instagram_url: '',
      whatsapp: '',
      telefono: '',
      email: '',
      direccion: '',
      ciudad: '',
      departamento: '',
      descripcion: '',
      logo_principal: '',
      logo: ''
    }

    // Cargar directamente sin autenticación
    useStoreEditor.getState().dispatch({ type: 'SET_STORE', payload: mockStore })
  }, [loadStore])

  return <StoreLayout />
}
