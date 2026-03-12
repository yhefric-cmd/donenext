'use client'

import * as React from 'react'
import * as SelectPrimitive from '@radix-ui/react-select'
import { ChevronDown } from 'lucide-react'
import { cn } from '@/lib/utils'

const SelectCaptura = React.forwardRef<
  React.ElementRef<typeof SelectPrimitive.Trigger>,
  React.ComponentPropsWithoutRef<typeof SelectPrimitive.Trigger>
>(({ className, children, ...props }, ref) => (
  <SelectPrimitive.Trigger
    ref={ref}
    className={cn(
      // Base del dropdown exacto como captura
      'flex h-11 w-full items-center justify-between',
      'border border-gray-200 bg-white px-4 py-2 text-sm',
      'text-gray-900 placeholder:text-gray-500',
      'focus:outline-none focus:ring-2 focus:ring-gray-100',
      'disabled:cursor-not-allowed disabled:opacity-50',
      // Sin bordes redondeados como la captura
      'rounded-none',
      // Hover sutil como la captura
      'hover:bg-gray-50',
      className
    )}
    {...props}
  >
    {children}
    <ChevronDown className="ml-2 h-4 w-4 shrink-0 text-gray-600" />
  </SelectPrimitive.Trigger>
))
SelectCaptura.displayName = SelectPrimitive.Trigger.displayName

const SelectContentCaptura = React.forwardRef<
  React.ElementRef<typeof SelectPrimitive.Content>,
  React.ComponentPropsWithoutRef<typeof SelectPrimitive.Content>
>(({ className, children, ...props }, ref) => (
  <SelectPrimitive.Content
    ref={ref}
    className={cn(
      // Contenido del dropdown exacto como captura
      'relative z-50 min-w-[8rem] overflow-hidden rounded-md',
      'border border-gray-200 bg-white p-1 text-gray-900',
      'shadow-lg',
      // Sin bordes redondeados como la captura
      'rounded-none',
      'data-[state=open]:animate-in data-[state=closed]:animate-out',
      'data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0',
      'data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95',
      'data-[side=bottom]:slide-in-from-top-2',
      'data-[side=left]:slide-in-from-right-2',
      'data-[side=right]:slide-in-from-left-2',
      'data-[side=top]:slide-in-from-bottom-2',
      className
    )}
    {...props}
  >
    <SelectPrimitive.Viewport className={cn('p-1', 'h-[var(--radix-select-trigger-height)]')}>
      {children}
    </SelectPrimitive.Viewport>
  </SelectPrimitive.Content>
))
SelectContentCaptura.displayName = SelectPrimitive.Content.displayName

const SelectItemCaptura = React.forwardRef<
  React.ElementRef<typeof SelectPrimitive.Item>,
  React.ComponentPropsWithoutRef<typeof SelectPrimitive.Item>
>(({ className, children, ...props }, ref) => (
  <SelectPrimitive.Item
    ref={ref}
    className={cn(
      // Items del dropdown exacto como captura
      'relative flex w-full cursor-pointer select-none items-center',
      'py-2 px-3 text-sm text-gray-900',
      'outline-none focus:bg-gray-100 focus:text-gray-900',
      // Sin bordes redondeados como la captura
      'rounded-none',
      'hover:bg-gray-50',
      'data-[disabled]:pointer-events-none data-[disabled]:opacity-50',
      className
    )}
    {...props}
  >
    {children}
  </SelectPrimitive.Item>
))
SelectItemCaptura.displayName = SelectPrimitive.Item.displayName

export { SelectCaptura, SelectContentCaptura, SelectItemCaptura }
