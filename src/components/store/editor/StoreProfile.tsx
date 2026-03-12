import React from 'react';
import { useStoreSettings } from '@/lib/store/store-store';
import { Avatar, AvatarFallback, AvatarImage } from '@/components/ui/avatar';
import { ChevronDown } from 'lucide-react';

const StoreProfile = () => {
  const store = useStoreSettings();

  return (
    <div className="p-4 bg-gray-800/50 rounded-lg">
      <div className="flex items-center justify-between">
        <div className="flex items-center gap-3">
          <Avatar>
            <AvatarImage src={store.logo || ''} alt={store.nombre} />
            <AvatarFallback>{store.nombre?.charAt(0).toUpperCase() || 'T'}</AvatarFallback>
          </Avatar>
          <span className="font-semibold text-base">{store.nombre || 'Mi Tienda'}</span>
        </div>
        <button className="p-1 rounded-md hover:bg-gray-700">
          <ChevronDown size={20} />
        </button>
      </div>
    </div>
  );
};

export default StoreProfile;
