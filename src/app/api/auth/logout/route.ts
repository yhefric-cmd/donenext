import { NextResponse } from 'next/server'

export async function POST() {
  try {
    // Limpiar cookies de sesión
    const response = NextResponse.json(
      { success: true, message: 'Sesión cerrada exitosamente' },
      { status: 200 }
    )
    
    response.cookies.delete('user_id')
    response.cookies.delete('user_email')
    
    return response
  } catch (error) {
    console.error('Error en logout API:', error)
    return NextResponse.json(
      { success: false, error: 'Error interno del servidor' },
      { status: 500 }
    )
  }
}
