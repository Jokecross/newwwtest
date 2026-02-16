# 🐛 DEBUG : "Failed to fetch"

## 🚨 Erreur : "Failed to fetch" lors de l'inscription/connexion

Cette erreur signifie que le navigateur **ne peut pas contacter Supabase**.

---

## ✅ CHECKLIST DE VÉRIFICATION

### 1️⃣ Vérifier que le fichier `.env` existe et contient les bonnes clés

#### Dans Bolt.new :

1. Regardez dans l'arborescence de fichiers à gauche
2. Vérifiez que le fichier `.env` existe (à la racine du projet)
3. Ouvrez-le et vérifiez qu'il contient :

```env
NEXT_PUBLIC_SUPABASE_URL=https://xxxxx.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.xxx...
```

#### ⚠️ ERREURS FRÉQUENTES :

❌ **Les clés sont encore les placeholders** :
```env
NEXT_PUBLIC_SUPABASE_URL=https://votre-projet.supabase.co  ❌ PAS BON
```

✅ **Les clés doivent être vos VRAIES clés Supabase** :
```env
NEXT_PUBLIC_SUPABASE_URL=https://abcdefghijk.supabase.co  ✅ BON
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFiY2RlZmdoaWprIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAwMDAwMDAsImV4cCI6MjAxNTU3NjAwMH0.xxx  ✅ BON
```

---

### 2️⃣ Récupérer vos clés Supabase

1. Allez sur [supabase.com](https://supabase.com)
2. Ouvrez votre projet
3. Cliquez sur l'icône **Settings** (engrenage) dans le menu gauche
4. Cliquez sur **API**
5. Copiez :
   - **Project URL** → C'est votre `NEXT_PUBLIC_SUPABASE_URL`
   - **anon public** (sous "Project API keys") → C'est votre `NEXT_PUBLIC_SUPABASE_ANON_KEY`

**📋 ATTENTION** : 
- La clé `anon public` est TRÈS LONGUE (environ 200 caractères)
- Ne prenez PAS la clé `service_role` (elle est secrète)
- Copiez toute la clé sans espace avant/après

---

### 3️⃣ Mettre à jour le fichier `.env` dans Bolt.new

1. Ouvrez le fichier `.env` dans Bolt.new
2. Remplacez les valeurs par vos vraies clés
3. **IMPORTANT** : Cliquez sur **"Redémarrer le serveur"** ou rafraîchissez la page

---

### 4️⃣ Vérifier dans la console du navigateur

1. Ouvrez la page d'inscription/connexion
2. Ouvrez la console du navigateur (F12 ou clic droit > Inspecter > Console)
3. Essayez de vous inscrire
4. **REGARDEZ LES LOGS** dans la console :

#### ✅ Si vous voyez ça (BON SIGNE) :
```
🔐 Démarrage auth... {
  mode: 'signup',
  email: 'test@test.com',
  supabaseUrl: 'https://abcdefghijk...',
  supabaseKey: 'eyJhbGciOi...'
}
```

Les clés sont chargées ✅

#### ❌ Si vous voyez ça (PROBLÈME) :
```
🔐 Démarrage auth... {
  mode: 'signup',
  email: 'test@test.com',
  supabaseUrl: '❌ MANQUANT',
  supabaseKey: '❌ MANQUANT'
}
```

Les variables d'environnement ne sont PAS chargées ❌

**SOLUTION** :
1. Vérifiez que le fichier `.env` existe bien à la racine
2. Redémarrez le serveur dans Bolt.new
3. Rafraîchissez la page du navigateur

---

### 5️⃣ Vérifier que votre projet Supabase est actif

1. Allez sur [supabase.com](https://supabase.com)
2. Ouvrez votre projet
3. Vérifiez que le statut est **"Active"** (en vert)
4. Si le projet est en pause, cliquez sur **"Unpause project"**

---

## 🔍 AUTRES VÉRIFICATIONS

### Vérifier l'URL du projet

L'URL doit ressembler à :
```
https://abcdefghijklmnop.supabase.co
```

❌ **ERREURS FRÉQUENTES** :
- `https://votre-projet.supabase.co` (placeholder)
- `https://supabase.co` (URL incomplète)
- `abcdefghijk.supabase.co` (manque le `https://`)
- URL avec des espaces avant/après

---

### Vérifier la clé anon

La clé `anon public` doit :
- Commencer par `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.`
- Faire environ 200+ caractères
- Ne PAS contenir d'espaces

❌ **ERREURS FRÉQUENTES** :
- `votre_cle_anon_ici` (placeholder)
- Clé tronquée (copiée partiellement)
- Clé `service_role` à la place de `anon public`

---

## 🎯 TEST FINAL

### Dans la console du navigateur, tapez :

```javascript
console.log({
  url: process.env.NEXT_PUBLIC_SUPABASE_URL,
  key: process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY?.substring(0, 20)
})
```

#### Résultat attendu :
```
{
  url: "https://abcdefghijk.supabase.co",
  key: "eyJhbGciOiJIUzI1NiIsI"
}
```

#### Si vous voyez `undefined` :
Les variables d'environnement ne sont PAS chargées.

**SOLUTION** :
1. Vérifiez que `.env` est à la racine (pas dans un sous-dossier)
2. Redémarrez complètement Bolt.new
3. Essayez de créer un fichier `.env.local` avec les mêmes valeurs

---

## 💡 DERNIER RECOURS

Si rien ne marche, **copiez-collez votre fichier `.env` ici et je vérifierai** (remplacez juste les 10 derniers caractères de chaque clé par `...` pour la sécurité).

Exemple :
```env
NEXT_PUBLIC_SUPABASE_URL=https://abcdefghijk.supabase...
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFiY2RlZmdoaWprIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAwMDAwMDAsImV4cCI6MjAxNTU3NjAwMH0...
```

Et je pourrai voir si le format est bon ! 🔍
