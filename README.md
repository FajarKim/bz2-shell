![BZip2 Shell Exec Logo](https://raw.githubusercontent.com/FajarKim/bz2-shell/master/image/logo.jpg)
<div align="center">
    <a href="https://github.com/FajarKim/bz2-shell"><img src="https://img.shields.io/github/languages/code-size/FajarKim/bz2-shell?label=BZip2%20Shell%20Exec&style=plastic&logo=github&color=blue" alt="BZip2 Shell Exec"></a>
    <a href="https://github.com/FajarKim/bz2-shell/stargazers/"><img src="https://img.shields.io/github/stars/FajarKim/bz2-shell?label=Star&style=plastic&color=red" alt="Stars"></a>
    <a href="https://github.com/FajarKim/bz2-shell/network/members/"><img src="https://img.shields.io/github/forks/FajarKim/bz2-shell?label=Fork&style=plastic&color=f5ff5e" alt="Forks"></a>
    <a href="https://github.com/FajarKim/bz2-shell/issues?q=is%3Aopen+is%3Aissue/"><img src="https://img.shields.io/github/issues/FajarKim/bz2-shell?label=Issue&style=plastic&color=a1b3ff" alt="Issues"></a>
    <a href="https://github.com/FajarKim/bz2-shell/issues?q=is%3Aissue+is%3Aclosed/"><img src="https://img.shields.io/github/issues-closed/FajarKim/bz2-shell?label=Issue&style=plastic&color=ffffff" alt="Issues"></a>
    <a href="https://github.com/FajarKim/bz2-shell/watchers/"><img src="https://img.shields.io/github/watchers/FajarKim/bz2-shell?label=Watch&style=plastic&color=1fe1f" alt="Whatchers"></a>
    <a href="https://github.com/FajarKim/bz2-shell/pulls?q=is%3Aopen+is%3Apr/"><img src="https://img.shields.io/github/issues-pr/FajarKim/bz2-shell?&label=Pull%20requests&style=plastic&color=971dff" alt="Pull-requests"></a>
    <a href="https://github.com/FajarKim/bz2-shell/pulls?q=is%3Apr+is%3Aclosed/"><img src="https://img.shields.io/github/issues-pr-closed/FajarKim/bz2-shell?&label=Pull%20requests&style=plastic&color=orange" alt="Pull-requests"></a>
    <a href="https://github.com/FajarKim/bz2-shell/blob/master/LICENSE"><img src="https://img.shields.io/github/license/FajarKim/bz2-shell?label=License&style=plastic&color=01ffc4&logo=gnu" alt="License"></a>
</div>

# BZip2 Shell Exec
BZip2 Shell Exec adalah sebuah alat yang bisa digunakan untuk mengompresi string skrip beberapa jenis shell 🔐 seperti Bourne Shell (sh), Bourne Again Shell (bash), Z Shell (zsh), Korn Shell (ksh), dan MirBSD Korn Shell (mksh) ke dalam format BZip2.

<details>
<summary>Terjemahan</summary>

- [🇬🇧 English (UK)](https://github.com/FajarKim/bz2-shell/blob/master/README-EN.md)
- [🇫🇷 France](https://github.com/FajarKim/bz2-shell/blob/master/README-FR.md)
- [🇰🇷 Korean](https://github.com/FajarKim/bz2-shell/blob/master/README-KR.md)
</details>

# Petunjuk Penginstallan
## Termux
### Cara 1
- `$ pkg update -y && pkg upgrade -y`
- `$ pkg install bzip2 lzma git -y`
- `$ git clone https://github.com/FajarKim/bz2-shell`
- `$ cd bz2-shell/tools/Termux`
- `$ ./install.sh` atau `$ bash install.sh`
### Cara 2
<table>
    <tr>
        <td><div align="center"><b>Metode</b></div></td>
        <td><div align="center"><b>Perintah</b></div></td>
    </tr>
    <tr>
        <td><div align="center"><b>curl</b></div></td>
        <td><div align="left"><code>bash -c "$(curl -fsSL https://raw.githubusercontent.com/FajarKim/bz2-shell/master/tools/Termux/install.sh)"</code></div></td>
    </tr>
    <tr>
        <td><div align="center"><b>wget</b></div></td>
        <td><div align="left"><code>bash -c "$(wget -qO- https://raw.githubusercontent.com/FajarKim/bz2-shell/master/tools/Termux/install.sh)"</code></div></td>
    </tr>
    <tr>
        <td><div align="center"><b>fetch</b></div></td>
        <td><div align="left"><code>bash -c "$(fetch -o - https://raw.githubusercontent.com/FajarKim/bz2-shell/master/tools/Termux/install.sh)"</code></div></td>
    </tr>
<table>

Sebagai alternatif, Anda dapat mengunduh skrip `install.sh` terlebih dahulu dan menjalankannya setelah menginstalnya:
```text
$ wget https://raw.githubusercontent.com/FajarKim/bz2-shell/master/tools/Termux/install.sh
$ bash install.sh
```
## Linux
### Cara 1
- `$ apt update -y && apt upgrade -y`
- `$ apt install bzip2 lzma git -y`
- `$ git clone https://github.com/FajarKim/bz2-shell`
- `$ cd bz2-shell/tools/Linux`
- `$ ./install.sh` atau `$ bash install.sh`
### Cara 2
<table>
    <tr>
        <td><div align="center"><b>Metode</b></div></td>
        <td><div align="center"><b>Perintah</b></div></td>
    </tr>
    <tr>
        <td><div align="center"><b>curl</b></div></td>
        <td><div align="left"><code>bash -c "$(curl -fsSL https://raw.githubusercontent.com/FajarKim/bz2-shell/master/tools/Linux/install.sh)"</code></div></td>
    </tr>
    <tr>
        <td><div align="center"><b>wget</b></div></td>
        <td><div align="left"><code>bash -c "$(wget -qO- https://raw.githubusercontent.com/FajarKim/bz2-shell/master/tools/Linux/install.sh)"</code></div></td>
    </tr>
    <tr>
        <td><div align="center"><b>fetch</b></div></td>
        <td><div align="left"><code>bash -c "$(fetch -o - https://raw.githubusercontent.com/FajarKim/bz2-shell/master/tools/Linux/install.sh)"</code></div></td>
    </tr>
<table>

Sebagai alternatif, Anda dapat mengunduh skrip `install.sh` terlebih dahulu dan menjalankannya setelah menginstalnya:
```text
$ wget https://raw.githubusercontent.com/FajarKim/bz2-shell/master/tools/Linux/install.sh
$ bash install.sh
```

# Petunjuk Penggunaan
Perintah yang didukung:
<table>
    <tr>
        <td><div align="center"><b>Perintah</b></div></td>
        <td><div align="center"><b>Keterangan</b></div></td>
    </tr>
    <tr>
        <td><div align="left"><code>-h</code> atau <code>--help</code></div></td>
        <td><div align="left">Menampilkan bantuan untuk alat ini</div></td>
    </tr>
    <tr>
        <td><div align="left"><code>-v</code> atau <code>--version</code></div></td>
        <td><div align="left">Informasi versi keluaran terbaru</div></td>
    </tr>
    <tr>
        <td><div align="left"><code>-t</code> atau <code>--type-shell</code></div></td>
        <td><div align="left">Pilih jenis shell (sh, bash, zsh, ksh, atau mksh)</div></td>
    </tr>
    <tr>
        <td><div align="left"><code>-f</code> atau <code>--file</code></div></td>
        <td><div align="left">Kompres setiap FILE sebagai gantinya</div></td>
    </tr>
<table>

Cara menjalankan alat ini:
### Contoh 1
```text
$ bzsh.sh -t bash -f FILE
```
atau
```text
$ bzsh.sh --type-shell bash --file FILE
```
### Contoh 2
```text
$ bzsh.sh -t bash -f FILE1 FILE2 FILE3...
```
atau
```text
$ bzsh.sh --type-shell bash --file FILE1 FILE2 FILE3...
```

# Kontak
Silahkan hubungi kontak saya dibawah ini jika ada masalah atau pertanyaan mengenai alat ini. Jangan lupa untuk follow ya!
<div align="center">
    <a href="https://www.facebook.com/fajarrkim"><img src="https://raw.githubusercontent.com/FajarKim/FajarKim/master/images/facebook_logo.png" alt="Facebook" width="35"></a>
    &ensp;
    <a href="https://www.instagram.com/fajarkim_"><img src="https://raw.githubusercontent.com/FajarKim/FajarKim/master/images/instagram_logo.png" alt="Instagram" width="35"></a>
    &ensp;
    <a href="https://wa.me/6285659850910?text=Hi"><img src="https://raw.githubusercontent.com/FajarKim/FajarKim/master/images/whatsapp_logo.png" alt="WhatsApp" width="35"></a>
    &ensp;
    <a href="https://t.me/FajarThea"><img src="https://raw.githubusercontent.com/FajarKim/FajarKim/master/images/telegram_logo.png" alt="Telegram" width="35"></a>
    &ensp;
    <a href="https://www.twitter.com/fajarkim_"><img src="https://raw.githubusercontent.com/FajarKim/FajarKim/master/images/twitter_logo.png" alt="Twitter" width="35"></a>
    &ensp;
    <a href="mailto:fajarrkim@gmail.com"><img src="https://raw.githubusercontent.com/FajarKim/FajarKim/master/images/gmail_logo.png" alt="Gmail" width="35"></a>
</div>

# Donasi
Bagi orang baik yang mau berdonasi untuk perkembangan dan kemajuan akun ini, bisa klik tautan di bawah ini! Saya berterima kasih banyak kepada yang mau berdonasi 😊😊😊
<div align="left">
    <a href="https://github.com/sponsors/FajarKim/"><img src="https://raw.githubusercontent.com/FajarKim/FajarKim/master/images/donate_github.png" alt="GitHub Sponsor" width="165"></a>
    <a href="https://paypal.me/agusbirawan/"><img src="https://raw.githubusercontent.com/FajarKim/FajarKim/master/images/donate_paypal.png" alt="PayPal Donate" width="165"></a>
    <a href="https://trakteer.id/FajarKim/"><img src="https://raw.githubusercontent.com/FajarKim/FajarKim/master/images/donate_trakteer.png" alt="Trakteer.id Donate" width="165"></a>
</div>
