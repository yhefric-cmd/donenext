'use client'

import { useEffect } from 'react'
import { useRouter } from 'next/navigation'
import { useAuth } from '@/contexts/AuthContext'
import StoreLayout from '@/components/store/StoreLayout'
import { useStoreEditor } from '@/lib/store/store-store'

export default function StoreEditorPage() {
  const { user } = useAuth()
  const router = useRouter()
  const loadStore = useStoreEditor((state) => state.loadStore)

  useEffect(() => {
    if (!user) {
      router.push('/auth/login')
      return
    }

    // Cargar tienda del usuario
    if (user.id) {
      loadStore(user.id)
    }
  }, [user, router, loadStore])

  if (!user) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div>Cargando...</div>
      </div>
    )
  }

  return <StoreLayout />
}
