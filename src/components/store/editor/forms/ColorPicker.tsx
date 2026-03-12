import React, { useState } from 'react';
import { Popover, PopoverContent, PopoverTrigger } from "@/components/ui/popover";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { cn } from '@/lib/utils/cn';
import { ChevronDown, ChevronUp, Check } from 'lucide-react';

const colorPalette = [
  '#FF0000', '#E1306C', '#FF017B', '#BA2C5D', '#ff6a00', '#F16253', '#D85427', '#E07A5F',
  '#C19A6B', '#794C1E', '#FFBF00', '#D4AF37', '#E1E66B', '#25D366', '#00A86B', '#20c997',
  '#008080', '#8A9A5B', '#3A5829', '#8C8733', '#666229', '#1a73e8', '#038CB4', '#026E8F',
  '#00374A', '#8C92AC', '#22226B', '#6C4DF2', '#6A0DAD', '#5A54A4', '#BDB0D0', '#602A7B',
  '#34495E', '#999999', '#000000', '#FFFFFF'
];

interface ColorPickerProps {
  initialColor?: string;
}

const ColorPicker: React.FC<ColorPickerProps> = ({ initialColor = '#008080' }) => {
  const [color, setColor] = useState(initialColor);
  const [isOpen, setIsOpen] = useState(false);

  const handleColorSelect = (newColor: string) => {
    setColor(newColor);
  };

  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setColor(e.target.value);
  };

  return (
    <Popover open={isOpen} onOpenChange={setIsOpen}>
      <PopoverTrigger asChild>
        <Button
          variant="outline"
          className="w-full justify-between text-left font-normal"
        >
          <div className="flex items-center gap-2">
            <div
              className="h-5 w-5 rounded-md border"
              style={{ backgroundColor: color }}
            />
            Seleccionar Color
          </div>
          {isOpen ? <ChevronUp className="h-4 w-4 opacity-50" /> : <ChevronDown className="h-4 w-4 opacity-50" />}
        </Button>
      </PopoverTrigger>
      <PopoverContent 
        className="w-64 p-3 rounded-lg shadow-lg border bg-white"
        align="start"
      >
        <div className="grid grid-cols-8 gap-2 justify-items-center">
          {colorPalette.map((swatchColor) => {
            const isActive = swatchColor.toLowerCase() === color.toLowerCase();
            return (
              <button
                key={swatchColor}
                className={cn(
                  "h-6 w-6 rounded-md border transition-transform duration-100 ease-in-out hover:scale-110 focus:outline-none flex items-center justify-center",
                  isActive ? 'ring-2 ring-offset-2 ring-blue-500' : 'border-gray-200'
                )}
                style={{ backgroundColor: swatchColor }}
                onClick={() => handleColorSelect(swatchColor)}
              >
                {isActive && <Check className="h-4 w-4 text-white" />}
              </button>
            )
          })}
        </div>
        <div className="flex items-center gap-2 mt-4">
          <div
            className="h-8 w-8 rounded-md border"
            style={{ backgroundColor: color }}
          />
          <Input 
            value={color.toUpperCase()} 
            onChange={handleInputChange} 
            className="flex-1"
          />
        </div>
      </PopoverContent>
    </Popover>
  );
};

export default ColorPicker;
