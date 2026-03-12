
import type { Metadata } from "next";
import { Figtree } from "next/font/google"; // Importamos Figtree
import "./globals.css";

import { QueryProvider } from "@/providers/query-provider";
import { AuthProvider } from "@/contexts/AuthContext";
import { cn } from "@/lib/utils";

// Inicializamos Figtree como la fuente principal para la variable --font-sans
const figtree = Figtree({
  subsets: ['latin'],
  variable: '--font-sans',
  weight: ['400', '500', '600', '700'] // Pesos comunes para UI
});

export const metadata: Metadata = {
  title: "Done! | Compra y Venta Online", // Título actualizado
  description: "La plataforma líder para comprar y vender en línea de forma segura y fácil.", // Descripción actualizada
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="es" className={cn("font-sans", figtree.variable)}>
      <body>
        <QueryProvider>
          <AuthProvider>
            {children}
          </AuthProvider>
        </QueryProvider>
      </body>
    </html>
  );
}
