<div align="center">
  <img src="https://github.com/FajarKim/bz2-shell/assets/86386385/80ef91fe-8079-42f5-bc95-78eb60717792" alt="BZSH Logo" width="40%">
  <h3>BZip2 Shell Exec</h3>
  <p>🛠️ Enkripsi sederhana skrip Shell ke format BZip2</p>
  <p><a href="https://github.com/FajarKim/bz2-shell/issues/new?assignees=&labels=bug&projects=&template=bug_report.yml">Laporkan Bug</a> · <a href="https://github.com/FajarKim/bz2-shell/issues/new?assignees=&labels=enhancement&projects=&template=feature_request.yml">Ajukan Fitur</a> · <a href="https://github.com/FajarKim/bz2-shell/discussions/new?category=q-a">Tanya Jawab</a></p>
  <p><a href="/README.md">English</a> · <a href="/docs/README-KR.md">한국어</a></p>
</div>
<div align="center">

[![Version](https://img.shields.io/github/v/tag/FajarKim/bz2-shell?label=Version&labelColor=302d41&color=f2cdcd&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCA1MTIgNTEyIj48cGF0aCBmaWxsPSIjRDlFMEVFIiBkPSJNMzQ1IDM5LjFMNDcyLjggMTY4LjRjNTIuNCA1MyA1Mi40IDEzOC4yIDAgMTkxLjJMMzYwLjggNDcyLjljLTkuMyA5LjQtMjQuNSA5LjUtMzMuOSAuMnMtOS41LTI0LjUtLjItMzMuOUw0MzguNiAzMjUuOWMzMy45LTM0LjMgMzMuOS04OS40IDAtMTIzLjdMMzEwLjkgNzIuOWMtOS4zLTkuNC05LjItMjQuNiAuMi0zMy45czI0LjYtOS4yIDMzLjkgLjJ6TTAgMjI5LjVWODBDMCA1My41IDIxLjUgMzIgNDggMzJIMTk3LjVjMTcgMCAzMy4zIDYuNyA0NS4zIDE4LjdsMTY4IDE2OGMyNSAyNSAyNSA2NS41IDAgOTAuNUwyNzcuMyA0NDIuN2MtMjUgMjUtNjUuNSAyNS05MC41IDBsLTE2OC0xNjhDNi43IDI2Mi43IDAgMjQ2LjUgMCAyMjkuNXpNMTQ0IDE0NGEzMiAzMiAwIDEgMCAtNjQgMCAzMiAzMiAwIDEgMCA2NCAweiIvPjwvc3ZnPg%3D%3D&style=for-the-badge)](https://github.com/FajarKim/bz2-shell/releases)
[![Star](https://img.shields.io/github/stars/FajarKim/bz2-shell?label=Stars&labelColor=302d41&color=c9cbff&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCA1NzYgNTEyIj48cGF0aCBmaWxsPSIjRDlFMEVFIiBkPSJNMzE2LjkgMThDMzExLjYgNyAzMDAuNCAwIDI4OC4xIDBzLTIzLjQgNy0yOC44IDE4TDE5NSAxNTAuMyA1MS40IDE3MS41Yy0xMiAxLjgtMjIgMTAuMi0yNS43IDIxLjdzLS43IDI0LjIgNy45IDMyLjdMMTM3LjggMzI5IDExMy4yIDQ3NC43Yy0yIDEyIDMgMjQuMiAxMi45IDMxLjNzMjMgOCAzMy44IDIuM2wxMjguMy02OC41IDEyOC4zIDY4LjVjMTAuOCA1LjcgMjMuOSA0LjkgMzMuOC0yLjNzMTQuOS0xOS4zIDEyLjktMzEuM0w0MzguNSAzMjkgNTQyLjcgMjI1LjljOC42LTguNSAxMS43LTIxLjIgNy45LTMyLjdzLTEzLjctMTkuOS0yNS43LTIxLjdMMzgxLjIgMTUwLjMgMzE2LjkgMTh6Ii8%2BPC9zdmc%2B&style=for-the-badge)](https://github.com/FajarKim/bz2-shell/stargazers)
[![Forks](https://img.shields.io/github/forks/FajarKim/bz2-shell?label=Forks&labelColor=302d41&color=b5e8e0&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCA0NDggNTEyIj48cGF0aCBmaWxsPSIjRDlFMEVFIiBkPSJNODAgMTA0YTI0IDI0IDAgMSAwIDAtNDggMjQgMjQgMCAxIDAgMCA0OHptODAtMjRjMCAzMi44LTE5LjcgNjEtNDggNzMuM1YxOTJjMCAxNy43IDE0LjMgMzIgMzIgMzJIMzA0YzE3LjcgMCAzMi0xNC4zIDMyLTMyVjE1My4zQzMwNy43IDE0MSAyODggMTEyLjggMjg4IDgwYzAtNDQuMiAzNS44LTgwIDgwLTgwczgwIDM1LjggODAgODBjMCAzMi44LTE5LjcgNjEtNDggNzMuM1YxOTJjMCA1My00MyA5Ni05NiA5NkgyNTZ2NzAuN2MyOC4zIDEyLjMgNDggNDAuNSA0OCA3My4zYzAgNDQuMi0zNS44IDgwLTgwIDgwcy04MC0zNS44LTgwLTgwYzAtMzIuOCAxOS43LTYxIDQ4LTczLjNWMjg4SDE0NGMtNTMgMC05Ni00My05Ni05NlYxNTMuM0MxOS43IDE0MSAwIDExMi44IDAgODBDMCAzNS44IDM1LjggMCA4MCAwczgwIDM1LjggODAgODB6bTIwOCAyNGEyNCAyNCAwIDEgMCAwLTQ4IDI0IDI0IDAgMSAwIDAgNDh6TTI0OCA0MzJhMjQgMjQgMCAxIDAgLTQ4IDAgMjQgMjQgMCAxIDAgNDggMHoiLz48L3N2Zz4%3D&style=for-the-badge)](https://github.com/FajarKim/bz2-shell/network/members)
[![Issue Open](https://img.shields.io/github/issues/FajarKim/bz2-shell?label=Issue&labelColor=302d41&color=f5a97f&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCA1MTIgNTEyIj48cGF0aCBmaWxsPSIjRDlFMEVFIiBkPSJNNDY0IDI1NkEyMDggMjA4IDAgMSAwIDQ4IDI1NmEyMDggMjA4IDAgMSAwIDQxNiAwek0wIDI1NmEyNTYgMjU2IDAgMSAxIDUxMiAwQTI1NiAyNTYgMCAxIDEgMCAyNTZ6bTI1Ni05NmE5NiA5NiAwIDEgMSAwIDE5MiA5NiA5NiAwIDEgMSAwLTE5MnoiLz48L3N2Zz4%3D&style=for-the-badge)](https://github.com/FajarKim/bz2-shell/issues?q=is%3Aopen+is%3Aissue)
[![PRs Open](https://img.shields.io/github/issues-pr/FajarKim/bz2-shell?&label=Pull%20requests&labelColor=302d41&color=ddb6f2&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCA1MTIgNTEyIj48cGF0aCBmaWxsPSIjRDlFMEVFIiBkPSJNMzA1LjggMi4xQzMxNC40IDUuOSAzMjAgMTQuNSAzMjAgMjRWNjRoMTZjNzAuNyAwIDEyOCA1Ny4zIDEyOCAxMjhWMzU4LjdjMjguMyAxMi4zIDQ4IDQwLjUgNDggNzMuM2MwIDQ0LjItMzUuOCA4MC04MCA4MHMtODAtMzUuOC04MC04MGMwLTMyLjggMTkuNy02MSA0OC03My4zVjE5MmMwLTM1LjMtMjguNy02NC02NC02NEgzMjB2NDBjMCA5LjUtNS42IDE4LjEtMTQuMiAyMS45cy0xOC44IDIuMy0yNS44LTQuMWwtODAtNzJjLTUuMS00LjYtNy45LTExLTcuOS0xNy44czIuOS0xMy4zIDcuOS0xNy44bDgwLTcyYzctNi4zIDE3LjItNy45IDI1LjgtNC4xek0xMDQgODBBMjQgMjQgMCAxIDAgNTYgODBhMjQgMjQgMCAxIDAgNDggMHptOCA3My4zVjM1OC43YzI4LjMgMTIuMyA0OCA0MC41IDQ4IDczLjNjMCA0NC4yLTM1LjggODAtODAgODBzLTgwLTM1LjgtODAtODBjMC0zMi44IDE5LjctNjEgNDgtNzMuM1YxNTMuM0MxOS43IDE0MSAwIDExMi44IDAgODBDMCAzNS44IDM1LjggMCA4MCAwczgwIDM1LjggODAgODBjMCAzMi44LTE5LjcgNjEtNDggNzMuM3pNMTA0IDQzMmEyNCAyNCAwIDEgMCAtNDggMCAyNCAyNCAwIDEgMCA0OCAwem0zMjggMjRhMjQgMjQgMCAxIDAgMC00OCAyNCAyNCAwIDEgMCAwIDQ4eiIvPjwvc3ZnPg%3D%3D&style=for-the-badge)](https://github.com/FajarKim/bz2-shell/pulls?q=is%3Aopen+is%3Apr)
[![Download](https://img.shields.io/github/languages/code-size/FajarKim/bz2-shell?label=Download%20.zip&labelColor=302d41&color=b7bdf8&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzODQgNTEyIj48cGF0aCBmaWxsPSIjRDlFMEVFIiBkPSJNNjQgMEMyOC43IDAgMCAyOC43IDAgNjRWNDQ4YzAgMzUuMyAyOC43IDY0IDY0IDY0SDMyMGMzNS4zIDAgNjQtMjguNyA2NC02NFYxNjBIMjU2Yy0xNy43IDAtMzItMTQuMy0zMi0zMlYwSDY0ek0yNTYgMFYxMjhIMzg0TDI1NiAwek05NiA0OGMwLTguOCA3LjItMTYgMTYtMTZoMzJjOC44IDAgMTYgNy4yIDE2IDE2cy03LjIgMTYtMTYgMTZIMTEyYy04LjggMC0xNi03LjItMTYtMTZ6bTAgNjRjMC04LjggNy4yLTE2IDE2LTE2aDMyYzguOCAwIDE2IDcuMiAxNiAxNnMtNy4yIDE2LTE2IDE2SDExMmMtOC44IDAtMTYtNy4yLTE2LTE2em0wIDY0YzAtOC44IDcuMi0xNiAxNi0xNmgzMmM4LjggMCAxNiA3LjIgMTYgMTZzLTcuMiAxNi0xNiAxNkgxMTJjLTguOCAwLTE2LTcuMi0xNi0xNnptLTYuMyA3MS44YzMuNy0xNCAxNi40LTIzLjggMzAuOS0yMy44aDE0LjhjMTQuNSAwIDI3LjIgOS43IDMwLjkgMjMuOGwyMy41IDg4LjJjMS40IDUuNCAyLjEgMTAuOSAyLjEgMTYuNGMwIDM1LjItMjguOCA2My43LTY0IDYzLjdzLTY0LTI4LjUtNjQtNjMuN2MwLTUuNSAuNy0xMS4xIDIuMS0xNi40bDIzLjUtODguMnpNMTEyIDMzNmMtOC44IDAtMTYgNy4yLTE2IDE2czcuMiAxNiAxNiAxNmgzMmM4LjggMCAxNi03LjIgMTYtMTZzLTcuMi0xNi0xNi0xNkgxMTJ6Ii8%2BPC9zdmc%2B&style=for-the-badge)](https://github.com/FajarKim/bz2-shell/archive/refs/heads/master.zip)
</div>

# Deskripsi
BZip2 Shell Exec ini merupakan alat yang dirancang khusus, dimana ketika dijalankan, alat ini akan mengenkripsi atau mengompres semua string file shell ke dalam format BZip2 tanpa perlu khawatir di*recode* atau diambil orang lain. File yang sudah dienkripsi akan tetap bisa dijalankan dengan perintah bahasa shell. Adapun jenis bahasa shell yang didukung adalah Bourne Shell (sh), Bourne Again Shell (bash), Z Shell (zsh), Korn Shell (ksh), dan MirBSD Korn Shell (mksh).

> [!NOTE]
> Semakin banyak jumlah baris dalam sebuah file, semakin lama waktu yang dibutuhkan untuk mengenkripsi.

> [!WARNING]
> Alat ini mungkin tidak kompitabel atau tidak didukung dibeberapa Linux, seperti di Ultrix.

# Petunjuk Penginstalan
## Termux
Berikut ini adalah cara untuk menginstal BZip2 Shell Exec di aplikasi Termux!
- ```shell
  pkg update -y && pkg upgrade -y
  ```
- ```shell
  pkg install git bzip2 xz-utils curl -y
  ```
- ```shell
  git clone https://github.com/FajarKim/bz2-shell
  ```
- ```shell
  cd bz2-shell
  ```

Kemudian, jalankan file `bzsh.sh` untuk mulai mengenkripsi file shell.
- ```shell
  bash bzsh.sh --help
  ```

Jika Anda ingin menginstalnya ke folder `$PATH`, cukup jalankan file `install.sh` yang ada di folder `tools/Termux`.
- ```shell
  tools/Termux/install.sh
  ```
  atau
- ```shell
  cd tools/Termux && bash install.sh
  ```

Jika berhasil terinstal, jalankan perintah:
- ```shell
  bzsh --help
  ```

Bisa juga dengan menggunakan cara ini:
<table>
    <tr>
        <td><div align="center"><b>Metode</b></div></td>
        <td><div align="center"><b>Perintah</b></div></td>
    </tr>
    <tr>
        <td><div align="center"><b>curl</b></div></td>
        <td><div align="left">
          <pre class="language-shell"><code>pkg install curl</code></pre>
          <pre class="language-shell"><code>bash -c "$(curl -fsSL https://raw.githubusercontent.com/FajarKim/bz2-shell/master/tools/Termux/install.sh)"</code></pre></div></td>
    </tr>
    <tr>
        <td><div align="center"><b>wget</b></div></td>
        <td><div align="left">
          <pre class="language-shell"><code>pkg install wget</code></pre>
          <pre class="language-shell"><code>bash -c "$(wget -qO- https://raw.githubusercontent.com/FajarKim/bz2-shell/master/tools/Termux/install.sh)"</code></pre></div></td>
    </tr>
    <tr>
        <td><div align="center"><b>fetch</b></div></td>
        <td><div align="left">
          <pre class="language-shell"><code>pkg install fetch</code></pre>
          <pre class="language-shell"><code>bash -c "$(fetch -o - https://raw.githubusercontent.com/FajarKim/bz2-shell/master/tools/Termux/install.sh)"</code></pre></div></td>
    </tr>
</table>

Sebagai alternatif, Anda dapat mengunduh skrip `install.sh` terlebih dahulu dan menjalankannya setelah menginstalnya:
- ```shell
  pkg install wget
  ```
- ```shell
  wget https://raw.githubusercontent.com/FajarKim/bz2-shell/master/tools/Termux/install.sh
  ```
- ```shell
  bash install.sh
  ```

## Linux
Berikut ini adalah cara untuk menginstall BZip2 Shell Exec di Linux (seperti Ubuntu)!
- ```shell
  apt update -y && apt upgrade -y
  ```
- ```shell
  apt install git bzip2 xz-utils curl -y
  ```
- ```shell
  git clone https://github.com/FajarKim/bz2-shell
  ```
- ```shell
  cd bz2-shell
  ```

Kemudian, jalankan file `bzsh.sh` untuk mulai mengenkripsi file shell.
- ```shell
  bash bzsh.sh --help
  ```

Jika Anda ingin menginstalnya ke folder `$PATH`, cukup jalankan file `install.sh` yang ada di folder `tools/Linux`.
- ```shell
  tools/Linux/install.sh
  ```
  atau
- ```shell
  cd tools/Linux && bash install.sh
  ```

Jika berhasil terinstal, jalankan perintah:
- ```shell
  bzsh --help
  ```

Bisa juga dengan menggunakan cara ini:
<table>
    <tr>
        <td><div align="center"><b>Metode</b></div></td>
        <td><div align="center"><b>Perintah</b></div></td>
    </tr>
    <tr>
        <td><div align="center"><b>curl</b></div></td>
        <td><div align="left">
          <pre class="language-shell"><code>apt install curl</code></pre>
          <pre class="language-shell"><code>bash -c "$(curl -fsSL https://raw.githubusercontent.com/FajarKim/bz2-shell/master/tools/Linux/install.sh)"</code></pre>
        </div></td>
    </tr>
    <tr>
        <td><div align="center"><b>wget</b></div></td>
        <td><div align="left">
          <pre class="language-shell"><code>apt install wget</code></pre>
          <pre class="language-shell"><code>bash -c "$(wget -qO- https://raw.githubusercontent.com/FajarKim/bz2-shell/master/tools/Linux/install.sh)"</code></pre></div></td>
    </tr>
    <tr>
        <td><div align="center"><b>fetch</b></div></td>
        <td><div align="left">
          <pre class="language-shell"><code>apt install fetch</code></pre>
          <pre class="language-shell"><code>bash -c "$(fetch -o - https://raw.githubusercontent.com/FajarKim/bz2-shell/master/tools/Linux/install.sh)"</code></pre></div></td>
    </tr>
</table>

Sebagai alternatif, Anda dapat mengunduh skrip `install.sh` terlebih dahulu dan menjalankannya setelah menginstalnya:
- ```shell
  apt install wget
  ```
- ```shell
  wget https://raw.githubusercontent.com/FajarKim/bz2-shell/master/tools/Linux/install.sh
  ```
- ```shell
  bash install.sh
  ```

# Petunjuk Penggunaan
Alat ini diprogram untuk bisa dijalankan dengan beberapa perintah. Perintah yang didukung:
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
        <td><div align="left"><code>--upgrade</code></div></td>
        <td><div align="left">Tingkatkan versi alat ini</div></td>
    </tr>
    <tr>
        <td><div align="left"><code>--uninstall</code></div></td>
        <td><div align="left">Mencopot pemasangan alat ini</div></td>
    </tr>
    <tr>
        <td><div align="left"><code>-t</code> atau <code>--type-shell</code></div></td>
        <td><div align="left">Pilih jenis shell (sh, bash, zsh, ksh, atau mksh)</div></td>
    </tr>
    <tr>
        <td><div align="left"><code>-f</code> atau <code>--file</code></div></td>
        <td><div align="left">Kompres setiap FILE sebagai gantinya</div></td>
    </tr>
</table>

Cara menjalankan alat ini:
#### Contoh 1
```shell
bzsh.sh -t bash -f FILE
```
atau
```shell
bzsh.sh --type-shell bash --file FILE
```
#### Example 2
Jika ingin mengenkripsi lebih dari 1 file dalam waktu yang sama, Anda bisa lakukan itu.
```shell
bzsh.sh -t bash -f FILE1 FILE2 FILE3 etc...
```
atau
```shell
bzsh.sh --type-shell bash --file FILE1 FILE2 FILE3 etc...
```

## Lisensi
BZip2 Shell Exec dirilis di bawah lisensi AGPL-3.0, yang memberikan izin berikut:
 - Penggunaan komersial
 - Modifikasi
 - Distribusi
 - Penggunaan paten
 - Penggunaan pribadi

Untuk bahasa yang lebih lanjut, lihat [LISENSI](/LICENSE).

### Media Sosial dan Kontak
<div align="center">
    <a href="https://facebook.com/fajarrkim"><img src="https://raw.githubusercontent.com/FajarKim/FajarKim/master/images/icons/facebook-icon.svg" alt="Facebook"></a>
    <a href="https://instagram.com/fajarkim_"><img src="https://raw.githubusercontent.com/FajarKim/FajarKim/master/images/icons/instagram-icon.svg" alt="Instagram"></a>
    <a href="https://wa.me/6285659850910?text=Hi"><img src="https://raw.githubusercontent.com/FajarKim/FajarKim/master/images/icons/whatsapp-icon.svg" alt="WhatsApp"></a>
    <a href="https://t.me/FajarThea"><img src="https://raw.githubusercontent.com/FajarKim/FajarKim/master/images/icons/telegram-icon.svg" alt="Telegram"></a>
    <a href="https://twitter.com/fajarkim_"><img src="https://raw.githubusercontent.com/FajarKim/FajarKim/master/images/icons/twitter-x-icon.svg" alt="Twitter"></a>
    <a href="https://tiktok.com/@fajarkim_"><img src="https://raw.githubusercontent.com/FajarKim/FajarKim/master/images/icons/tiktok-icon.svg" alt="TikTok"></a>
    <a href="https://youtube.com/@FajarHacker"><img src="https://raw.githubusercontent.com/FajarKim/FajarKim/master/images/icons/youtube-icon.svg" alt="YouTube"></a>
    <a href="https://m.me/fajarrkim"><img src="https://raw.githubusercontent.com/FajarKim/FajarKim/master/images/icons/messenger-icon.svg" alt="Messenger"></a>
    <a href="mailto:fajarrkim@gmail.com"><img src="https://raw.githubusercontent.com/FajarKim/FajarKim/master/images/icons/mail-icon.svg" alt="Email"></a>
    <p>Ikuti media sosial saya!</p>
</div>

### Donasi
Suka proyek ini? Harap pertimbangkan untuk berdonasi untuk membantu meningkatkannya.
<div align="left">
    <a href="https://github.com/sponsors/FajarKim/"><img src="https://img.shields.io/badge/GitHub-Sponsor-blue?s&labelColor=302d41&color=f5bde6&logo=github&logoColor=d9e0ee&style=for-the-badge" alt="GitHub Sponsor"></a>
    <a href="https://paypal.me/agusbirawan/"><img src="https://img.shields.io/badge/PayPal-Donate-blue?s&labelColor=302d41&color=f4dbd6&logo=paypal&logoColor=d9e0ee&style=for-the-badge" alt="PayPal Donate"></a>
    <a href="https://buymeacoffee.com/fajarkim/"><img src="https://img.shields.io/badge/Buy%20Me%20A%20Coffee-Donate-blue?s&labelColor=302d41&color=eed49f&logo=buymeacoffee&logoColor=d9e0ee&style=for-the-badge" alt="Buy Me a Coffee"></a>
    <a href="https://trakteer.id/FajarKim/"><img src="https://github.com/FajarKim/bz2-shell/assets/86386385/c1d4c7fe-90a4-4121-8ab7-2bfac61285f2" alt="Trakteer.id Donate"></a>
</div>

Apakah Anda mempertimbangkan untuk mendukung proyek ini dengan menyumbang kepada saya? TOLONG JANGAN!!

Silakan kunjungi [tautan ini](https://fajarkim.github.io/donate) dan berikan donasi kecil untuk membantu orang-orang yang membutuhkan. Sumbangan kecil akan sangat bermanfaat. ❤️

### Repositori Serupa
Gratis:
- [LZip Shell Exec](https://github.com/FajarKim/lzip-shell)
- [NCompress Shell Exec](https://github.com/FajarKim/nc-shell)
- [PreZip Shell Exec](https://github.com/FajarKim/prz-shell)
- [Blind Bash](https://github.com/FajarKim/blind-bash)

Berbayar (Untuk Sponsor):
- [GZip Shell Exec](https://github.com/FajarKim/gz-shell)
- [Lzma Shell Exec](https://github.com/FajarKim/lz-shell)
- [XZ Shell Exec](https://github.com/FajarKim/xz-shell)
- [Zstd Shell Exec](https://github.com/FajarKim/zstd-shell)

<div align="center">
  <img src="https://raw.githubusercontent.com/FajarKim/FajarKim/master/images/line.svg?sanitize=true"/>
</div>

<p align="center">Dibuat dengan ❤️ dan Shell</p>
<p align="center">Copyright © 2022-sekarang Rangga Fajar Oktariansyah</p>
<div align="center">
  <a href="LICENSE"><img src="https://img.shields.io/github/license/FajarKim/bz2-shell?label=License&labelColor=302d41&color=91d7e3&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCA2NDAgNTEyIj48cGF0aCBmaWxsPSIjRDlFMEVFIiBkPSJNMzg0IDMySDUxMmMxNy43IDAgMzIgMTQuMyAzMiAzMnMtMTQuMyAzMi0zMiAzMkgzOTguNGMtNS4yIDI1LjgtMjIuOSA0Ny4xLTQ2LjQgNTcuM1Y0NDhINTEyYzE3LjcgMCAzMiAxNC4zIDMyIDMycy0xNC4zIDMyLTMyIDMySDMyMCAxMjhjLTE3LjcgMC0zMi0xNC4zLTMyLTMyczE0LjMtMzIgMzItMzJIMjg4VjE1My4zYy0yMy41LTEwLjMtNDEuMi0zMS42LTQ2LjQtNTcuM0gxMjhjLTE3LjcgMC0zMi0xNC4zLTMyLTMyczE0LjMtMzIgMzItMzJIMjU2YzE0LjYtMTkuNCAzNy44LTMyIDY0LTMyczQ5LjQgMTIuNiA2NCAzMnptNTUuNiAyODhINTg0LjRMNTEyIDE5NS44IDQzOS42IDMyMHpNNTEyIDQxNmMtNjIuOSAwLTExNS4yLTM0LTEyNi03OC45Yy0yLjYtMTEgMS0yMi4zIDYuNy0zMi4xbDk1LjItMTYzLjJjNS04LjYgMTQuMi0xMy44IDI0LjEtMTMuOHMxOS4xIDUuMyAyNC4xIDEzLjhsOTUuMiAxNjMuMmM1LjcgOS44IDkuMyAyMS4xIDYuNyAzMi4xQzYyNy4yIDM4MiA1NzQuOSA0MTYgNTEyIDQxNnpNMTI2LjggMTk1LjhMNTQuNCAzMjBIMTk5LjNMMTI2LjggMTk1Ljh6TS45IDMzNy4xYy0yLjYtMTEgMS0yMi4zIDYuNy0zMi4xbDk1LjItMTYzLjJjNS04LjYgMTQuMi0xMy44IDI0LjEtMTMuOHMxOS4xIDUuMyAyNC4xIDEzLjhsOTUuMiAxNjMuMmM1LjcgOS44IDkuMyAyMS4xIDYuNyAzMi4xQzI0MiAzODIgMTg5LjcgNDE2IDEyNi44IDQxNlMxMS43IDM4MiAuOSAzMzcuMXoiLz48L3N2Zz4%3D&style=for-the-badge" alt="License"></a>
</div>
