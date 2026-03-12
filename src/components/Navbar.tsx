
'use client'

import Link from 'next/link'
import Image from 'next/image'
import { useAuth } from '@/contexts/AuthContext'
import UserDropdown from '@/components/UserDropdown'

export default function Navbar() {
  const { isAuthenticated } = useAuth()

  return (
    <header className="fixed top-0 left-0 right-0 z-50 bg-[var(--brand)] shadow-md">
      <nav className="container mx-auto flex items-center justify-between h-16 px-4">
        {/* Logo */}
        <Link href="/" className="flex items-center">
          <Image
            src="/assets/logo-navbar.svg"
            alt="Done! Logo"
            width={100}
            height={40}
            priority
          />
        </Link>

        {/* Botones de navegación */}
        <div className="flex items-center gap-4">
          {isAuthenticated ? (
            <>
              <Link href="/feria" className="rainbow-btn">
                Feria Virtual
              </Link>
              <UserDropdown />
            </>
          ) : (
            <>
              <Link href="/feria" className="rainbow-btn">
                Feria Virtual
              </Link>
              <Link href="/auth/login" className="rainbow-btn">
                Iniciar Sesión
              </Link>
              <Link href="/auth/register" className="rainbow-btn">
                Crear Cuenta
              </Link>
            </>
          )}
        </div>
      </nav>
    </header>
  )
}
