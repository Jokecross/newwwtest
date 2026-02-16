# 🚀 Guide Ultra-Simple - 5 Minutes Chrono

Ce guide est fait pour les **débutants**. Suivez chaque étape dans l'ordre.

## ✅ Prérequis

- Un navigateur web
- Un compte GitHub (gratuit)
- 5 minutes de votre temps

---

## 📋 Étape 1 : Créer votre compte Supabase (2 min)

### 1.1 Créer le compte

1. Allez sur **https://supabase.com**
2. Cliquez sur **"Start your project"**
3. Connectez-vous avec **GitHub** (plus simple)

### 1.2 Créer un projet

1. Cliquez sur **"New Project"**
2. Remplissez :
   - **Name** : `mon-saas` (ou ce que vous voulez)
   - **Database Password** : Choisissez un mot de passe FORT
   - **Region** : Europe West (si vous êtes en France)
3. Cliquez sur **"Create new project"**
4. ⏰ Attendez 1-2 minutes (prenez un café ☕)

---

## 🔧 Étape 2 : Configurer la base de données (1 min)

### 2.1 Ouvrir SQL Editor

1. Dans le menu de gauche, cliquez sur **SQL Editor** (icône </> )
2. Cliquez sur **"+ New query"**

### 2.2 Exécuter le script SQL

1. Ouvrez le fichier **`SETUP_SUPABASE.sql`** (dans ce projet)
2. **Copiez TOUT** le contenu (Ctrl+A puis Ctrl+C)
3. **Collez** dans Supabase SQL Editor (Ctrl+V)
4. Cliquez sur **"Run"** (ou appuyez sur Ctrl/Cmd + Enter)
5. ✅ Vous devez voir : **"Success. No rows returned"**

---

## 🔑 Étape 3 : Obtenir vos clés API (30 sec)

1. Dans Supabase, cliquez sur **Settings** (icône ⚙️ en bas à gauche)
2. Cliquez sur **API**
3. Vous allez voir :
   - **Project URL** (commence par https://)
   - **anon public** key (longue chaîne qui commence par eyJ...)

📋 **Copiez ces deux valeurs** - vous en aurez besoin dans 10 secondes !

---

## 💻 Étape 4 : Configurer le projet (1 min)

### 4.1 Créer le fichier .env.local

```bash
# Dans le terminal, à la racine du projet :
cp .env.example .env.local
```

### 4.2 Modifier .env.local

1. Ouvrez le fichier **`.env.local`**
2. Remplacez les valeurs :

```env
NEXT_PUBLIC_SUPABASE_URL=https://VOTRE-PROJET.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
NEXT_PUBLIC_SITE_URL=http://localhost:3000
```

⚠️ **Collez VOS vraies valeurs** (pas les exemples !)

### 4.3 Sauvegarder

Appuyez sur **Ctrl+S** (ou Cmd+S sur Mac) pour sauvegarder.

---

## 🚀 Étape 5 : Lancer l'application (30 sec)

### 5.1 Installer les dépendances

```bash
npm install
```

⏰ Attendez que ça s'installe (30 secondes - 1 minute)

### 5.2 Lancer le serveur

```bash
npm run dev
```

### 5.3 Ouvrir dans le navigateur

1. Allez sur **http://localhost:3000**
2. 🎉 **C'EST PRÊT !**

---

## ✨ Tester que ça marche

### Test 1 : Créer un compte

1. Cliquez sur **"Commencer"** (en haut à droite)
2. Remplissez le formulaire :
   - **Nom** : Votre nom
   - **Email** : Votre email
   - **Mot de passe** : Au moins 6 caractères
3. Cliquez sur **"Créer un compte"**
4. ✅ Vous devez être redirigé vers le **Dashboard**

### Test 2 : Se déconnecter et se reconnecter

1. Cliquez sur **"Déconnexion"** (dans la sidebar)
2. Allez sur la page **"Connexion"**
3. Connectez-vous avec votre email/mot de passe
4. ✅ Vous devez retourner au **Dashboard**

---

## 🆘 Ça ne marche pas ?

### Problème : "Invalid API key"

**Solution** :
- Vérifiez que vous avez bien copié la clé **anon public** (pas service_role)
- Vérifiez qu'il n'y a pas d'espaces avant/après dans `.env.local`
- Redémarrez le serveur (Ctrl+C puis `npm run dev`)

### Problème : "Email not confirmed"

**Solution** :
1. Allez dans Supabase > **Authentication** > **Providers**
2. Cliquez sur **Email**
3. **Décochez** "Confirm email"
4. Sauvegardez
5. Réessayez

### Problème : "Failed to fetch"

**Solution** :
- Vérifiez votre connexion internet
- Vérifiez que l'URL Supabase est correcte dans `.env.local`
- Vérifiez que votre projet Supabase est actif (vert dans le dashboard)

---

## 📚 Fichiers importants

| Fichier | Description |
|---------|-------------|
| `.env.example` | Template de configuration |
| `.env.local` | VOS clés (créé par vous, ne jamais commit!) |
| `SETUP_SUPABASE.sql` | Script SQL à exécuter dans Supabase |
| `GUIDE_SIMPLE.md` | Ce guide |
| `package.json` | Dépendances du projet |

---

## 🎯 Prochaines étapes

Maintenant que tout fonctionne :

1. 🎨 **Personnalisez** :
   - Changez les couleurs dans `tailwind.config.js`
   - Modifiez les textes de la landing page
   - Ajoutez votre logo

2. 🚀 **Déployez** :
   - Sur Vercel (gratuit)
   - Sur Netlify (gratuit)
   - Sur votre propre serveur

3. 📈 **Ajoutez des fonctionnalités** :
   - Paiements avec Stripe
   - Emails avec SendGrid
   - Plus de pages

---

**Bon développement ! 🎉**

Si vous êtes bloqué, consultez le fichier **TROUBLESHOOTING.md** pour plus d'aide.
