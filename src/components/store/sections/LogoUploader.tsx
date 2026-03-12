'use client'

import { useState, useCallback } from 'react'
import { useDropzone } from 'react-dropzone'
import { Upload, X, Loader2 } from 'lucide-react'
import { cn } from '@/lib/utils'
import { useStoreSettings, useStoreEditor } from '@/lib/store/store-store'

interface LogoUploaderProps {
  currentLogo?: string
  onLogoChange: (logoUrl: string) => void
  className?: string
}

export default function LogoUploader({ currentLogo, onLogoChange, className }: LogoUploaderProps) {
  const [isUploading, setIsUploading] = useState(false)
  const [preview, setPreview] = useState<string | null>(currentLogo || null)
  const [error, setError] = useState<string | null>(null)

  const uploadToSupabase = async (file: File): Promise<string> => {
    const formData = new FormData()
    formData.append('file', file)
    formData.append('bucket', 'logos')
    
    try {
      const response = await fetch('/api/upload/logo', {
        method: 'POST',
        body: formData,
      })
      
      if (!response.ok) {
        throw new Error('Error al subir el logo')
      }
      
      const data = await response.json()
      return data.url
    } catch (error) {
      console.error('Error uploading logo:', error)
      throw error
    }
  }

  const onDrop = useCallback(async (acceptedFiles: File[]) => {
    const file = acceptedFiles[0]
    if (!file) return

    // Validar tipo de archivo
    if (!file.type.startsWith('image/')) {
      setError('Solo se permiten archivos de imagen')
      return
    }

    // Validar tamaño (máximo 5MB)
    if (file.size > 5 * 1024 * 1024) {
      setError('El archivo no debe superar los 5MB')
      return
    }

    setError(null)
    setIsUploading(true)

    // Crear preview inmediato
    const reader = new FileReader()
    reader.onload = (e) => {
      setPreview(e.target?.result as string)
    }
    reader.readAsDataURL(file)

    try {
      // Subir a Supabase
      const logoUrl = await uploadToSupabase(file)
      onLogoChange(logoUrl)
      setPreview(logoUrl)
    } catch (error) {
      setError('Error al subir el logo')
      setPreview(currentLogo || null)
    } finally {
      setIsUploading(false)
    }
  }, [currentLogo, onLogoChange])

  const { getRootProps, getInputProps, isDragActive } = useDropzone({
    onDrop,
    accept: {
      'image/*': ['.png', '.jpg', '.jpeg', '.webp', '.gif']
    },
    maxFiles: 1,
    multiple: false,
    disabled: isUploading
  })

  const removeLogo = () => {
    setPreview(null)
    onLogoChange('')
    setError(null)
  }

  return (
    <div className={cn('space-y-3', className)}>
      <div
        {...getRootProps()}
        className={cn(
          "relative w-24 h-24 border-2 border-dashed rounded-lg cursor-pointer transition-all duration-300",
          "hover:border-[#22226B]/50 hover:bg-[#22226B]/5",
          "flex items-center justify-center overflow-hidden",
          isDragActive && "border-[#22226B] bg-[#22226B]/10",
          isUploading && "cursor-not-allowed opacity-50"
        )}
      >
        <input {...getInputProps()} />
        
        {preview ? (
          <>
            <img 
              src={preview} 
              alt="Logo preview" 
              className="w-full h-full object-cover"
            />
            
            {!isUploading && (
              <button
                onClick={(e) => {
                  e.stopPropagation()
                  removeLogo()
                }}
                className="absolute top-1 right-1 bg-red-500 text-white rounded-full p-1 hover:bg-red-600 transition-colors"
              >
                <X size={12} />
              </button>
            )}
          </>
        ) : (
          <div className="text-center p-2">
            {isUploading ? (
              <Loader2 className="w-6 h-6 mx-auto text-[#22226B] animate-spin" />
            ) : (
              <Upload className="w-6 h-6 mx-auto text-[#22226B]/60" />
            )}
            <p className="text-xs text-[#22226B]/60 mt-1 font-inter">
              {isDragActive ? 'Suelta aquí' : 'Logo'}
            </p>
          </div>
        )}
      </div>

      {error && (
        <p className="text-xs text-red-500 font-inter">{error}</p>
      )}

      <p className="text-xs text-gray-400 font-inter">
        PNG, JPG, WebP (máx. 5MB)
      </p>
    </div>
  )
}
