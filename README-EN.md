# BZip2 Shell Exec
BZip2 Shell Exec is a tool used to encrypt shell scripts ️🛡️, such as Bourne Shell (sh), Bourne Again Shell (bash), Z Shell (zsh), Korn Shell (ksh), and MirBSD Korn Shell (mksh). The file will be encrypted into bzip2 format.

[▶ Show Indonesian translation](https://github.com/FajarKim/bz2-shell)

![Size](https://img.shields.io/github/languages/code-size/FajarKim/bz2-shell?label=BZip2%20Shell%20Exec&style=flat-square&logo=github)
[![Stars](https://img.shields.io/github/stars/FajarKim/bz2-shell?label=Star&style=flat-square&color=red)](https://github.com/FajarKim/bz2-shell/stargazers/)
[![Forks](https://img.shields.io/github/forks/FajarKim/bz2-shell?label=Fork&style=flat-square&color=orange)](https://github.com/FajarKim/bz2-shell/network/members/)
[![Issues](https://img.shields.io/github/issues/FajarKim/bz2-shell?label=Issue&style=flat-square&color=blueviolet)](https://github.com/FajarKim/bz2-shell/issues/)
[![Watchers](https://img.shields.io/github/watchers/FajarKim/bz2-shell?label=Watch&style=flat-square&color=01ffd1)](https://github.com/FajarKim/bz2-shell/watchers/)
[![Pull-requests](https://img.shields.io/github/issues-pr/FajarKim/bz2-shell?label=Pull%20requests&style=flat-square&color=0000ff)](https://github.com/FajarKim/bz2-shell/pull/)
[![License](https://img.shields.io/github/license/FajarKim/bz2-shell?label=License&logo=gnu&style=flat-square)](https://www.gnu.org/licenses/agpl-3.0.html)

# List of Contents
- [BZip2 Shell Exec](https://github.com/FajarKim/bz2-shell/blob/master/README-EN.md#bzip2-shell-exec)
- [Instructions for Installation](https://github.com/FajarKim/bz2-shell/blob/master/README-EN.md#instructions-for-installation)
  - [Termux](https://github.com/FajarKim/bz2-shell/blob/master/README-EN.md#termux)
  - [Linux](https://github.com/FajarKim/bz2-shell/blob/master/README-EN.md#linux)
- [Instructions for Use](https://github.com/FajarKim/bz2-shell/blob/master/README-EN.md#instructions-for-use)
- [Copyright](https://github.com/FajarKim/bz2-shell/blob/master/README-EN.md#copyright)
- [Contact](https://github.com/FajarKim/bz2-shell/blob/master/README-EN.md#contact)

# Instructions for Installation
## Termux
### Step 1
- `$ pkg update -y && pkg upgrade -y`
- `$ pkg install bzip2 lzip git -y`
- `$ git clone https://github.com/FajarKim/bz2-shell`
- `$ cd bz2-shell/tools/Termux`
- `$ ./install.sh` or `$ bash install.sh`
### Step 2
| Method    | Command                                                                                                       |
| :-------- | :------------------------------------------------------------------------------------------------------------ |
| **curl**  | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/FajarKim/bz2-shell/master/tools/Termux/install.sh)"` |
| **wget**  | `bash -c "$(wget -qO- https://raw.githubusercontent.com/FajarKim/bz2-shell/master/tools/Termux/install.sh)"`  |
| **fetch** | `bash -c "$(fetch -o - https://raw.githubusercontent.com/FajarKim/bz2-shell/master/tools/Termux/install.sh)"` |

As an alternative, you can first download the `install.sh` script and run it afterwards:
```text
$ wget https://raw.githubusercontent.com/FajarKim/bz2-shell/master/tools/Termux/install.sh
$ bash install.sh
```
## Linux
### Step 1
- `$ apt update -y && apt upgrade -y`
- `$ apt install bzip2 lzip git -y`
- `$ git clone https://github.com/FajarKim/bz2-shell`
- `$ cd bz2-shell/tools/Linux`
- `$ ./install.sh` atau `$ bash install.sh`
### Step 2
| Method    | Command                                                                                                      |
| :-------- | :----------------------------------------------------------------------------------------------------------- |
| **curl**  | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/FajarKim/bz2-shell/master/tools/Linux/install.sh)"` |
| **wget**  | `bash -c "$(wget -qO- https://raw.githubusercontent.com/FajarKim/bz2-shell/master/tools/Linux/install.sh)"`  |
| **fetch** | `bash -c "$(fetch -o - https://raw.githubusercontent.com/FajarKim/bz2-shell/master/tools/Linux/install.sh)"` |

As an alternative, you can first download the `install.sh` script and run it afterwards:
```text
$ wget https://raw.githubusercontent.com/FajarKim/bz2-shell/master/tools/Linux/install.sh
$ bash install.sh
```

# Instructions for Use
Supported commands:
| Command                | Description                                          |
| :--------------------- | :--------------------------------------------------- |
| `-h` or `--help`       | Display this help                                    |
| `-v` or `--version`    | Output version information                           |
| `-t` or `--type-shell` | Change your type shell (sh, bash, zsh, ksh, or mksh) |
| `-f` or `--file`       | Compress each FILE instead it                        |

How to run this tool:
### Example 1
```text
$ bzsh.sh -t bash -f FILE
```
or
```text
$ bzsh.sh --type-shell bash --file FILE
```
### Example 2
```text
$ bzsh.sh -t bash -f FILE1 FILE2 FILE3...
```
or
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

# Contact
Please contact me below if you have any questions or problems regarding this tool.

[![WhatsApp](https://img.shields.io/badge/WhatsApp-grey?style=plastic&color=202a33&logo=whatsapp)](https://wa.me/6285659850910?text=Hi) 
[![Telegram](https://img.shields.io/badge/Telegram-grey?style=plastic&color=202a33&logo=telegram)](https://t.me/FajarThea) 
[![Gmail](https://img.shields.io/badge/E%20Mail-grey?style=plastic&color=202a33&logo=gmail)](mailto:fajarrkim@gmail.com) 

Don't forget to follow the account below, too!

[![Facebook](https://img.shields.io/badge/Facebook-grey?style=plastic&color=202a33&logo=facebook)](https://www.facebook.com/profile.php?id=100071979099290) 
[![Instagram](https://img.shields.io/badge/Instagram-grey?style=plastic&color=202a33&logo=instagram)](https://instagram.com/fajarkim_)
[![Twitter](https://img.shields.io/badge/Twitter-grey?style=plastic&color=202a33&logo=twitter)](https://twitter.com/fajarkim_)
