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


# Tutorial 5

## Implementasi Fitur

### 1. Player Baru dengan Animasi
Pada tutorial ini, saya membuat player baru dengan animasi jalan, idle, dan attack. Animasi ini didapat dari [Craftpix](https://craftpix.net/freebies/free-schoolgirls-anime-character-pixel-sprite-pack/). Implementasi animasi dilakukan menggunakan `AnimatedSprite2D`.

### 2. Menambahkan SFX
Saya menambahkan efek suara (SFX) berikut:
- **Screaming girl** dari [Pixabay](https://pixabay.com/sound-effects/girl-scream-45657/)
- **Breaking vase** dari [Pixabay](https://pixabay.com/sound-effects/breaking-a-vase-remix-87091/)

### 3. Menambahkan BGM
Saya menambahkan dua background music (BGM) dari [Tallbeard](https://tallbeard.itch.io/music-loop-bundle).

### 4. Interaksi Objek
Player dapat melakukan serangan dengan melempar (spawn) objek buku. Jika buku mengenai objek vase, vase akan pecah. Implementasi ini dilakukan dengan `instantiate` dan deteksi tabrakan (collision detection).

### 5. Interaksi Audio
Saat player melakukan serangan, akan muncul SFX girl screaming. Saat vase pecah, akan muncul SFX vase breaking. Implementasi ini dilakukan dengan menambahkan node `AudioStreamPlayer2D` pada player dan vase, kemudian memutarnya sesuai kebutuhan.

### 6. Implementasi Tambahan
Saya mengimplementasikan BGM yang relatif terhadap jarak player. Jika player lebih dekat ke kiri, maka akan memutar BGM1. Jika lebih dekat ke kanan, akan memutar BGM2. Implementasi ini dilakukan dengan mengatur `Max Distance` dan `Attenuation` dari objek `AudioStreamPlayer2D`.

## Referensi
- 🔗 [Craftpix - Free Schoolgirls Anime Character Pixel Sprite Pack](https://craftpix.net/freebies/free-schoolgirls-anime-character-pixel-sprite-pack/)
- 🔗 [Pixabay - Girl Scream SFX](https://pixabay.com/sound-effects/girl-scream-45657/)
- 🔗 [Pixabay - Breaking Vase SFX](https://pixabay.com/sound-effects/breaking-a-vase-remix-87091/)
- 🔗 [Tallbeard - Music Loop Bundle](https://tallbeard.itch.io/music-loop-bundle)