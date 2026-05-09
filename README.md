# Nexconform CMP — Google Tag Manager Template

Template officiel GTM pour charger la bannière de consentement [Nexconform](https://nexconform.ca) sur votre site web.

---

## Installation via la galerie GTM

> Une fois le template approuvé par Google :

1. Dans GTM → **Tags → Nouveau**
2. Cliquez sur **Galerie de modèles de la communauté**
3. Recherchez **"Nexconform"**
4. Cliquez sur **Ajouter au workspace**
5. Entrez votre **Org ID** (disponible dans votre dashboard Nexconform)
6. Trigger : **Consent Initialization - All Pages**
7. **Enregistrer** et **Publier**

---

## Installation manuelle (en attendant l'approbation galerie)

1. Dans GTM → **Templates → Nouveau**
2. Cliquez sur l'icône menu (⋮) → **Importer**
3. Uploadez le fichier `template.tpl`
4. **Enregistrer**
5. Créez un nouveau tag → choisissez **Nexconform CMP**
6. Entrez votre **Org ID**
7. Trigger : **Consent Initialization - All Pages**
8. **Publier**

---

## Ce que fait ce template

- Charge le script Nexconform depuis `cdn.nexconform.ca`
- Initialise le **Google Consent Mode v2** avec des valeurs `denied` par défaut
- Évite le double chargement du script
- Passe le consentement au `dataLayer` après le choix de l'utilisateur

---

## Prérequis

- Un compte Nexconform → [nexconform.ca](https://nexconform.ca)
- Votre **Org ID** depuis votre dashboard

---

## Support

- 📧 support@nexconform.ca  
- 🌐 [nexconform.ca](https://nexconform.ca)
