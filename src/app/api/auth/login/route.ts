
import { NextRequest, NextResponse } from 'next/server';
import { getDb } from '@/db';
import { users } from '@/db/schema';
import { eq } from 'drizzle-orm';
import bcrypt from 'bcryptjs';

export async function POST(request: NextRequest) {
  try {
    const db = getDb();
    const body = await request.json();
    const { telefono, password } = body;

    // 1. Validar datos de entrada
    if (!telefono || !password) {
      return NextResponse.json({ success: false, error: 'Número de celular y contraseña son requeridos' }, { status: 400 });
    }

    // 2. Buscar al usuario por número de teléfono usando Drizzle
    const user = await db.query.users.findFirst({
      where: eq(users.phone, telefono),
    });

    if (!user) {
      return NextResponse.json({ success: false, error: 'Credenciales inválidas' }, { status: 401 });
    }

    // 3. Comparar la contraseña hasheada con la proporcionada
    const isPasswordValid = await bcrypt.compare(password, user.passwordHash);

    if (!isPasswordValid) {
      return NextResponse.json({ success: false, error: 'Credenciales inválidas' }, { status: 401 });
    }

    // 4. Preparar y devolver la respuesta (sin la contraseña)
    const { passwordHash: _, ...userWithoutPassword } = user;

    // 5. Crear respuesta con cookie user_id
    const response = NextResponse.json({ success: true, user: userWithoutPassword }, { status: 200 });
    
    // Guardar user_id en cookie para que lo usen otros APIs
    console.log('DEBUG - Setting cookie user_id:', user.id.toString());
    console.log('DEBUG - NODE_ENV:', process.env.NODE_ENV);
    
    response.cookies.set('user_id', user.id.toString(), {
      httpOnly: true,
      secure: process.env.NODE_ENV === 'production',
      sameSite: 'lax',
      path: '/',
      maxAge: 60 * 60 * 24 * 7 // 7 días
    });

    return response;

  } catch (error) {
    console.error('Error en el login:', error);
    return NextResponse.json({ success: false, error: 'Error interno del servidor' }, { status: 500 });
  }
}
