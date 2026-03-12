import { NextRequest, NextResponse } from 'next/server'
import { getDb } from '@/db'
import { users } from '@/db/schema'
import { eq } from 'drizzle-orm'

export async function GET(request: NextRequest) {
  try {
    // Obtener user_id de las cookies
    const userId = request.cookies.get('user_id')?.value
    
    console.log('DEBUG - API me - userId from cookie:', userId);
    console.log('DEBUG - API me - all cookies:', request.cookies.getAll());
    
    if (!userId) {
      console.log('DEBUG - API me - No userId found, returning 401');
      return NextResponse.json(
        { success: false, error: 'No autenticado' },
        { status: 401 }
      )
    }

    // Buscar usuario usando Drizzle ORM
    const db = getDb()
    const user = await db.query.users.findFirst({
      where: eq(users.id, parseInt(userId))
    })

    if (!user) {
      console.log('DEBUG - API me - User not found in database');
      return NextResponse.json(
        { success: false, error: 'Usuario no encontrado' },
        { status: 404 }
      )
    }

    console.log('DEBUG - API me - User found:', user.id);

    // Preparar respuesta sin contraseña
    const { passwordHash, ...userWithoutPassword } = user

    return NextResponse.json({
      success: true,
      user: userWithoutPassword
    }, { status: 200 })
  } catch (error) {
    console.error('Error en me API:', error)
    return NextResponse.json(
      { success: false, error: 'Error interno del servidor' },
      { status: 500 }
    )
  }
}
