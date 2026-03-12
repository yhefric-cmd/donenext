import React from 'react';
import { Label } from "@/components/ui/label";
import { Input } from "@/components/ui/input";
import { Switch } from "@/components/ui/switch";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import ImageDropzone from '../ImageDropzone';
import ColorPicker from './ColorPicker';

const VisualIdentityForm = () => {
  return (
    <div className="space-y-6">
      {/* Sección Nombre de la Tienda */}
      <div className="space-y-2">
        <div className="flex items-center justify-between">
          <Label htmlFor="store-name" className="text-base font-semibold">Nombre</Label>
          <Switch id="show-store-name" />
        </div>
        <Input id="store-name" placeholder="Ej: Mi increíble Tienda" />
      </div>

      {/* Sección Logo */}
      <div className="space-y-2">
        <div className="flex items-center justify-between">
          <Label className="text-base font-semibold">Logo principal</Label>
          <Switch id="show-logo" />
        </div>
        <ImageDropzone />
      </div>

      {/* Sección Color de Marca */}
      <div className="space-y-2">
        <Label className="text-base font-semibold">Color de Marca</Label>
        <ColorPicker />
      </div>

      {/* Sección Barra de Navegación */}
      <div className="space-y-2">
        <Label htmlFor="navbar-style" className="text-base font-semibold">Barra de Navegación</Label>
        <Select>
          <SelectTrigger>
            <SelectValue placeholder="Seleccionar estilo..." />
          </SelectTrigger>
          <SelectContent>
            <SelectItem value="blanco">Blanco</SelectItem>
            <SelectItem value="marca">Color de Marca</SelectItem>
          </SelectContent>
        </Select>
      </div>

      {/* Sección Fondo de Página */}
      <div className="space-y-2">
        <Label htmlFor="background-style" className="text-base font-semibold">Fondo de Página</Label>
        <Select>
          <SelectTrigger>
            <SelectValue placeholder="Seleccionar fondo..." />
          </SelectTrigger>
          <SelectContent>
            <SelectItem value="blanco">Blanco</SelectItem>
            <SelectItem value="tintado">Color de Marca (ligero)</SelectItem>
            <SelectItem value="gris">Gris</SelectItem>
          </SelectContent>
        </Select>
      </div>
    </div>
  );
};

export default VisualIdentityForm;
