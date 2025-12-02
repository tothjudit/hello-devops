# Hello DevOps

Egyszerű React + Vite alapú „Hello DevOps” alkalmazás, amelyen keresztül bemutatom az alap DevOps lépéseket:

- kódkészítés
- trunk-based verziókezelés (Git, main + feature branch)
- buildelés
- Docker alapú konténerizálás
- Dev Container fejlesztői környezet (VS Code)

---

## 1. Követelmények

- **Node.js** (a fejlesztés során: v24.11.1)
- **npm** (a fejlesztés során: 11.6.2)
- **Git**
- **Docker Desktop** (Windows)
- **Visual Studio Code**
  - Dev Containers bővítmény
  - Docker bővítmény

---

## 2. Projekt indítása fejlesztői módban

A repó klónozása után a következő lépések szükségesek:

```bash
# 1. Lépj be a projekt mappába
cd hello-devops

# 2. Függőségek telepítése
npm install

# 3. Fejlesztői szerver indítása
npm run dev
