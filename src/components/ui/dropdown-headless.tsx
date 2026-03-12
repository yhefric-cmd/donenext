'use client'

import { useState } from 'react'
import { Listbox, ListboxButton, ListboxOptions, ListboxOption } from '@headlessui/react'
import { ChevronDown } from 'lucide-react'
import { cn } from '@/lib/utils'

interface DropdownHeadlessProps<T extends string> {
  value: T
  onValueChange: (value: T) => void
  placeholder?: string
  options: { value: T; label: string }[]
  className?: string
}

export default function DropdownHeadless<T extends string>({ 
  value, 
  onValueChange, 
  placeholder = "Seleccionar opción", 
  options,
  className 
}: DropdownHeadlessProps<T>) {
  const selectedOption = options.find((opt: { value: T; label: string }) => opt.value === value)

  return (
    <div className={cn("relative", className)}>
      <Listbox value={value} onChange={onValueChange}>
        {/* Button Trigger - SIN AFECTAR LAYOUT */}
        <ListboxButton
          className={cn(
            "w-full h-12 px-4 justify-start transition-all duration-300",
            "border-2 hover:border-[#22226B]/50 hover:shadow-md",
            "bg-white shadow-sm text-sm font-medium",
            "flex items-center gap-3",
            "focus:outline-none focus:border-[#22226B] focus:shadow-lg",
            "rounded-lg cursor-pointer relative z-10"
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
            className="w-4 h-4 text-gray-500 transition-transform duration-200"
          />
        </ListboxButton>

        {/* Options - FIXED POSITION SIN AFECTAR LAYOUT */}
        <div className="absolute left-0 right-0 z-[9999]">
          <div className={cn(
            "mt-1 bg-white border-2 border-[#22226B]/20 rounded-lg shadow-lg overflow-hidden"
          )}>
            <div className="py-1 max-h-48 overflow-y-auto">
              {options.map((option) => (
                <ListboxOption
                  key={option.value}
                  value={option.value}
                  className={cn(
                    "w-full px-4 py-3 text-left text-sm font-medium block",
                    "hover:bg-[#22226B]/10 transition-colors duration-150",
                    "focus:bg-[#22226B]/10 focus:outline-none cursor-pointer",
                    value === option.value && "bg-[#22226B]/5 text-[#22226B]",
                    "font-inter"
                  )}
                >
                  {option.label}
                </ListboxOption>
              ))}
            </div>
          </div>
        </div>
      </Listbox>
    </div>
  )
}
