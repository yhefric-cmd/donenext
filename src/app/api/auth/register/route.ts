
import { NextRequest, NextResponse } from 'next/server';
import { getDb } from '@/db';
import { users } from '@/db/schema';
import { eq } from 'drizzle-orm';
import bcrypt from 'bcryptjs';

export async function POST(request: NextRequest) {
  try {
    const db = getDb();
    const body = await request.json();
    const { nombre, email, telefono, departamento, ciudad, password } = body;

    // 1. Validar datos de entrada
    if (!nombre || !email || !password || !telefono || !departamento || !ciudad) {
      return NextResponse.json({ success: false, error: 'Todos los campos son requeridos' }, { status: 400 });
    }

    // 2. Verificar si el usuario ya existe (por email o teléfono)
    const existingUser = await db.query.users.findFirst({
      where: (user, { or }) => or(eq(user.email, email), eq(user.phone, telefono)),
    });

    if (existingUser) {
      return NextResponse.json({ success: false, error: 'El correo electrónico o teléfono ya está registrado.' }, { status: 409 });
    }

    // 3. Hashear la contraseña
    const salt = await bcrypt.genSalt(10);
    const passwordHash = await bcrypt.hash(password, salt);

    // 4. Insertar el nuevo usuario en la base de datos
    const [newUser] = await db.insert(users).values({
      fullName: nombre,
      email: email,
      phone: telefono,
      passwordHash: passwordHash,
      departmentId: parseInt(departamento, 10),
      municipalityId: parseInt(ciudad, 10),
    }).returning();

    // 5. Preparar y devolver la respuesta (sin la contraseña)
    const { passwordHash: _, ...userWithoutPassword } = newUser;

    return NextResponse.json({ success: true, user: userWithoutPassword }, { status: 201 });

  } catch (error) {
    console.error('Error en el registro:', error);
    return NextResponse.json({ success: false, error: 'Error interno del servidor' }, { status: 500 });
  }
}
