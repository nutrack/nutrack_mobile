# Proyek Akhir Semester - PBP Gasal 2022/2023

[![Build status](https://build.appcenter.ms/v0.1/apps/9f63f4a5-1178-41c0-bf8f-61dc714d630c/branches/main/badge)](https://appcenter.ms)
[![Staging](https://github.com/nutrack/nutrack_mobile/actions/workflows/staging.yml/badge.svg)](https://github.com/nutrack/nutrack_mobile/actions/workflows/staging.yml)
[![Pre-Release](https://github.com/nutrack/nutrack_mobile/actions/workflows/pre-release.yml/badge.svg)](https://github.com/nutrack/nutrack_mobile/actions/workflows/pre-release.yml)
[![Release](https://github.com/nutrack/nutrack_mobile/actions/workflows/release.yml/badge.svg)](https://github.com/nutrack/nutrack_mobile/actions/workflows/release.yml)

### 👋 Kelompok F10 - Nutrack 👋
1.  Farkhan Syawal Harahap (2106709125)
2.  Muhammad Akmal Hakim (2106750383)
3.  Reiou Nagata (2106636943)
4.  Sasha Nabila Fortuna (2106632226)
5.  Shayna Putri Fitria (2106703084)

## 🔗 Link APK 🔗
Silakan unduh file APK di bagian [releases](https://github.com/nutrack/nutrack_mobile/releases)

## 🔙 Latar Belakang 🔙
Sejak pandemi COVID-19, banyak orang yang melakukan aktivitas kebanyakan di rumah. Sehingga, ketika berurusan dengan konsumsi sehari-hari, orang-orang akan lebih berkutat di dapur. Dengan begitu, setiap orang memiliki kesempatan untuk meningkatkan mutu gizi karena aktivitasnya lebih banyak dilakukan di dapur ketimbang pergi ke restoran. Hal ini telah menjadi suatu kebiasaan bagi masyarakat untuk menerapkan pola makan yang lebih sehat. Pola makan yang sehat juga dinilai penting demi tetap menjaga imunitas tubuh. Dengan begitu, pembuatan aplikasi untuk tracking gizi yang sudah dikonsumsi pada hari itu cukup penting bagi masyarakat kita saat ini. 

Tidak jarang kita mengalami rasa bosan dalam menikmati suatu hidangan. Terkadang ada orang yang senang makanan yang bervariasi sehingga mereka bisa berganti-ganti hidangan setiap harinya. Selera makan juga tidak dipengaruhi oleh faktor biologis saja, melainkan juga suasana lingkungan dan suasana hati. Oleh karena itu, melalui aplikasi ini diharapkan masyarakat bisa menemukan ide-ide menu sehat yang dapat digunakan untuk memenuhi kebutuhan gizi harian dan sebagai salah satu varian agar tidak suntuk dengan makanan yang sudah-sudah.

Mengingat rangkaian acara KTT G20 yang panjang dan padat, setiap partisipan perlu menjaga kondisi tubuh mereka untuk bisa mengikuti setiap rangkaian acaranya. KTT G20 mengundang beberapa negara lain yang mungkin masih kurang familiar dengan gaya jenis makanan yang bahan pangannya tersedia di Indonesia. Dengan adanya aplikasi ini, diharapkan dapat membantu partisipan dalam menjaga kesehatan tubuh mereka, serta membantu partisipan dalam menentukan menu yang dapat memenuhi gizi mereka yang tersedia di Indonesia.

Proyek Akhir Semester ini merupakan kelanjutan dari Proyek Tengah Semester, yaitu membuat aplikasi web. Dan untuk proyek kali ini, kami membuat aplikasi mobile melalui flutter.

## 🖱️ Implementasi Listener & Event Handler 🖱️
**1. Authentication and Landing Page Module - Sasha Nabila Fortuna**

a. onTap() :
- Pada bagian Drawer, terdapat anak panah kecil yang jika ditap, maka drawer bisa diperbesar dan/atau diperkecil
- Di bagian landing page untuk pengguna yang sudah login, terdapat empat fitur utama dari Nutrack dan jika setiap box ditekan, maka akan ter-redirect ke halaman yang dituju (belum diimplementasi, tapi bisa menggunakan rawer untuk navigasi ke beda halaman)
- Pada landing page bag pengguna yang belum terautentikasi, jika pergeseran slide sudah berada di slide terakhir (article), maka akan muncul tombol login. Dan jika textbutton login ditekan, maka pengguna akan langsung diarahkan untuk login. Dan ada textbutton skip, jika tombol ini ditekan, maka pengguna bisa loncat dari halaman berapa saja ke halaman terakhir (article)
- Textbutton "Help" di landing page bagi pengguna yang belum login, jika "help" ditekan, maka pengguna akan diarahkan ke halaman FAQ.

b. onPressed :
- Pada landing page bagi pengguna yang sudah terautentikasi, di bagian AppBar terdapat tombol logout yang jika ditekan, maka user akan logout dan redirect ke landing page bagi pengguna yang belum terautentikasi
- Pada tombol "Add Calory" di bagian landing page untuk pengguna yang sudah login, jika tombol ditekan, maka pengguna akan diarahkan ke halaman "Add Calory"
- Pada tombol "See Your Calories' History" di bagian landing page untuk pengguna yang sudah login, jika tombol ditekan, maka pengguna akan diarahkan ke halaman histori kalori pengguna
- Pada tombol "Add" di bagian landing page untuk pengguna yang sudah login, jika tombol ditekan, maka target kalori harian pengguna yang ingin ditambahkan langsung tampil di landing page tersebut

c. onChanged :
- Inputan target kalori harian akan dilihat apa ada isinya atau tidak dan jika ada isinya, maka ada perubahan angka target yang ada pada landing page

d. onSaved :
- Inputan target kalori harian akan dilihat apa ada isinya atau tidak dan jika ada isinya, maka ada perubahan angka target yang ada pada landing page dan menyimpannya

e. onPageChanged :
- Event handler ini adalah bawaan dari package `smooth_page_indicator` dan event ini bertujuan untuk handling pergeseran halaman

**2. CaloryCalc Module - Reiou Nagata**

- CaloryCalc Page: ElevatedButton dengan onpressed biar menambahkan calory, dan TextButton dengan onpressed untuk pergi ke halaman HistoryPage

**3. Food Recommendation Module - M. Akmal Hakim**

- Food Recs List Page: FilterChip beserta onSelected untuk re-fetch data sesuai filter yang dipilih, ElevatedButton beserta onPressed untuk pindah ke page detail makanan, serta FloatingActionButton dan onPressed untuk menambahkan rekomendasi baru (untuk Authenticated User)
- Food Detail Page: ElevatedButton dengan onPressed untuk kembali ke laman Food Recs List
- Add New Recommendation Page: ElevatedButton dengan onPressed untuk menambah rekomendasi baru, IconButton dengan onPressed untuk kembali ke halaman Food Recs List

**4. Article Module - Shayna Putri Fitria**

- Article Grid Page; ListTile dengan onpressed untuk menampilkan detail article yang telah ditulis sebelumnya, serta Floating Button dengan onpressed untuk membuat artikel baru (hanya untuk user logged in)
- Article Detail Page; Button dengan onpressed untuk menambahkan comment (hanya untuk user logged in)
- Write Article Page; Button dengan onpressed untuk submit article
- Write Comment Page; Button dengan onpressed untuk submit comment

**5. About Us and Testimony Module - Farkhan Syawal Harahap**

- Create Testimonies Page (unimplemented)
- TextButton yang jika ditekan akan membuat testimoni baru (menggunakan onPressed)

## 🌍 Alur Pengintegrasian dengan Web Services 🌍
Langkah-langkah yang akan dilakukan untuk mengintegrasikan aplikasi dengan server web.

1. Implementasikan sebuah wrapper class dengan menggunakan library http dan map untuk mendukung penggunaan cookie-based authentication pada aplikasi.
2. Implementasikan REST API pada Django (views.py) yang sudah dibuat sebelumnya dengan menggunakan JsonResponse atau Django JSON Serializer.
3. Pengintegrasian dilakukan dengan mengimplementasikan desain front-end untuk aplikasi berdasarkan desain web.
4. Lakukan integrasi antara front-end dengan back-end dengan menggunakan konsep asynchronous HTTP.

## 🖥️ Modul Aplikasi 🖥️
1. Autentikasi pengguna (apakah pengguna yang login merupakan admin atau user)
    - Dikerjakan oleh: Sasha Nabila Fortuna
2. Menghitung kalori yang sudah didapat (dan update total kalori harian)
    - Dikerjakan oleh: Reiou Nagata
3. Rekomendasi makanan dan minuman (membuat filtering system serta mengurutkan daftar makanan/minuman berdasarkan rating dan jumlah rating)
    - Dikerjakan oleh: Muhammad Akmal Hakim
4. Membuat artikel tentang pola makan sehat dan dan semua pengguna bisa melihat artikel tersebut
    - Dikerjakan oleh: Shayna Putri Fitria
5. Membuat dashboard (sekaligus sebagai landing page) dari jumlah kalori yang sudah dikonsumsi dengan menghitung total kalori harian dan membandingkannya dengan target kalori harian yang sudah ditentukan.
    - Dikerjakan oleh: Sasha Nabila Fortuna
6. Tentang Kami dan Testimoni pengguna NUtrack
    - Dikerjakan oleh: Farkhan Syawal Harahap

## 🧑🏻 Persona 🧑🏻
**1. User yang tidak login**

- Melihat testimoni pengguna Nutrack
- Melakukan filtering untuk rekomendasi makanan atau minuman
- Membaca artikel tentang pola makan sehat
- Melihat page "About us" yang merupakan deskripsi singkat dari proyek kelompok ini

**2. User yang sudah login**

- Mengakses semua modul dari user yang tidak login
- Menampilkan dashboard dari jumla kalori yang sudah dikonsumsi
- Menghitung kalori yang sudah didapat
- Membuat artikel tentang pola makan sehat
- Memberikan rekomendasi dengan me-rating makanan atau minuman yang sudah pernah dikonsumsi
- Membuat testimoni pengguna Nutrack 



## 💡 Referensi
1. [Pola Konsumsi Bisnis Setelah Pandemi Covid-19](https://www.ukmindonesia.id/baca-deskripsi-posts/pola-konsumsi-bisnis-setelah-pandemi-covid19)
2. [Changes in Eating Habits and Physical Activity after COVID-19 Pandemic Lockdowns in Italy](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC8708956/)
3. [Mengapa Kita Bisa Bosan Dengan Makanan Sehingga Malas Makan](https://id.quora.com/Mengapa-kita-bisa-bosan-dengan-makanan-sehingga-malas-makan)
