'use client'

import { useState, useRef, useEffect } from 'react'
import { ChevronDown } from 'lucide-react'
import { cn } from '@/lib/utils'

interface DropdownCustomProps<T extends string> {
  value: T
  onValueChange: (value: T) => void
  placeholder?: string
  options: { value: T; label: string }[]
  className?: string
}

export default function DropdownCustom<T extends string>({ 
  value, 
  onValueChange, 
  placeholder = "Seleccionar opción", 
  options,
  className 
}: DropdownCustomProps<T>) {
  const [isOpen, setIsOpen] = useState(false)
  const dropdownRef = useRef<HTMLDivElement>(null)

  const selectedOption = options.find((opt: { value: T; label: string }) => opt.value === value)

  useEffect(() => {
    const handleClickOutside = (event: MouseEvent) => {
      if (dropdownRef.current && !dropdownRef.current.contains(event.target as Node)) {
        setIsOpen(false)
      }
    }

    document.addEventListener('mousedown', handleClickOutside)
    return () => document.removeEventListener('mousedown', handleClickOutside)
  }, [])

  return (
    <div ref={dropdownRef} className={cn("relative", className)}>
      {/* Trigger Button - SIN INPUT DETRÁS */}
      <button
        type="button"
        onClick={() => setIsOpen(!isOpen)}
        className={cn(
          "w-full h-12 px-4 justify-start transition-all duration-300",
          "border-2 hover:border-[#22226B]/50 hover:shadow-md",
          "bg-white shadow-sm text-sm font-medium",
          "flex items-center gap-3",
          "focus:outline-none focus:border-[#22226B] focus:shadow-lg"
        )}
        style={{
          boxShadow: '0 1px 3px rgba(34, 34, 107, 0.1), 0 1px 2px rgba(34, 34, 107, 0.06)',
        }}
      >
        <span className={cn(
          "flex-1 text-left",
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

      {/* Dropdown Content - Z-INDEX ALTÍSIMO */}
      {isOpen && (
        <div className={cn(
          "absolute top-full left-0 right-0 mt-1",
          "bg-white border-2 border-[#22226B]/20 rounded-lg shadow-lg",
          "z-[9999] overflow-hidden" // Z-INDEX MÁXIMO
        )}>
          <div className="py-1">
            {options.map((option) => (
              <button
                key={option.value}
                type="button"
                onClick={() => {
                  onValueChange(option.value)
                  setIsOpen(false)
                }}
                className={cn(
                  "w-full px-4 py-3 text-left text-sm font-medium",
                  "hover:bg-[#22226B]/10 transition-colors duration-150",
                  "focus:bg-[#22226B]/10 focus:outline-none",
                  value === option.value && "bg-[#22226B]/5 text-[#22226B]",
                  "font-inter"
                )}
              >
                {option.label}
              </button>
            ))}
          </div>
        </div>
      )}
    </div>
  )
}
