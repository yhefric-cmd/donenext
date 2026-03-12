'use client'

import { useState, useRef, useEffect } from 'react'
import { createPortal } from 'react-dom'
import { ChevronDown } from 'lucide-react'
import { cn } from '@/lib/utils'

interface DropdownPortalProps<T extends string> {
  value: T
  onValueChange: (value: T) => void
  placeholder?: string
  options: { value: T; label: string }[]
  className?: string
}

export default function DropdownPortal<T extends string>({ 
  value, 
  onValueChange, 
  placeholder = "Seleccionar opción", 
  options,
  className 
}: DropdownPortalProps<T>) {
  const [isOpen, setIsOpen] = useState(false)
  const [position, setPosition] = useState({ top: 0, left: 0, width: 0 })
  const buttonRef = useRef<HTMLButtonElement>(null)
  const dropdownRef = useRef<HTMLDivElement>(null)

  const selectedOption = options.find((opt: { value: T; label: string }) => opt.value === value)

  // Calcular posición del dropdown
  const updatePosition = () => {
    if (buttonRef.current) {
      const rect = buttonRef.current.getBoundingClientRect()
      setPosition({
        top: rect.bottom + window.scrollY + 4,
        left: rect.left + window.scrollX,
        width: rect.width
      })
    }
  }

  // Actualizar posición al abrir
  useEffect(() => {
    if (isOpen) {
      updatePosition()
      window.addEventListener('scroll', updatePosition)
      window.addEventListener('resize', updatePosition)
      return () => {
        window.removeEventListener('scroll', updatePosition)
        window.removeEventListener('resize', updatePosition)
      }
    }
  }, [isOpen])

  // Click outside
  useEffect(() => {
    const handleClickOutside = (event: MouseEvent) => {
      if (dropdownRef.current && !dropdownRef.current.contains(event.target as Node) &&
          buttonRef.current && !buttonRef.current.contains(event.target as Node)) {
        setIsOpen(false)
      }
    }

    if (isOpen) {
      document.addEventListener('mousedown', handleClickOutside)
      return () => document.removeEventListener('mousedown', handleClickOutside)
    }
  }, [isOpen])

  // Renderizar dropdown en portal
  const dropdownContent = isOpen ? createPortal(
    <div
      ref={dropdownRef}
      className="fixed z-[9999]"
      style={{
        top: `${position.top}px`,
        left: `${position.left}px`,
        width: `${position.width}px`
      }}
    >
      <div className={cn(
        "bg-white border-2 border-[#22226B]/20 rounded-lg shadow-lg overflow-hidden"
      )}>
        <div className="py-1 max-h-48 overflow-y-auto">
          {options.map((option) => (
            <button
              key={option.value}
              type="button"
              onClick={() => {
                onValueChange(option.value)
                setIsOpen(false)
              }}
              className={cn(
                "w-full px-4 py-3 text-left text-sm font-medium block",
                "hover:bg-[#22226B]/10 transition-colors duration-150",
                "focus:bg-[#22226B]/10 focus:outline-none cursor-pointer",
                value === option.value && "bg-[#22226B]/5 text-[#22226B]",
                "font-inter"
              )}
            >
              {option.label}
            </button>
          ))}
        </div>
      </div>
    </div>,
    document.body
  ) : null

  return (
    <div className={cn("relative", className)}>
      {/* Button Trigger */}
      <button
        ref={buttonRef}
        type="button"
        onClick={() => setIsOpen(!isOpen)}
        className={cn(
          "w-full h-12 px-4 justify-start transition-all duration-300",
          "border-2 hover:border-[#22226B]/50 hover:shadow-md",
          "bg-white shadow-sm text-sm font-medium",
          "flex items-center gap-3",
          "focus:outline-none focus:border-[#22226B] focus:shadow-lg",
          "rounded-lg cursor-pointer"
        )}
        style={{
          boxShadow: '0 1px 3px rgba(34, 34, 107, 0.1), 0 1px 2px rgba(34, 34, 107, 0.06)',
        }}
      >
        <span className={cn(
          "flex-1 text-left font-inter",
          !selectedOption && "text-gray-400"
        )}>
          {selectedOption?.label || placeholder}
        </span>
        <ChevronDown 
          className={cn(
            "w-4 h-4 text-gray-500 transition-transform duration-200",
            isOpen && "transform rotate-180"
          )} 
        />
      </button>

      {/* Dropdown en Portal - NO AFECTA LAYOUT */}
      {dropdownContent}
    </div>
  )
}
