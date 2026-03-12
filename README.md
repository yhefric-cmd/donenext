# Enterprise Next.js

Aplicación enterprise moderna construida con Next.js 15, Supabase y las mejores librerías del ecosistema React.

## 🚀 Stack Tecnológico

### Frontend
- **Next.js 15** - Framework React con App Router
- **TypeScript** - Tipado estático
- **TailwindCSS** - Framework de CSS
- **shadcn/ui** - Componentes UI modernos
- **React Hook Form + Zod** - Formularios y validación
- **TanStack Query** - Gestión de estado del servidor
- **Lucide React** - Iconos

### Backend & Database
- **Supabase** - Base de datos PostgreSQL y autenticación
- **Real-time subscriptions** - Actualizaciones en tiempo real
- **Edge functions** - Funciones serverless
- **Storage** - Almacenamiento de archivos

## 📋 Requisitos

- Node.js 18+
- npm o yarn

## 🛠️ Instalación

1. Clona el repositorio
2. Instala dependencias:
```bash
npm install
```

3. Configura las variables de entorno:
```bash
cp env.example .env.local
```

4. Configura tu proyecto Supabase y añade las credenciales en `.env.local`:
```env
NEXT_PUBLIC_SUPABASE_URL=your_supabase_url_here
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key_here
```

## 🚀 Ejecución

Inicia el servidor de desarrollo:

```bash
npm run dev
```

Abre [http://localhost:3000](http://localhost:3000) en tu navegador.

## 📁 Estructura del Proyecto

```
src/
├── app/                 # App Router de Next.js
├── components/          # Componentes React
│   └── ui/             # Componentes UI (shadcn/ui)
├── lib/                # Utilidades y configuración
├── providers/          # Providers de React
└── types/              # Tipos TypeScript
```

## 🎯 Características

- ✅ Next.js 15 con App Router
- ✅ TypeScript para tipado seguro
- ✅ TailwindCSS para estilos modernos
- ✅ Supabase para base de datos y auth
- ✅ TanStack Query para data fetching
- ✅ React Hook Form + Zod para formularios
- ✅ Componentes UI reutilizables
- ✅ Estructura enterprise-ready

## 📚 Documentación

- [Next.js Documentation](https://nextjs.org/docs)
- [Supabase Documentation](https://supabase.com/docs)
- [TailwindCSS Documentation](https://tailwindcss.com/docs)
- [shadcn/ui Documentation](https://ui.shadcn.com)

## 🚀 Deploy

La forma más fácil de desplegar es usar [Vercel Platform](https://vercel.com/new?utm_medium=default-template&filter=next.js&utm_source=create-next-app&utm_campaign=create-next-app-readme).

Revisa la [documentación de deploy de Next.js](https://nextjs.org/docs/app/building-your-application/deploying) para más detalles.
