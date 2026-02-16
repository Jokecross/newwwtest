import { createClient } from '@/lib/supabase/server'
import { NextResponse } from 'next/server'

export async function POST(request: Request) {
  const { email, password, fullName } = await request.json()

  const supabase = await createClient()

  const { data, error } = await supabase.auth.signUp({
    email,
    password,
    options: {
      data: {
        full_name: fullName,
      },
    },
  })

  if (error) {
    return NextResponse.json({ error: error.message }, { status: 400 })
  }

  // Vérifier si l'email doit être confirmé
  if (data?.user && !data.session) {
    return NextResponse.json({ 
      error: 'Vérifiez votre email pour confirmer votre compte.' 
    }, { status: 400 })
  }

  return NextResponse.json({ success: true, user: data.user })
}
