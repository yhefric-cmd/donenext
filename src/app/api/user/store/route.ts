import { NextRequest, NextResponse } from 'next/server'
import { getDb } from '@/db'
import { stores } from '@/db/schema'
import { eq } from 'drizzle-orm'

export async function GET(request: NextRequest) {
  try {
    const userId = request.cookies.get('user_id')?.value

    if (!userId) {
      return NextResponse.json(
        { success: false, error: 'No autenticado' },
        { status: 401 }
      )
    }

    const db = getDb()
    const userStore = await db.query.stores.findFirst({
      where: eq(stores.userId, parseInt(userId))
    })

    if (userStore) {
      return NextResponse.json({
        success: true,
        data: { id: userStore.id, slug: userStore.slug, name: userStore.name }
      }, { status: 200 })
    } else {
      return NextResponse.json({
        success: false,
        data: null,
        message: 'El usuario no tiene una tienda.'
      }, { status: 200 })
    }
  } catch (error) {
    console.error('Error en /api/user/store API:', error)
    return NextResponse.json(
      { success: false, error: 'Error interno del servidor' },
      { status: 500 }
    )
  }
}