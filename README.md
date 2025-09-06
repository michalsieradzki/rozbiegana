# 🏃‍♂️ **ROZBIEGANA** - Aplikacja Stowarzyszenia Biegowego

Aplikacja webowa do organizacji konkursów biegowych i śledzenia aktywności członków stowarzyszenia.

## 📱 **Obecne funkcjonalności:**
- ✅ System użytkowników z autoryzacją (Devise)
- ✅ Śledzenie aktywności biegowych (dystans, czas, zdjęcia, opis)
- ✅ System zespołów z punktacją (Zieloni, Pomarańczowi, Niebiescy)
- ✅ Rankingi miesięczne użytkowników i drużyn
- ✅ Funkcje społecznościowe (komentarze, polubienia, powiadomienia)
- ✅ Live chat globalny (Turbo Streams)
- ✅ Panel administracyjny (ActiveAdmin)
- ✅ PWA (Progressive Web App)

---

## 🔧 **DO NAPRAWIENIA PILNIE**

### 🚨 **Krytyczne błędy:**
- [ ] **Bug w `activities_controller.rb`** (update method) - duplikacja calculate_score
- [ ] **Cleanup** - usunąć zakomentowany kod z modeli

### 🔄 **Optymalizacje:**
- [ ] **Infinite scroll** na stronie głównej (zamiast limit 20)
- [ ] **Optymalizacja queries** - rozwiązać N+1 problemy w rankingach
- [ ] **Responsive design** - lepsze działanie na telefonach

---

## 🚀 **PLAN ROZWOJU APLIKACJI**

### **FAZA 1: Stabilizacja i podstawowe ulepszenia** ⏱️ *1-2 tygodnie*

#### 🛠️ **Backend:**
- [ ] Naprawa błędów (patrz sekcja wyżej)
- [ ] Dodanie gem `kaminari` dla paginacji
- [ ] Optymalizacja zapytań SQL (includes, joins)
- [ ] Callbacks w modelach (auto-calculate score)

#### 🎨 **Frontend:**
- [ ] Infinite scroll (Stimulus controller)
- [ ] Loading states i spinnery
- [ ] Lepsze powiadomienia toast (zamiast alert boxes)
- [ ] Poprawki responsive design

---

### **FAZA 2: System konkursów i administracja** ⏱️ *2-3 tygodnie*

#### 🏆 **System konkursów:**
- [ ] **Model Competition** z datami start/koniec
- [ ] **Panel admina** - tworzenie/edycja konkursów
- [ ] **Różne typy konkursów**:
  - Konkurs dystansowy (kto więcej przebiegnie)
  - Konkurs czasowy (najlepsze tempo)
  - Konkurs regularności (ile dni z rzędu)
- [ ] **Automatyczne przełączanie** aktywnego konkursu
- [ ] **Archiwum konkursów** z wynikami

#### 👑 **Rozszerzony panel administracyjny:**
- [ ] **Zarządzanie drużynami** - tworzenie/usuwanie/edycja
- [ ] **Zarządzanie użytkownikami** - przypisywanie do drużyn, blokowanie
- [ ] **Moderacja treści** - ukrywanie/usuwanie aktywności i komentarzy
- [ ] **Statystyki dla adminów** - dashboardy z wykresami
- [ ] **Export danych** - CSV z wynikami konkursów

---

### **FAZA 3: System wyzwań i odznak** ⏱️ *2-3 tygodnie*

#### 🎯 **Wyzwania indywidualne:**
- [ ] **Model Challenge** - różne typy wyzwań
- [ ] **Wyzwania dystansowe**: "Zbiegnij 100km w tym miesiącu"
- [ ] **Wyzwania czasowe**: "Popraw swój rekord na 5km"
- [ ] **Wyzwania regularności**: "Biegnij 7 dni z rzędu"
- [ ] **Progress tracking** - paski postępu dla wyzwań
- [ ] **Automatyczne sprawdzanie** i przyznawanie wyzwań

#### 🏅 **System odznak/achievementów:**
- [ ] **Model Badge** z różnymi kategoriami
- [ ] **Odznaki dystansowe**: 50km, 100km, 500km, 1000km
- [ ] **Odznaki tempo**: Sub 5:00/km, Sub 4:30/km, Sub 4:00/km
- [ ] **Odznaki społecznościowe**: 10 komentarzy, 50 polubień
- [ ] **Odznaki regularności**: 30 dni aktywności, 100 dni
- [ ] **Profil użytkownika** z kolekcją odznak

---

### **FAZA 4: Rozszerzenia społecznościowe** ⏱️ *2-3 tygodnie*

#### 👥 **Funkcje społecznościowe:**
- [ ] **System znajomych** - dodawanie/usuwanie znajomych
- [ ] **Prywatne wiadomości** między użytkownikami
- [ ] **Kanały teamowe** - osobny chat dla każdej drużyny
- [ ] **Mentioning** w komentarzach (@username)
- [ ] **Reakcje emoji** na aktywności (👍❤️🔥💪)
- [ ] **Galeria zdjęć** - lepsza prezentacja zdjęć z aktywności

#### 📅 **Wydarzenia:**
- [ ] **Model Event** - organizacja wydarzeń biegowych
- [ ] **Zapisy na wydarzenia** - lista uczestników
- [ ] **Wydarzenia stowarzyszenia** - parkrun, maraton, zawody
- [ ] **Kalendarz wydarzeń** - widok miesięczny/tygodniowy

---

### **FAZA 5: Statystyki i analizy** ⏱️ *1-2 tygodnie*

#### 📊 **Zaawansowane statystyki:**
- [ ] **Dashboard użytkownika** z wykresami (Chart.js)
- [ ] **Analiza postępów** - wykresy dystansu/tempa w czasie
- [ ] **Porównania miesięczne** - obecny vs poprzedni miesiąc
- [ ] **Heat map aktywności** - kalendarz z aktywnością
- [ ] **Statystyki drużynowe** - wykresy dla każdego teamu

#### 🎯 **Cele osobiste:**
- [ ] **Ustalanie celów** - miesięcznych i rocznych
- [ ] **Tracking postępów** - procent realizacji celu
- [ ] **Przypomnienia** - powiadomienia o celach
- [ ] **Historia celów** - archiwum z osiągnięciami

---

### **FAZA 6: PWA i funkcje mobilne** ⏱️ *1-2 tygodnie*

#### 📱 **Rozszerzenie PWA:**
- [ ] **Offline mode** - podstawowe funkcje bez internetu
- [ ] **Push notifications** - powiadomienia o nowych aktywnościach
- [ ] **Install prompt** - zachęta do "instalacji" aplikacji
- [ ] **Background sync** - synchronizacja po powrocie online
- [ ] **Camera integration** - lepsze robienie zdjęć z telefonu

#### 🗺️ **Funkcje lokalizacyjne:**
- [ ] **Geolokalizacja** - automatyczne tagowanie lokacji
- [ ] **Popularne trasy** - gdzie najczęściej biega stowarzyszenie
- [ ] **Mapa aktywności** - wizualizacja tras (jeśli dane GPS dostępne)

---

### **FAZA 7: Integracje i automatyzacja** ⏱️ *2-3 tygodnie*

#### 🔗 **Integracje zewnętrzne:**
- [ ] **Import ze Strava** - synchronizacja aktywności
- [ ] **Import z Garmin Connect** - synchronizacja danych
- [ ] **Integracja z pogodą** - warunki podczas biegu
- [ ] **Email notifications** - podsumowania tygodniowe/miesięczne

#### 🤖 **Automatyzacja:**
- [ ] **Background jobs** (Sidekiq) - przetwarzanie obrazów, emaile
- [ ] **Scheduled tasks** - automatyczne archiwizowanie konkursów
- [ ] **Auto-moderation** - flagowanie podejrzanych aktywności
- [ ] **Backup automation** - regularne kopie zapasowe

---

## 🛠️ **STACK TECHNOLOGICZNY**

### Backend:
- **Ruby on Rails** 7.1
- **PostgreSQL** - baza danych (`rozbiegana24_production`)
- **Redis** - cache i session store
- **Sidekiq** - background jobs (Faza 7)

### Frontend:
- **Stimulus** - interakcje JavaScript
- **Turbo** - SPA-like experience
- **Bootstrap 5** - CSS framework
- **Slim** - template engine
- **Chart.js** - wykresy i statystyki (Faza 5)

### Deployment:
- **Dedykowany serwer** - `srv29.mikr.us:20168`
- **Systemd service** - `rozbiegana`
- **PostgreSQL** - baza danych (`rozbiegana24_production`)
- **Nginx** - reverse proxy (port 80 → 3000)
- **Automatyczne skrypty deployment** (`deploy.sh`, `quick_restart.sh`)
- **Automatyczne backupy** - baza danych + pliki (retencja 7 dni)

---

## 📈 **PRIORYTETY ROZWOJU**

### 🔴 **WYSOKIE** (do zrobienia w pierwszej kolejności):
1. Naprawa błędów w kodzie
2. Infinite scroll
3. System konkursów
4. Rozszerzony panel admina

### 🟡 **ŚREDNIE** (ważne dla użytkowników):
1. System wyzwań i odznak
2. Lepsze statystyki
3. Funkcje społecznościowe

### 🟢 **NISKIE** (nice-to-have):
1. Integracje zewnętrzne
2. Zaawansowane PWA
3. Automatyzacja

---

## 🎯 **CELE BIZNESOWE**

### Krótkoterminowe (1-3 miesiące):
- Zwiększenie zaangażowania członków stowarzyszenia
- Automatyzacja organizacji konkursów
- Lepsze śledzenie postępów biegaczy

### Długoterminowe (3-12 miesięcy):
- Stanie się główną platformą komunikacji stowarzyszenia
- Archiwum historii wszystkich konkursów
- Wzrost motywacji do regularnego biegania wśród członków

---

## 🚀 **DEPLOYMENT I URUCHOMIENIE**

### 🌐 **Dostęp do aplikacji:**
**URL produkcyjny**: [http://srv29.mikr.us:20168](http://srv29.mikr.us:20168)

### 🔧 **Deployment na serwerze:**

#### **Pełny deployment (nowy kod, migracje, assets):**
```bash
sudo /var/www/rozbiegana/deploy.sh
```

#### **Szybki restart (tylko konfiguracja):**
```bash
sudo /var/www/rozbiegana/quick_restart.sh
```

### 📊 **Zarządzanie aplikacją:**

#### **Status aplikacji:**
```bash
sudo systemctl status rozbiegana
sudo systemctl restart rozbiegana
```

#### **Logi aplikacji:**
```bash
sudo journalctl -u rozbiegana -f --lines=50
```

#### **Backup bazy danych:**
```bash
# Automatyczne backupy w /var/backups/rozbiegana/
ls -la /var/backups/rozbiegana/
```

### 🛠️ **Rozwój lokalny:**

```bash
# Klonowanie repo
git clone [url]
cd rozbiegana

# Instalacja gemów
bundle install

# Setup bazy danych
rails db:create
rails db:migrate
rails db:seed

# Uruchomienie serwera
rails server
```

### Wymagania:
- Ruby 3.2+ (rbenv na serwerze: `/root/.rbenv/`)
- Rails 7.1+
- PostgreSQL 12+
- Node.js 18+ (dla importmap)

---

## 👨‍💻 **KONTAKT I WSPARCIE**

Aplikacja jest rozwijana dla potrzeb stowarzyszenia biegowego.
Wszelkie sugestie i zgłoszenia błędów mile widziane!

---

*Ostatnia aktualizacja planu: [data aktualna]*
