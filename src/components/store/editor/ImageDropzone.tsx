import React, { useCallback, useState } from 'react';
import { useDropzone, FileRejection } from 'react-dropzone';
import { Image as ImageIcon, UploadCloud, X } from 'lucide-react';
import { cn } from '@/lib/utils/cn';

interface ImageDropzoneProps {
  initialImageUrl?: string | null;
}

const ImageDropzone: React.FC<ImageDropzoneProps> = ({ initialImageUrl }) => {
  const [preview, setPreview] = useState<string | null>(initialImageUrl || null);

  const onDrop = useCallback((acceptedFiles: File[], fileRejections: FileRejection[]) => {
    if (fileRejections.length > 0) {
      // Aquí podríamos mostrar un error al usuario
      console.error('Archivo no aceptado');
      return;
    }
    if (acceptedFiles.length > 0) {
      const file = acceptedFiles[0];
      const reader = new FileReader();
      reader.onload = () => {
        setPreview(reader.result as string);
      };
      reader.readAsDataURL(file);
    }
  }, []);

  const { getRootProps, getInputProps, isDragActive } = useDropzone({
    onDrop,
    accept: { 'image/*': ['.png', '.gif', '.jpeg', '.jpg', '.webp'] },
    multiple: false,
  });

  const removePreview = (e: React.MouseEvent) => {
    e.stopPropagation();
    setPreview(null);
  };

  return (
    <div
      {...getRootProps()}
      className={cn(
        'relative group flex flex-col items-center justify-center w-full h-48 border-2 border-dashed rounded-lg cursor-pointer transition-colors',
        isDragActive ? 'border-blue-500 bg-blue-50/50' : 'border-gray-300 hover:border-gray-400',
        preview ? 'border-solid' : ''
      )}
    >
      <input {...getInputProps()} />
      {preview ? (
        <>
          <img src={preview} alt="Vista previa" className="h-full w-full object-contain rounded-md" />
          <button 
            onClick={removePreview} 
            className="absolute top-2 right-2 p-1.5 bg-gray-800/60 rounded-full text-white opacity-0 group-hover:opacity-100 transition-opacity"
          >
            <X size={16} />
          </button>
        </>
      ) : (
        <div className="text-center text-gray-500">
          <UploadCloud size={40} className="mx-auto mb-2" />
          <p className="font-semibold">Arrastra y suelta una imagen aquí</p>
          <p className="text-xs">o haz clic para seleccionar un archivo</p>
        </div>
      )}
    </div>
  );
};

export default ImageDropzone;
