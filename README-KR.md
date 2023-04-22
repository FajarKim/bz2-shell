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
    <a href=""><img src="https://img.shields.io/github/license/FajarKim/bz2-shell?label=License&style=plastic&color=01ffc4&logo=gnu" alt="License"></a>
</div>

# BZip2 Shell Exec
BZip2 Shell Exec은 Bourne Shell (sh), Bourne Again Shell (bash), Z Shell (zsh), Korn Shell (ksh),  그리고 MirBSD Korn Shell (mksh) 등 여러 셸 유형 🔐의 스크립트 문자열을 BZip2 포맷으로 압축하는 데 사용할 수 있는 도구입니다.

<details>
<summary>번역</summary>

- [🇬🇧 English (UK)](https://github.com/FajarKim/bz2-shell/blob/master/README-EN.md)
- [🇫🇷 France](https://github.com/FajarKim/bz2-shell/blob/master/README-FR.md)
- [🇮🇩 Indonesian](https://github.com/FajarKim/bz2-shell)
</details>

# 설치 지침
## Termux
### 방법 1
- `$ pkg update -y && pkg upgrade -y`
- `$ pkg install bzip2 lzma git -y`
- `$ git clone https://github.com/FajarKim/bz2-shell`
- `$ cd bz2-shell/tools/Termux`
- `$ ./install.sh` 또는 `$ bash install.sh`
### 방법 2
<table>
    <tr>
        <td><div align="center"><b>메소드</b></div></td>
        <td><div align="center"><b>명령어</b></div></td>
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

또는 먼저 `install.sh` 스크립트를 다운로드한 후 실행할 수 있습니다:
```text
$ wget https://raw.githubusercontent.com/FajarKim/bz2-shell/master/tools/Termux/install.sh
$ bash install.sh
```
## Linux
### 방법 1
- `$ apt update -y && apt upgrade -y`
- `$ apt install bzip2 lzma git -y`
- `$ git clone https://github.com/FajarKim/bz2-shell`
- `$ cd bz2-shell/tools/Linux`
- `$ ./install.sh` 또는 `$ bash install.sh`
### 방법 2
<table>
    <tr>
        <td><div align="center"><b>메소드</b></div></td>
        <td><div align="center"><b>명령어</b></div></td>
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

또는 먼저 `install.sh` 스크립트를 다운로드한 후 실행할 수 있습니다:
```text
$ wget https://raw.githubusercontent.com/FajarKim/bz2-shell/master/tools/Linux/install.sh
$ bash install.sh
```

# 사용 지침
지원되는 명령어:
<table>
    <tr>
        <td><div align="center"><b>명령어</b></div></td>
        <td><div align="center"><b>설명</b></div></td>
    </tr>
    <tr>
        <td><div align="left"><code>-h</code> 또는 <code>--help</code></div></td>
        <td><div align="left">이 도움말 표시</div></td>
    </tr>
    <tr>
        <td><div align="left"><code>-v</code> 또는 <code>--version</code></div></td>
        <td><div align="left">출력 버전 정보</div></td>
    </tr>
    <tr>
        <td><div align="left"><code>-t</code> 또는 <code>--type-shell</code></div></td>
        <td><div align="left">셸 유형 선택 (sh, bash, zsh, ksh, 또는 mksh)</div></td>
    </tr>
    <tr>
        <td><div align="left"><code>-f</code> 또는 <code>--file</code></div></td>
        <td><div align="left">대신 각 FILE 을 압축합니다</div></td>
    </tr>
<table>

이 도구를 실행하는 방법:
### 예제 1
```text
$ bzsh.sh -t bash -f FILE
```
또는
```text
$ bzsh.sh --type-shell bash --file FILE
```
### 예제 2
```text
$ bzsh.sh -t bash -f FILE1 FILE2 FILE3...
```
또는
```text
$ bzsh.sh --type-shell bash --file FILE1 FILE2 FILE3...
```

# 연락처
이 도구와 관련하여 문제나 궁금한 점이 있으면 아래 연락처로 문의해 주세요. 저를 팔로우하는 것을 잊지 마세요!
<div align="center">
    <a href="https://www.facebook.com/profile.php?id=100071979099290"><img src="https://raw.githubusercontent.com/FajarKim/FajarKim/master/images/facebook_logo.png" alt="Facebook" width="35"></a>
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

# 기부하기
이 계정의 개발과 발전을 위해 기부하고 싶은 친절한 분들은 아래 링크를 클릭해 주세요! 기부해주시는 분들께 진심으로 감사드립니다 😊😊😊
<div align="left">
    <a href="https://github.com/sponsors/FajarKim/"><img src="https://raw.githubusercontent.com/FajarKim/FajarKim/master/images/donate_github.png" alt="GitHub Sponsor" width="165"></a>
    <a href="https://paypal.me/agusbirawan/"><img src="https://raw.githubusercontent.com/FajarKim/FajarKim/master/images/donate_paypal.png" alt="PayPal Donate" width="165"></a>
    <a href="https://trakteer.id/FajarKim/"><img src="https://raw.githubusercontent.com/FajarKim/FajarKim/master/images/donate_trakteer.png" alt="Trakteer.id Donate" width="165"></a>
</div>