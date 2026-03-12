'use client'

import { ReactNode } from 'react'
import { motion } from 'framer-motion'
import { useStoreSidebarCollapsed, useStorePreviewMode } from '@/lib/store/store-store'
import StorePreviewFunctional from './StorePreviewFunctional'
import Sidebar from './editor/Sidebar';

interface StoreLayoutProps {
  children?: ReactNode
}

export default function StoreLayout({ children }: StoreLayoutProps) {
  const sidebarCollapsed = useStoreSidebarCollapsed()
  const previewMode = useStorePreviewMode()

  return (
    <div className="h-screen w-screen overflow-hidden bg-gray-100">
      <div className="flex h-full">
        {/* Sidebar con Acordeón de Edición */}
        <motion.aside
          initial={false}
          animate={{
            width: sidebarCollapsed ? 80 : 450, // Ancho para acomodar el acordeón
            transition: { duration: 0.3, ease: 'easeInOut' }
          }}
          className="flex-shrink-0 bg-gray-900 shadow-lg"
        >
          <Sidebar />
        </motion.aside>

        {/* Visor de la Tienda */}
        <main className="flex-1 flex flex-col overflow-hidden">
          <div className="flex-1 bg-gray-100 p-6 overflow-auto">
            <StorePreviewFunctional mode={previewMode} />
          </div>
        </main>
      </div>
    </div>
  )
}
