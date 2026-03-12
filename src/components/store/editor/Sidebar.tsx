import React from 'react';
import StoreProfile from './StoreProfile';
import EditorAccordion from './EditorAccordion';
import PublishButton from './PublishButton';

const Sidebar = () => {
  return (
    <div className="flex h-full flex-col bg-gray-900 text-white">
      {/* Perfil de la Tienda */}
      <div className="p-4">
        <StoreProfile />
      </div>

      {/* Acordeón del Editor */}
      <div className="flex-1 overflow-y-auto">
        <EditorAccordion />
      </div>

      {/* Botón de Publicar */}
      <div className="p-4 border-t border-gray-800">
        <PublishButton />
      </div>
    </div>
  );
};

export default Sidebar;
