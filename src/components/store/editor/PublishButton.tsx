import React from 'react';
import { useStoreIsDirty, useStoreIsSaving, useStoreEditor } from '@/lib/store/store-store';
import { Button } from '@/components/ui/button';
import { Loader2, UploadCloud } from 'lucide-react';
import { cn } from '@/lib/utils/cn';

const PublishButton = () => {
  const isDirty = useStoreIsDirty();
  const isSaving = useStoreIsSaving();
  const saveStore = useStoreEditor((state) => state.saveStore);

  const handleSave = async () => {
    if (!isDirty || isSaving) return;
    try {
      await saveStore();
    } catch (error) {
      console.error('Error al publicar los cambios:', error);
      // Aquí podrías añadir un toast o notificación de error
    }
  };

  return (
    <Button
      onClick={handleSave}
      disabled={!isDirty || isSaving}
      className={cn(
        'w-full font-bold text-lg py-6 transition-all duration-300',
        isDirty && !isSaving
          ? 'bg-green-500 text-white hover:bg-green-600'
          : 'bg-gray-700 text-gray-400 cursor-not-allowed'
      )}
    >
      {isSaving ? (
        <><Loader2 className="mr-2 h-5 w-5 animate-spin" /> Guardando...</>
      ) : (
        <><UploadCloud className="mr-2 h-5 w-5" /> Publicar Cambios</>
      )}
    </Button>
  );
};

export default PublishButton;
