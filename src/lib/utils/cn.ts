import { type ClassValue, clsx } from 'clsx'
import { twMerge } from 'tailwind-merge'

// Utilidad DRY para combinar clases - Reutilizable en todo el proyecto
export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs))
}
