'use client'

import Navbar from '@/components/Navbar';
import { Input } from "@/components/ui/input"
import { Search, Mic } from 'lucide-react'
import Image from 'next/image';

export default function HomePage() {
  return (
    <>
      <Navbar />
      {/* Cambiado justify-center y pt-16 a pt-40 para subir el contenido */}
      <main className="flex flex-col items-center min-h-screen pt-40">
        {/* Logo */}
        <div className="mb-8">
          <Image
            src="/assets/done.png"
            alt="Done! Logo"
            width={300} 
            height={112}
            priority
          />
        </div>

        {/* Barra de Búsqueda */}
        <div className="w-full max-w-2xl px-4">
          <div className="relative">
            <Search className="absolute left-4 top-1/2 -translate-y-1/2 h-5 w-5 text-gray-400" />
            <Mic className="absolute right-4 top-1/2 -translate-y-1/2 h-5 w-5 text-gray-400 hover:text-gray-600 cursor-pointer" />
            <Input
              type="search"
              placeholder="Buscar en Done!"
              className="w-full pl-12 pr-12 py-6 text-lg rounded-full border-gray-300 focus:ring-2 focus:ring-offset-2 focus:ring-gray-900"
            />
          </div>
        </div>
      </main>
    </>
  )
}
