# Laporan Pengerjaan Tutorial 3 Game Development

## Implementasi Fitur

### 1. Double Jump
Saya mengimplementasikan fitur **double jump** dengan menambahkan boolean `_can_double_jump`. Nilainya akan **true** jika player dapat melakukan double jump dan akan **direset saat player menyentuh ground**.

### 2. Perubahan Arah Sprite Player
Saya membuat **sprite player dapat berubah arah** ketika bergerak ke kanan atau ke kiri. Untuk itu, saya menambahkan boolean `_is_facing_right` dan menggunakan `scale.x *= -1` agar sprite ter-flip saat berbalik arah.

### 3. Animasi Player
Saya mengimplementasikan **animasi untuk bergerak, idle, dan lompat**. Untuk mempelajari animasi di Godot, saya menggunakan video berikut sebagai referensi:  
🔗 [Godot Animation Tutorial](https://www.youtube.com/watch?v=Vwj_hX9h4zo)

### 4. Crouch
Sebelumnya, saya telah membuat **dua collision shape** untuk player:
- **Batas bawah** menggunakan **circle**.
- **Batas atas** menggunakan **rectangle**.

Fitur crouch ini diimplementasikan dengan **men-disable collision shape untuk batas atas** saat crouch dilakukan.

### 5. Dash
Fitur **dash** diimplementasikan dengan mekanisme berikut:
- **Saat dash dilakukan**, player hanya dapat bergerak ke arah tujuan selama **0.3 detik**.
- `velocity.y` dibuat **0** agar player tidak bisa bergerak ke atas atau bawah saat dash berlangsung.
- **Cooldown selama 1 detik**, sehingga player harus menunggu sebelum bisa melakukan dash berikutnya.

## Kontrol
- **Arrow key kiri & kanan** → Bergerak
- **Arrow key atas** → Lompat & Double Jump
- **Arrow key bawah** → Crouch
- **Shift key** → Dash

## Referensi
- 🔗 [Godot Animation Tutorial](https://www.youtube.com/watch?v=Vwj_hX9h4zo)

