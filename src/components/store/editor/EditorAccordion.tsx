import React from 'react';
import {
  Accordion,
  AccordionContent,
  AccordionItem,
  AccordionTrigger,
} from "@/components/ui/accordion";
import { Brush, AtSign, LayoutTemplate, Palette, Package } from 'lucide-react';

// El contenido del antiguo VisualIdentityPanel va aquí directamente
import VisualIdentityForm from './forms/VisualIdentityForm';

const navItems = [
  { id: 'visual-identity', label: 'Identidad Visual', icon: Brush, content: <VisualIdentityForm /> },
  { id: 'contact-channels', label: 'Canales de Contacto', icon: AtSign, content: <p>Formulario de Canales de Contacto...</p> },
  { id: 'sections', label: 'Secciones', icon: LayoutTemplate, content: <p>Formulario de Secciones...</p> },
  { id: 'customization', label: 'Personalización', icon: Palette, content: <p>Formulario de Personalización...</p> },
  { id: 'product-management', label: 'Gestión de Productos', icon: Package, content: <p>Formulario de Gestión de Productos...</p> },
];

const EditorAccordion = () => {
  return (
    <Accordion type="single" collapsible defaultValue="visual-identity" className="w-full">
      {navItems.map((item) => (
        <AccordionItem value={item.id} key={item.id}>
          <AccordionTrigger className="hover:no-underline px-4">
            <div className="flex items-center gap-3">
              <item.icon className="h-5 w-5 text-gray-400" />
              <span className="font-semibold text-sm text-white">{item.label}</span>
            </div>
          </AccordionTrigger>
          <AccordionContent className="bg-white text-gray-800 p-6">
            {item.content}
          </AccordionContent>
        </AccordionItem>
      ))}
    </Accordion>
  );
};

export default EditorAccordion;
