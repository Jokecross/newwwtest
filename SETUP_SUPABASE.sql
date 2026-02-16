-- ============================================
-- CONFIGURATION SUPABASE - COPIER/COLLER DANS SQL EDITOR
-- ============================================
--
-- 📋 INSTRUCTIONS :
-- 1. Allez dans votre projet Supabase
-- 2. Cliquez sur "SQL Editor" dans le menu gauche
-- 3. Cliquez sur "+ New query"
-- 4. Copiez-collez TOUT ce fichier
-- 5. Cliquez sur "Run" (ou Ctrl/Cmd + Enter)
-- 6. ✅ Vous devriez voir "Success. No rows returned"
-- ============================================

-- 1️⃣ Créer la table profiles
CREATE TABLE IF NOT EXISTS profiles (
  id UUID REFERENCES auth.users ON DELETE CASCADE PRIMARY KEY,
  email TEXT UNIQUE NOT NULL,
  full_name TEXT,
  avatar_url TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::TEXT, NOW()) NOT NULL,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc'::TEXT, NOW()) NOT NULL
);

-- 2️⃣ Activer Row Level Security (sécurité)
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;

-- 3️⃣ Politique : Les utilisateurs voient leur propre profil
CREATE POLICY "Utilisateurs peuvent voir leur profil"
  ON profiles FOR SELECT
  USING (auth.uid() = id);

-- 4️⃣ Politique : Les utilisateurs peuvent modifier leur profil
CREATE POLICY "Utilisateurs peuvent modifier leur profil"
  ON profiles FOR UPDATE
  USING (auth.uid() = id);

-- 5️⃣ Fonction pour créer automatiquement un profil
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.profiles (id, email, full_name, avatar_url)
  VALUES (
    NEW.id,
    NEW.email,
    NEW.raw_user_meta_data->>'full_name',
    NEW.raw_user_meta_data->>'avatar_url'
  );
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- 6️⃣ Trigger : Créer le profil automatiquement à l'inscription
DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

-- ✅ C'EST TOUT ! Votre base de données est configurée.
