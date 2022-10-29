# BZip2 Shell Exec
BZip2 Shell Exec merupakan alat yang digunakan untuk mengenkripsi skrip shell 🛡️, seperti Bourne Shell (sh), Bourne Again Shell (bash), Z Shell (zsh), Korn Shell (ksh), dan MirBSD Korn Shell (mksh). File tersebut akan dienkripsi ke dalam format bzip2.

[▶ Show English translation](https://github.com/FajarKim/bz2-shell/blob/master/README-EN.md)

![Size](https://img.shields.io/github/languages/code-size/FajarKim/bz2-shell?label=BZip2%20Shell%20Exec&style=flat-square&logo=github)
[![Stars](https://img.shields.io/github/stars/FajarKim/bz2-shell?label=Star&style=flat-square&color=red)](https://github.com/FajarKim/bz2-shell/stargazers/)
[![Forks](https://img.shields.io/github/forks/FajarKim/bz2-shell?label=Fork&style=flat-square&color=orange)](https://github.com/FajarKim/bz2-shell/network/members/)
[![Issues](https://img.shields.io/github/issues/FajarKim/bz2-shell?label=Issue&style=flat-square&color=blueviolet)](https://github.com/FajarKim/bz2-shell/issues/)
[![Watchers](https://img.shields.io/github/watchers/FajarKim/bz2-shell?label=Watch&style=flat-square&color=01ffd1)](https://github.com/FajarKim/bz2-shell/watchers/)
[![Pull-requests](https://img.shields.io/github/issues-pr/FajarKim/bz2-shell?label=Pull%20requests&style=flat-square&color=0000ff)](https://github.com/FajarKim/bz2-shell/pull/)
[![License](https://img.shields.io/github/license/FajarKim/bz2-shell?label=License&logo=gnu&style=flat-square)](https://www.gnu.org/licenses/agpl-3.0.html)

# Daftar Isi
- [BZip2 Shell Exec](https://github.com/FajarKim/bz2-shell#bzip2-shell-exec)
- [Petunjuk Penginstallan](https://github.com/FajarKim/bz2-shell#petunjuk-penginstallan)
  - [Termux](https://github.com/FajarKim/bz2-shell#termux)
  - [Linux](https://github.com/FajarKim/bz2-shell#linux)
- [Petunjuk Penggunaan](https://github.com/FajarKim/bz2-shell#petunjuk-penggunaan)
- [Copyright](https://github.com/FajarKim/bz2-shell#copyright)
- [Kontak](https://github.com/FajarKim/bz2-shell#kontak)

# Petunjuk Penginstallan
## Termux
### Cara 1
- `$ pkg update -y && pkg upgrade -y`
- `$ pkg install bzip2 lzip git -y`
- `$ git clone https://github.com/FajarKim/bz2-shell`
- `$ cd bz2-shell/tools/Termux`
- `$ ./install.sh` atau `$ bash install.sh`
### Cara 2
| Metode    | Perintah                                                                                                      |
| :-------- | :------------------------------------------------------------------------------------------------------------ |
| **curl**  | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/FajarKim/bz2-shell/master/tools/Termux/install.sh)"` |
| **wget**  | `bash -c "$(wget -qO- https://raw.githubusercontent.com/FajarKim/bz2-shell/master/tools/Termux/install.sh)"`  |
| **fetch** | `bash -c "$(fetch -o - https://raw.githubusercontent.com/FajarKim/bz2-shell/master/tools/Termux/install.sh)"` |

Sebagai alternatif, Anda dapat mengunduh skrip `install.sh` terlebih dahulu dan menjalankannya setelah menginstalnya:
```text
$ wget https://raw.githubusercontent.com/FajarKim/bz2-shell/master/tools/Termux/install.sh
$ bash install.sh
```
## Linux
### Cara 1
- `$ pkg update -y && pkg upgrade -y`
- `$ pkg install bzip2 lzip git -y`
- `$ git clone https://github.com/FajarKim/bz2-shell`
- `$ cd bz2-shell/tools/Linux`
- `$ ./install.sh` atau `$ bash install.sh`
### Cara 2
| Metode    | Perintah                                                                                                     |
| :-------- | :----------------------------------------------------------------------------------------------------------- |
| **curl**  | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/FajarKim/bz2-shell/master/tools/Linux/install.sh)"` |
| **wget**  | `bash -c "$(wget -qO- https://raw.githubusercontent.com/FajarKim/bz2-shell/master/tools/Linux/install.sh)"`  |
| **fetch** | `bash -c "$(fetch -o - https://raw.githubusercontent.com/FajarKim/bz2-shell/master/tools/Linux/install.sh)"` |

Sebagai alternatif, Anda dapat mengunduh skrip `install.sh` terlebih dahulu dan menjalankannya setelah menginstalnya:
```text
$ wget https://raw.githubusercontent.com/FajarKim/bz2-shell/master/tools/Linux/install.sh
$ bash install.sh
```

# Petunjuk Penggunaan
Perintah yang didukung:
| Perintah                 | Keterangan                                        |
| :----------------------- | :------------------------------------------------ |
| `-h` atau `--help`       | Menampilkan bantuan untuk alat ini                |
| `-v` atau `--version`    | Informasi versi keluaran terbaru                  |
| `-t` atau `--type-shell` | Pilih jenis shell (sh, bash, zsh, ksh, atau mksh) |
| `-f` atau `--file`       | Kompres setiap FILE sebagai gantinya              |

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

# Copyright
```text
 BZip2 Shell Exec (bz2-shell)
 Copyright (C) 2022 Fajar Kim

 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU Affero General Public License as
 published by the Free Software Foundation, either version 3 of the
 License, or (at your option) any later version.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU Affero General Public License for more details.

 You should have received a copy of the GNU Affero General Public License
 along with this program.  If not, see <https://www.gnu.org/licenses/>.
```

# Kontak
Silahkan hubungi kontak saya dibawah ini jika ada pertanyaan atau masalah terkait alat ini.

[![WhatsApp](https://img.shields.io/badge/WhatsApp-grey?style=plastic&color=202a33&logo=whatsapp)](https://wa.me/6285659850910?text=Hi) 
[![Telegram](https://img.shields.io/badge/Telegram-grey?style=plastic&color=202a33&logo=telegram)](https://t.me/FajarThea) 
[![Gmail](https://img.shields.io/badge/E%20Mail-grey?style=plastic&color=202a33&logo=gmail)](mailto:fajarrkim@gmail.com) 

Jangan lupa Follow juga akun dibawah ini ya!

[![Facebook](https://img.shields.io/badge/Facebook-grey?style=plastic&color=202a33&logo=facebook)](https://www.facebook.com/profile.php?id=100071979099290) 
[![Instagram](https://img.shields.io/badge/Instagram-grey?style=plastic&color=202a33&logo=instagram)](https://instagram.com/fajarkim_)
[![Twitter](https://img.shields.io/badge/Twitter-grey?style=plastic&color=202a33&logo=twitter)](https://twitter.com/fajarkim_)
