# 7O2 OXYGEN

**Full vibe coded 🔥**

Application **desktop Windows** pour vérifier si **vos** identifiants (e-mail, pseudo, téléphone, domaine, hash) apparaissent dans des fuites. Usage légitime uniquement : vos comptes, votre domaine. Ne l'utilisez pas pour chercher des tiers sans droit.

L'interface tourne sur votre PC. Seuls les appels que vous lancez sortent vers les APIs ou les sites.

## Installation (Windows)

1. Installez [Python 3.11 ou plus](https://www.python.org/downloads/). Cochez **Add python.exe to PATH**.
2. Décompressez ce dossier, par exemple `C:\7o2-oxygen`.
3. Double-cliquez sur `run.bat`.

Le script crée `.venv`, installe les dépendances, copie `.env.example` vers `.env` s'il n'existe pas, puis lance `python main.py`.

À la main :

```bat
cd C:\7o2-oxygen
py -3 -m venv .venv
.venv\Scripts\activate
pip install -r requirements.txt
copy .env.example .env
python main.py
```

Vérification sans ouvrir la fenêtre :

```bat
python main.py --self-check
```

### WebView2 (login see-know)

La connexion see-know ouvre un navigateur embarqué (`pywebview` + Edge WebView2, déjà présent sur Windows 10/11 à jour). Si la fenêtre reste blanche, installez [WebView2 Runtime](https://developer.microsoft.com/microsoft-edge/webview2/).

### Exécutable (optionnel)

```bat
build_exe.bat
```

Copiez votre `.env` à côté de `dist\7O2-OXYGEN\7O2-OXYGEN.exe`.

## Groupes de sources

Dans le panneau, de haut en bas :

1. **Free API** — gratuit, sans clé ou clé optionnelle (XposedOrNot, LeakCheck public, ProxyNova, Leak-Lookup).
2. **API payante** — freemium ou abonnement (HIBP, BreachDirectory, Hudson Rock, IntelX, HackCheck, LeakRadar, OSINTLeak, Enzoic, DeHashed, Snusbase).
3. **Config libre (moi)** — BrixHub. L'URL documentée est préremplie ; vous pouvez la remplacer.
4. **Scraper** — see-know.ru, Cybernews, Avast, Mozilla Monitor.

Badge à côté de chaque case : **Free API**, **Payante**, **Config** ou **Scrape**.

Les types de recherche (e-mail, pseudo, téléphone, domaine, hash) sont filtrés dynamiquement selon les sources cochées.

## Quotas et particularités

- XposedOrNot : gratuit pour e-mail, clé pour domaine. Rate limit par utilisateur et par IP (compteur local aligné).
- LeakCheck public : 1 requête / seconde, pas de mots de passe. Mention « Powered by LeakCheck » sur la carte.
- Leak-Lookup public : 10/jour.
- BreachDirectory Basic : compteur mensuel, défaut 10.
- ProxyNova COMB : API documentée sur leur page outil, 100 lignes max.
- Pwned Passwords (HIBP) : gratuit, **k-anonymat**. Cochez « K-anonymat » et choisissez le type Hash : seul un préfixe SHA-1 part, jamais le mot de passe entier. Enzoic reçoit au plus 10 caractères hex de SHA-256 dans le même mode.
- Cybernews, Avast Hack Check, Mozilla Monitor : pas d'API anonyme inventée. Si Cloudflare ou si la page ne rend pas de résultat (rapport Avast par e-mail, compte Mozilla obligatoire), une pop-up A→Z l'explique. Mozilla s'appuie sur HIBP : utilisez la source HIBP pour l'API.

## Interface

- Thèmes **Sombre**, **Claire** (fond blanc, accents rouges), **Violet**. Changer de thème reconstruit les panneaux pour ne pas laisser d'anciennes couleurs.
- Bulles d'oxygène en arrière-plan et sur la bande sous le titre. Cyan en sombre, rose/rouge en clair, lavande en violet.
- Sash entre Sources et Résultats (redimensionnable). La fenêtre et les pop-ups aussi. Listes défilantes.
- Cartes : source, date, champs, badge mot de passe **absent / masked / hash / plaintext**.
- Case « Afficher les mots de passe » : la valeur réellement renvoyée, en mémoire seulement. Décochée : masque. Rien n'est écrit en clair sur le disque.

## Essais manuels

1. Basculez Sombre → Claire → Violet une dizaine de fois : fond, cartes, boutons, cases et pop-up Paramètres suivent. Claire reste blanc et rouge, pas beige.
2. Tirez le sash Sources / Résultats et redimensionnez la fenêtre.
3. Cochez ProxyNova et Hudson Rock : le sélecteur de type ne garde qu'E-mail. Passez sur Téléphone : Hudson Rock se décoche (il ne le gère pas).
4. Cochez HIBP sans clé : pop-up A→Z, Annuler décoche, Enregistrer écrit `.env`.
5. Cochez BrixHub : l'aide cite `POST https://api.brixhub.ru/api/v1/search`. Confirmez, cherchez votre e-mail : cartes seulement si `results` n'est pas vide.
6. see-know : login Discord, fermez la fenêtre, la case reste cochée si `/api/auth/me` répond. Sinon message et case décochée.
7. Décochez Démo : aucune carte DÉMO. Cochez-la sans clé DeHashed : une carte étiquetée DÉMO.

## Légalité

Réservé à la défense de vos propres comptes ou de domaines que vous administrez. Vous êtes responsable du respect des conditions de chaque fournisseur et du droit applicable.
