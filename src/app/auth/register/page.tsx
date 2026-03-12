'use client'

import { useState, useEffect } from 'react'
import Link from 'next/link'
import { useRouter } from 'next/navigation'
import { useAuth } from '@/contexts/AuthContext'

// Importa los componentes de Shadcn/UI
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select"

// Tipos de datos
interface Department { id: number; name: string; }
interface Municipality { id: number; name: string; departmentId: number; }

export default function RegisterPage() {
  const [formData, setFormData] = useState({
    nombres: '', apellidos: '', email: '', telefono: '',
    departamento: '', municipio: '', password: '', terms: false,
  });
  const [errors, setErrors] = useState<Record<string, string>>({});
  const [loading, setLoading] = useState(false);
  const router = useRouter();
  const { login } = useAuth();

  const [allDepartments, setAllDepartments] = useState<Department[]>([]);
  const [allMunicipalities, setAllMunicipalities] = useState<Municipality[]>([]);
  const [filteredMunicipalities, setFilteredMunicipalities] = useState<Municipality[]>([]);
  const [loadingData, setLoadingData] = useState(true);

  // --- Lógica de carga de datos y validación (sin cambios) ---
  useEffect(() => {
    const fetchData = async () => {
      setLoadingData(true);
      try {
        const res = await fetch('/api/departments');
        const data = await res.json(); // Siempre intentar parsear el JSON

        if (!res.ok || !data.success) {
          console.error("Error fetching location data:", data.details || 'No details provided');
          throw new Error('Failed to fetch location data from API');
        }

        setAllDepartments(data.departments || []);
        setAllMunicipalities(data.municipalities || []);
      } catch (error) {
        console.error(error);
        setErrors(prev => ({ ...prev, general: 'No se pudieron cargar los datos de ubicación.' }));
      } finally {
        setLoadingData(false);
      }
    };
    fetchData();
  }, []);

  useEffect(() => {
    if (formData.departamento) {
      const departmentId = parseInt(formData.departamento, 10);
      setFilteredMunicipalities(allMunicipalities.filter(m => m.departmentId === departmentId));
    } else {
      setFilteredMunicipalities([]);
    }
  }, [formData.departamento, allMunicipalities]);

  const handleInputChange = (field: string, value: string | boolean) => {
    setFormData(prev => ({ ...prev, [field]: value }));
    if (field === 'departamento') {
      setFormData(prev => ({ ...prev, municipio: '' }));
    }
    if (errors[field]) {
      setErrors(prev => ({ ...prev, [field]: '' }));
    }
  };

  const handleSelectChange = (field: 'departamento' | 'municipio', value: string) => {
      handleInputChange(field, value);
  };
  
  const validateForm = () => {
    const newErrors: Record<string, string> = {}
    if (!formData.email.trim()) newErrors.email = 'Ingresa tu correo electrónico';
    if (!formData.nombres.trim()) newErrors.nombres = 'Ingresa tu nombre';
    if (!formData.apellidos.trim()) newErrors.apellidos = 'Ingresa tu apellido';
    if (!formData.departamento) newErrors.departamento = 'Selecciona un departamento';
    if (!formData.municipio) newErrors.municipio = 'Selecciona un municipio';
    if (formData.password.length < 4) newErrors.password = 'Mínimo 4 caracteres';
    if (!formData.terms) newErrors.terms = 'Debes aceptar los términos';
    const telRegex = /^[67][0-9]{7}$/;
    if (!formData.telefono || !telRegex.test(formData.telefono)) {
      newErrors.telefono = 'Ingresa un número de celular válido';
    }
    setErrors(newErrors);
    return Object.keys(newErrors).length === 0;
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!validateForm()) return;

    setLoading(true);
    try {
      const response = await fetch('/api/auth/register', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          nombre: formData.nombres + ' ' + formData.apellidos,
          email: formData.email,
          telefono: formData.telefono,
          departamento: formData.departamento,
          ciudad: formData.municipio,
          password: formData.password,
        }),
      });

      const result = await response.json();

      if (result.success) {
        login(result.user); // Asumiendo que `login` puede manejar el objeto de usuario
        router.push('/');
      } else {
        setErrors({ general: result.error || 'Error al registrarse' });
      }
    } catch (err) {
      setErrors({ general: 'Error de conexión' });
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="min-h-screen bg-gray-50 flex items-center justify-center py-12 px-4 sm:px-6 lg:px-8">
      <div className="w-full max-w-md space-y-8">
        <div className="text-center">
          <h1 className="text-3xl font-extrabold text-gray-900">Crear una cuenta</h1>
          <p className="mt-2 text-sm text-gray-600">Únete para empezar a explorar.</p>
        </div>

        <div className="bg-white py-8 px-4 shadow-sm sm:rounded-lg sm:px-10 border border-gray-200">
          {errors.general && (
            <div className="mb-4 rounded-md bg-red-50 p-4">
              <p className="text-sm font-medium text-red-800">{errors.general}</p>
            </div>
          )}
          <form onSubmit={handleSubmit} className="space-y-6">
            <div className="grid grid-cols-1 gap-y-6 gap-x-4 sm:grid-cols-2">
              <div className="space-y-1">
                <Label htmlFor="nombres">Nombres</Label>
                <Input id="nombres" type="text" required value={formData.nombres} onChange={e => handleInputChange('nombres', e.target.value)} />
                {errors.nombres && <p className="text-sm text-red-600">{errors.nombres}</p>}
              </div>
              <div className="space-y-1">
                <Label htmlFor="apellidos">Apellidos</Label>
                <Input id="apellidos" type="text" required value={formData.apellidos} onChange={e => handleInputChange('apellidos', e.target.value)} />
                {errors.apellidos && <p className="text-sm text-red-600">{errors.apellidos}</p>}
              </div>
            </div>

            <div className="space-y-1">
              <Label htmlFor="email">Correo electrónico</Label>
              <Input id="email" type="email" required value={formData.email} onChange={e => handleInputChange('email', e.target.value)} />
              {errors.email && <p className="text-sm text-red-600">{errors.email}</p>}
            </div>

            <div className="space-y-1">
              <Label htmlFor="telefono">Teléfono</Label>
              <Input id="telefono" type="tel" required value={formData.telefono} onChange={e => handleInputChange('telefono', e.target.value)} maxLength={8} />
              {errors.telefono && <p className="text-sm text-red-600">{errors.telefono}</p>}
            </div>
            
            <div className="grid grid-cols-1 gap-y-6 gap-x-4 sm:grid-cols-2">
              <div className="space-y-1">
                <Label htmlFor="departamento">Departamento</Label>
                <Select onValueChange={(value) => handleSelectChange('departamento', value)} value={formData.departamento} disabled={loadingData}>
                  <SelectTrigger>
                    <SelectValue placeholder={loadingData ? "Cargando..." : "Seleccionar"} />
                  </SelectTrigger>
                  <SelectContent>
                    {allDepartments.map(d => <SelectItem key={d.id} value={String(d.id)}>{d.name}</SelectItem>)}
                  </SelectContent>
                </Select>
                {errors.departamento && <p className="text-sm text-red-600">{errors.departamento}</p>}
              </div>
              <div className="space-y-1">
                <Label htmlFor="municipio">Municipio</Label>
                <Select onValueChange={(value) => handleSelectChange('municipio', value)} value={formData.municipio} disabled={!formData.departamento}>
                  <SelectTrigger>
                    <SelectValue placeholder="Seleccionar" />
                  </SelectTrigger>
                  <SelectContent>
                    {filteredMunicipalities.map(m => <SelectItem key={m.id} value={String(m.id)}>{m.name}</SelectItem>)}
                  </SelectContent>
                </Select>
                {errors.municipio && <p className="text-sm text-red-600">{errors.municipio}</p>}
              </div>
            </div>

            <div className="space-y-1">
                <Label htmlFor="password">Contraseña</Label>
                <Input id="password" type="password" required value={formData.password} onChange={e => handleInputChange('password', e.target.value)} />
                {errors.password && <p className="text-sm text-red-600">{errors.password}</p>}
            </div>

            <div className="flex items-center">
              <input id="terms" type="checkbox" checked={formData.terms} onChange={e => handleInputChange('terms', e.target.checked)} className="h-4 w-4 rounded border-gray-300 text-gray-900 focus:ring-gray-900" />
              <Label htmlFor="terms" className="ml-2 block text-sm font-medium">
                Acepto los términos y condiciones.
              </Label>
            </div>
             {errors.terms && <p className="text-sm text-red-600">{errors.terms}</p>}


            <div>
              <Button type="submit" disabled={loading} className="w-full">
                {loading ? 'Creando cuenta...' : 'Crear Cuenta'}
              </Button>
            </div>
          </form>

          <div className="mt-6 text-center text-sm">
            <p className="text-gray-600">
              ¿Ya tienes una cuenta? {' '}
              <Link href="/auth/login" className="font-medium text-gray-900 hover:text-gray-700 underline">
                Inicia sesión
              </Link>
            </p>
          </div>
        </div>
      </div>
    </div>
  );
}