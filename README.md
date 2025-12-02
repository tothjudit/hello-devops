# Hello DevOps

## 1. Hello DevOps

Ez egy egyszerű React + Vite alapú „Hello DevOps” alkalmazás, amely HTTP-n elérhető, és egy rövid üzenetet jelenít meg:
- fejlesztői módban: http://localhost:5173
- Docker konténerből: http://localhost:8080

A projekt célja, hogy bemutassa az alap DevOps lépéseket:
- kódkészítés  
- buildelés  
- konténerizálás (Docker)  
- Dev Container használata (VS Code)

> **Megjegyzés:** minden parancs futtatható **Git Bash-ben** vagy a **VS Code integrált termináljában**. A lényeg, hogy a projekt gyökerében ("hello-devops" mappa) legyél.

---

## 2. Követelmények

A projekt tesztelése az alábbi verziókkal történt:

- **Node.js:** v24.11.1  
- **npm:** v11.6.2  

További szükséges eszközök:

- **Git**
- **Docker Desktop** (Windows)
- **Visual Studio Code**
  - Dev Containers bővítmény (Microsoft – kötelező a Dev Containerhez)
  - Docker bővítmény (Microsoft – opcionális, de segít a konténerek kezelésében)

---

## 3. Build parancsok

A parancsokat futtathatod:
- Git Bash-ben: jobb klikk a "hello-devops" mappán → **Git Bash Here**  
- vagy VS Code-ban: **Terminal → New Terminal**, ha a "hello-devops" mappa van megnyitva.

### 3.1. Forráskód letöltése

    git clone https://github.com/tothjudit/hello-devops.git
    cd hello-devops

### 3.2. Függőségek telepítése

    npm install

### 3.3. Production build készítése

    npm run build

### 3.4. Buildelt verzió ellenőrzése (opcionális)

    npm run preview

A konzol kiírja az elérési címet: http://localhost:4173, ahol a buildelt alkalmazás megtekinthető.

**Leállítás:**  
a terminálban nyomd meg: **Ctrl + C**

---

## 4. Image build parancsok (Docker image)

A projekt gyökerében található egy "Dockerfile", amely multi-stage buildet használ (Node build + Nginx runtime).

A következő parancsot a projekt gyökerében ("hello-devops" mappában) kell futtatni, **bármely terminálban** (Git Bash, VS Code terminal):

    docker build -t hello-devops:v1 .

Ez létrehoz egy "hello-devops:v1" nevű Docker image-et.

---

## 5. Futtatási parancsok

### 5.1. Fejlesztői futtatás (Docker nélkül)

A projekt mappájában (hello-devops):

    npm run dev

A konzol kiírja a lokális címet: http://localhost:5173/ 

Ezt megnyitva a böngészőben elérhető a „Hello DevOps” oldal.

**Leállítás:**  
a terminálban nyomd meg: **Ctrl + C**

---

### 5.2. Futtatás Docker konténerből

Az előzőekben elkészített "hello-devops:v1" image-ből konténer indítása
(Git Bash-ben vagy VS Code terminalban):

    docker run --rm -p 8080:80 hello-devops:v1

Az alkalmazás ezután böngészőből elérhető: http://localhost:8080 

**Leállítás:**

- a futó terminálban nyomd meg: **Ctrl + C**  
  (a "--rm" miatt a konténer leállítás után automatikusan törlődik)

---

## 6. Projekt indítása Dev Containerben

A projekt tartalmaz egy ".devcontainer" mappát, amely leírja a Dev Container környezetet (Node 20-alpine alapú fejlesztői konténer).

### 6.1. Előfeltételek

- Docker Desktop fusson a gépen
- Visual Studio Code telepítve legyen
- VS Code-ban a **Dev Containers** bővítmény legyen telepítve  
  (a Docker bővítmény opcionális, de ajánlott)

### 6.2. Indítás Dev Containerben (VS Code)

1. Nyisd meg a projekt mappáját VS Code-ban  
   (pl. Windows alatt: "C:\dev\hello-devops").
2. Nyomd meg: **Ctrl + Shift + P**.
3. A Command Palette-ben válaszd ki:

   **„Dev Containers: Reopen in Container”**

4. Várd meg, amíg a Dev Container felépül, és a VS Code bal alsó sarkában megjelenik: "Dev Container: Hello DevOps Devcontainer"
Ez jelzi, hogy a projekt már a konténeres fejlesztői környezetben fut.

### 6.3. Alkalmazás futtatása Dev Containerben

1. Nyiss egy új terminált a VS Code-ban:

   - **Terminal → New Terminal**

2. A konténeres terminálban lépj be a projekt mappájába:

       cd /workspaces/hello-devops

3. Telepítsd a függőségeket (első indításkor):

       npm install

4. Indítsd el a fejlesztői szervert:

       npm run dev

Az alkalmazás ezután böngészőből elérhető: http://localhost:5173

**Leállítás:**  
a konténeres terminálban nyomd meg: **Ctrl + C**