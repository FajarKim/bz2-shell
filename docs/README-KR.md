<div align="center">
  <img src="https://github.com/FajarKim/bz2-shell/assets/86386385/80ef91fe-8079-42f5-bc95-78eb60717792" alt="BZSH Logo" width="40%">
  <h3>BZip2 Shell Exec</h3>
  <p>🛠️ BZip2 형식의 간단한 암호화 Shell 스크립트</p>
  <p><a href="https://github.com/FajarKim/bz2-shell/issues/new?assignees=&labels=bug&projects=&template=bug_report.yml">버그를 제보하기</a> · <a href="https://github.com/FajarKim/bz2-shell/issues/new?assignees=&labels=enhancement&projects=&template=feature_request.yml">기능 요청</a> · <a href="https://github.com/FajarKim/bz2-shell/discussions/new?category=q-a">물어보다</a></p>
  <p><a href="/README.md">English</a> · <a href="/docs/README-ID.md">Indonesia</a></p>
</div>
<div align="center">

[![Version](https://img.shields.io/github/v/tag/FajarKim/bz2-shell?label=Version&labelColor=302d41&color=f2cdcd&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCA1MTIgNTEyIj48cGF0aCBmaWxsPSIjRDlFMEVFIiBkPSJNMzQ1IDM5LjFMNDcyLjggMTY4LjRjNTIuNCA1MyA1Mi40IDEzOC4yIDAgMTkxLjJMMzYwLjggNDcyLjljLTkuMyA5LjQtMjQuNSA5LjUtMzMuOSAuMnMtOS41LTI0LjUtLjItMzMuOUw0MzguNiAzMjUuOWMzMy45LTM0LjMgMzMuOS04OS40IDAtMTIzLjdMMzEwLjkgNzIuOWMtOS4zLTkuNC05LjItMjQuNiAuMi0zMy45czI0LjYtOS4yIDMzLjkgLjJ6TTAgMjI5LjVWODBDMCA1My41IDIxLjUgMzIgNDggMzJIMTk3LjVjMTcgMCAzMy4zIDYuNyA0NS4zIDE4LjdsMTY4IDE2OGMyNSAyNSAyNSA2NS41IDAgOTAuNUwyNzcuMyA0NDIuN2MtMjUgMjUtNjUuNSAyNS05MC41IDBsLTE2OC0xNjhDNi43IDI2Mi43IDAgMjQ2LjUgMCAyMjkuNXpNMTQ0IDE0NGEzMiAzMiAwIDEgMCAtNjQgMCAzMiAzMiAwIDEgMCA2NCAweiIvPjwvc3ZnPg%3D%3D&style=for-the-badge)](https://github.com/FajarKim/bz2-shell/releases)
[![Star](https://img.shields.io/github/stars/FajarKim/bz2-shell?label=Stars&labelColor=302d41&color=c9cbff&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCA1NzYgNTEyIj48cGF0aCBmaWxsPSIjRDlFMEVFIiBkPSJNMzE2LjkgMThDMzExLjYgNyAzMDAuNCAwIDI4OC4xIDBzLTIzLjQgNy0yOC44IDE4TDE5NSAxNTAuMyA1MS40IDE3MS41Yy0xMiAxLjgtMjIgMTAuMi0yNS43IDIxLjdzLS43IDI0LjIgNy45IDMyLjdMMTM3LjggMzI5IDExMy4yIDQ3NC43Yy0yIDEyIDMgMjQuMiAxMi45IDMxLjNzMjMgOCAzMy44IDIuM2wxMjguMy02OC41IDEyOC4zIDY4LjVjMTAuOCA1LjcgMjMuOSA0LjkgMzMuOC0yLjNzMTQuOS0xOS4zIDEyLjktMzEuM0w0MzguNSAzMjkgNTQyLjcgMjI1LjljOC42LTguNSAxMS43LTIxLjIgNy45LTMyLjdzLTEzLjctMTkuOS0yNS43LTIxLjdMMzgxLjIgMTUwLjMgMzE2LjkgMTh6Ii8%2BPC9zdmc%2B&style=for-the-badge)](https://github.com/FajarKim/bz2-shell/stargazers)
[![Forks](https://img.shields.io/github/forks/FajarKim/bz2-shell?label=Forks&labelColor=302d41&color=b5e8e0&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCA0NDggNTEyIj48cGF0aCBmaWxsPSIjRDlFMEVFIiBkPSJNODAgMTA0YTI0IDI0IDAgMSAwIDAtNDggMjQgMjQgMCAxIDAgMCA0OHptODAtMjRjMCAzMi44LTE5LjcgNjEtNDggNzMuM1YxOTJjMCAxNy43IDE0LjMgMzIgMzIgMzJIMzA0YzE3LjcgMCAzMi0xNC4zIDMyLTMyVjE1My4zQzMwNy43IDE0MSAyODggMTEyLjggMjg4IDgwYzAtNDQuMiAzNS44LTgwIDgwLTgwczgwIDM1LjggODAgODBjMCAzMi44LTE5LjcgNjEtNDggNzMuM1YxOTJjMCA1My00MyA5Ni05NiA5NkgyNTZ2NzAuN2MyOC4zIDEyLjMgNDggNDAuNSA0OCA3My4zYzAgNDQuMi0zNS44IDgwLTgwIDgwcy04MC0zNS44LTgwLTgwYzAtMzIuOCAxOS43LTYxIDQ4LTczLjNWMjg4SDE0NGMtNTMgMC05Ni00My05Ni05NlYxNTMuM0MxOS43IDE0MSAwIDExMi44IDAgODBDMCAzNS44IDM1LjggMCA4MCAwczgwIDM1LjggODAgODB6bTIwOCAyNGEyNCAyNCAwIDEgMCAwLTQ4IDI0IDI0IDAgMSAwIDAgNDh6TTI0OCA0MzJhMjQgMjQgMCAxIDAgLTQ4IDAgMjQgMjQgMCAxIDAgNDggMHoiLz48L3N2Zz4%3D&style=for-the-badge)](https://github.com/FajarKim/bz2-shell/network/members)
[![Issue Open](https://img.shields.io/github/issues/FajarKim/bz2-shell?label=Issue&labelColor=302d41&color=f5a97f&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCA1MTIgNTEyIj48cGF0aCBmaWxsPSIjRDlFMEVFIiBkPSJNNDY0IDI1NkEyMDggMjA4IDAgMSAwIDQ4IDI1NmEyMDggMjA4IDAgMSAwIDQxNiAwek0wIDI1NmEyNTYgMjU2IDAgMSAxIDUxMiAwQTI1NiAyNTYgMCAxIDEgMCAyNTZ6bTI1Ni05NmE5NiA5NiAwIDEgMSAwIDE5MiA5NiA5NiAwIDEgMSAwLTE5MnoiLz48L3N2Zz4%3D&style=for-the-badge)](https://github.com/FajarKim/bz2-shell/issues?q=is%3Aopen+is%3Aissue)
[![PRs Open](https://img.shields.io/github/issues-pr/FajarKim/bz2-shell?&label=Pull%20requests&labelColor=302d41&color=ddb6f2&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCA1MTIgNTEyIj48cGF0aCBmaWxsPSIjRDlFMEVFIiBkPSJNMzA1LjggMi4xQzMxNC40IDUuOSAzMjAgMTQuNSAzMjAgMjRWNjRoMTZjNzAuNyAwIDEyOCA1Ny4zIDEyOCAxMjhWMzU4LjdjMjguMyAxMi4zIDQ4IDQwLjUgNDggNzMuM2MwIDQ0LjItMzUuOCA4MC04MCA4MHMtODAtMzUuOC04MC04MGMwLTMyLjggMTkuNy02MSA0OC03My4zVjE5MmMwLTM1LjMtMjguNy02NC02NC02NEgzMjB2NDBjMCA5LjUtNS42IDE4LjEtMTQuMiAyMS45cy0xOC44IDIuMy0yNS44LTQuMWwtODAtNzJjLTUuMS00LjYtNy45LTExLTcuOS0xNy44czIuOS0xMy4zIDcuOS0xNy44bDgwLTcyYzctNi4zIDE3LjItNy45IDI1LjgtNC4xek0xMDQgODBBMjQgMjQgMCAxIDAgNTYgODBhMjQgMjQgMCAxIDAgNDggMHptOCA3My4zVjM1OC43YzI4LjMgMTIuMyA0OCA0MC41IDQ4IDczLjNjMCA0NC4yLTM1LjggODAtODAgODBzLTgwLTM1LjgtODAtODBjMC0zMi44IDE5LjctNjEgNDgtNzMuM1YxNTMuM0MxOS43IDE0MSAwIDExMi44IDAgODBDMCAzNS44IDM1LjggMCA4MCAwczgwIDM1LjggODAgODBjMCAzMi44LTE5LjcgNjEtNDggNzMuM3pNMTA0IDQzMmEyNCAyNCAwIDEgMCAtNDggMCAyNCAyNCAwIDEgMCA0OCAwem0zMjggMjRhMjQgMjQgMCAxIDAgMC00OCAyNCAyNCAwIDEgMCAwIDQ4eiIvPjwvc3ZnPg%3D%3D&style=for-the-badge)](https://github.com/FajarKim/bz2-shell/pulls?q=is%3Aopen+is%3Apr)
[![Download](https://img.shields.io/github/languages/code-size/FajarKim/bz2-shell?label=Download%20.zip&labelColor=302d41&color=b7bdf8&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzODQgNTEyIj48cGF0aCBmaWxsPSIjRDlFMEVFIiBkPSJNNjQgMEMyOC43IDAgMCAyOC43IDAgNjRWNDQ4YzAgMzUuMyAyOC43IDY0IDY0IDY0SDMyMGMzNS4zIDAgNjQtMjguNyA2NC02NFYxNjBIMjU2Yy0xNy43IDAtMzItMTQuMy0zMi0zMlYwSDY0ek0yNTYgMFYxMjhIMzg0TDI1NiAwek05NiA0OGMwLTguOCA3LjItMTYgMTYtMTZoMzJjOC44IDAgMTYgNy4yIDE2IDE2cy03LjIgMTYtMTYgMTZIMTEyYy04LjggMC0xNi03LjItMTYtMTZ6bTAgNjRjMC04LjggNy4yLTE2IDE2LTE2aDMyYzguOCAwIDE2IDcuMiAxNiAxNnMtNy4yIDE2LTE2IDE2SDExMmMtOC44IDAtMTYtNy4yLTE2LTE2em0wIDY0YzAtOC44IDcuMi0xNiAxNi0xNmgzMmM4LjggMCAxNiA3LjIgMTYgMTZzLTcuMiAxNi0xNiAxNkgxMTJjLTguOCAwLTE2LTcuMi0xNi0xNnptLTYuMyA3MS44YzMuNy0xNCAxNi40LTIzLjggMzAuOS0yMy44aDE0LjhjMTQuNSAwIDI3LjIgOS43IDMwLjkgMjMuOGwyMy41IDg4LjJjMS40IDUuNCAyLjEgMTAuOSAyLjEgMTYuNGMwIDM1LjItMjguOCA2My43LTY0IDYzLjdzLTY0LTI4LjUtNjQtNjMuN2MwLTUuNSAuNy0xMS4xIDIuMS0xNi40bDIzLjUtODguMnpNMTEyIDMzNmMtOC44IDAtMTYgNy4yLTE2IDE2czcuMiAxNiAxNiAxNmgzMmM4LjggMCAxNi03LjIgMTYtMTZzLTcuMi0xNi0xNi0xNkgxMTJ6Ii8%2BPC9zdmc%2B&style=for-the-badge)](https://github.com/FajarKim/bz2-shell/archive/refs/heads/master.zip)
</div>

# 설명
BZip2 Shell Exec은 특별히 설계된 도구로, 이 도구를 실행하면 다른 사람이 다시 코딩하거나 가져갈 염려 없이 모든 셸 파일 문자열을 BZip2 형식으로 암호화하거나 압축합니다. 암호화된 파일은 여전히 ​​셸 언어 명령으로 실행될 수 있습니다. 지원되는 쉘 언어의 종류는 Bourne Shell(sh), Bourne Again Shell(bash), Z Shell(zsh), Korn Shell(ksh), MirBSD Korn Shell(mksh)입니다.

> [!NOTE]
> 파일에 줄이 많을수록 암호화하는 데 시간이 더 오래 걸립니다.

> [!WARNING]
> 이 도구는 Ultrix와 같은 일부 Linux에서 호환되지 않거나 지원되지 않을 수 있습니다.

# 설치 지침
## Termux
Termux 앱에 BZip2 Shell Exec을 설치하는 방법은 다음과 같습니다!
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

그런 다음 `bzsh.sh` 파일을 실행하여 셸 파일 암호화를 시작합니다.
- ```shell
  bash bzsh.sh --help
  ```

`$PATH` 폴더에 설치하려면 `tools/Termux` 폴더에 있는 `install.sh` 파일을 실행하세요.
- ```shell
  tools/Termux/install.sh
  ```
  또는
- ```shell
  cd tools/Termux && bash install.sh
  ```

성공적으로 설치되면 다음 명령을 실행합니다:
- ```shell
  bzsh --help
  ```

다음 방법을 사용할 수도 있습니다:
<table>
    <tr>
        <td><div align="center"><b>메소드</b></div></td>
        <td><div align="center"><b>명령어</b></div></td>
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

또는 먼저 `install.sh` 스크립트를 다운로드한 후 실행할 수 있습니다:
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
Linux(예 Ubuntu)에 BZip2 Shell Exec을 설치하는 방법은 다음과 같습니다!
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

그런 다음 `bzsh.sh` 파일을 실행하여 셸 파일 암호화를 시작합니다.
- ```shell
  bash bzsh.sh --help
  ```

`$PATH` 폴더에 설치하려면 `tools/Linux` 폴더에 있는 `install.sh` 파일을 실행하세요.
- ```shell
  tools/Linux/install.sh
  ```
  또는
- ```shell
  cd tools/Linux && bash install.sh
  ```

성공적으로 설치되면 다음 명령을 실행합니다:
- ```shell
  bzsh --help
  ```

다음 방법을 사용할 수도 있습니다:
<table>
    <tr>
        <td><div align="center"><b>메소드</b></div></td>
        <td><div align="center"><b>명령어</b></div></td>
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

또는 먼저 `install.sh` 스크립트를 다운로드한 후 실행할 수 있습니다:
- ```shell
  apt install wget
  ```
- ```shell
  wget https://raw.githubusercontent.com/FajarKim/bz2-shell/master/tools/Linux/install.sh
  ```
- ```shell
  bash install.sh
  ```

# 사용 지침
이 도구는 여러 명령으로 실행되도록 프로그래밍되어 있습니다. 지원되는 명령:
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
        <td><div align="left"><code>--upgrade</code></div></td>
        <td><div align="left">이 도구의 버전을 업그레이드하세요</div></td>
    </tr>
    <tr>
        <td><div align="left"><code>--uninstall</code></div></td>
        <td><div align="left">이 도구 제거</div></td>
    </tr>
    <tr>
        <td><div align="left"><code>-t</code> 또는 <code>--type-shell</code></div></td>
        <td><div align="left">셸 유형 선택 (sh, bash, zsh, ksh, 또는 mksh)</div></td>
    </tr>
    <tr>
        <td><div align="left"><code>-f</code> 또는 <code>--file</code></div></td>
        <td><div align="left">대신 각 FILE 을 압축합니다</div></td>
    </tr>
</table>

이 도구를 실행하는 방법:
#### 예제 1
```shell
bzsh.sh -t bash -f FILE
```
또는
```shell
bzsh.sh --type-shell bash --file FILE
```
#### 예제 2
동시에 2개 이상의 파일을 암호화하고 싶다면 그렇게 할 수 있습니다.
```shell
bzsh.sh -t bash -f FILE1 FILE2 FILE3 etc...
```
또는
```shell
bzsh.sh --type-shell bash --file FILE1 FILE2 FILE3 etc...
```

## 특허
BZip2 Shell Exec은 다음 권한을 부여하는 AGPL-3.0 라이선스에 따라 출시됩니다.
 - 상업적 사용
 - 수정
 - 분포
 - 특허사용
 - 개인적인 사용

 더 복잡한 언어에 대해서는 [LICENSE](/LICENSE)를 참조하세요.

### 소셜 미디어 및 연락처
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
    <p>내 소셜 미디어를 팔로우하세요!</p>
</div>

### 기부하기
프로젝트가 마음에 드시나요? 개선을 위해 기부하는 것을 고려해 보세요!
<div align="left">
    <a href="https://github.com/sponsors/FajarKim/"><img src="https://img.shields.io/badge/GitHub-Sponsor-blue?s&labelColor=302d41&color=f5bde6&logo=github&logoColor=d9e0ee&style=for-the-badge" alt="GitHub Sponsor"></a>
    <a href="https://paypal.me/agusbirawan/"><img src="https://img.shields.io/badge/PayPal-Donate-blue?s&labelColor=302d41&color=f4dbd6&logo=paypal&logoColor=d9e0ee&style=for-the-badge" alt="PayPal Donate"></a>
    <a href="https://buymeacoffee.com/fajarkim/"><img src="https://img.shields.io/badge/Buy%20Me%20A%20Coffee-Donate-blue?s&labelColor=302d41&color=eed49f&logo=buymeacoffee&logoColor=d9e0ee&style=for-the-badge" alt="Buy Me a Coffee"></a>
    <a href="https://trakteer.id/FajarKim/"><img src="https://github.com/FajarKim/bz2-shell/assets/86386385/c1d4c7fe-90a4-4121-8ab7-2bfac61285f2" alt="Trakteer.id Donate"></a>
</div>

나에게 기부하여 프로젝트를 지원하는 것을 고려하고 계십니까? 이러지마 제발!!

[이 링크](https://fajarkim.github.io/donate)를 방문하여 도움이 필요한 사람들을 돕기 위해 소액을 기부해 주세요. 작은 기부가 큰 도움이 됩니다. ❤️

### 유사한 저장소
무료:
- [LZip Shell Exec](https://github.com/FajarKim/lzip-shell)
- [NCompress Shell Exec](https://github.com/FajarKim/nc-shell)
- [PreZip Shell Exec](https://github.com/FajarKim/prz-shell)
- [Blind Bash](https://github.com/FajarKim/blind-bash)

유급의 (후원자용):
- [GZip Shell Exec](https://github.com/FajarKim/gz-shell)
- [Lzma Shell Exec](https://github.com/FajarKim/lz-shell)
- [XZ Shell Exec](https://github.com/FajarKim/xz-shell)
- [Zstd Shell Exec](https://github.com/FajarKim/zstd-shell)

<div align="center">
  <img src="https://raw.githubusercontent.com/FajarKim/FajarKim/master/images/line.svg?sanitize=true"/>
</div>

<p align="center">❤️과 Shell로 제작</p>
<p align="center">Copyright © 2022-현재의 Rangga Fajar Oktariansyah</p>
<div align="center">
  <a href="LICENSE"><img src="https://img.shields.io/github/license/FajarKim/bz2-shell?label=License&labelColor=302d41&color=91d7e3&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCA2NDAgNTEyIj48cGF0aCBmaWxsPSIjRDlFMEVFIiBkPSJNMzg0IDMySDUxMmMxNy43IDAgMzIgMTQuMyAzMiAzMnMtMTQuMyAzMi0zMiAzMkgzOTguNGMtNS4yIDI1LjgtMjIuOSA0Ny4xLTQ2LjQgNTcuM1Y0NDhINTEyYzE3LjcgMCAzMiAxNC4zIDMyIDMycy0xNC4zIDMyLTMyIDMySDMyMCAxMjhjLTE3LjcgMC0zMi0xNC4zLTMyLTMyczE0LjMtMzIgMzItMzJIMjg4VjE1My4zYy0yMy41LTEwLjMtNDEuMi0zMS42LTQ2LjQtNTcuM0gxMjhjLTE3LjcgMC0zMi0xNC4zLTMyLTMyczE0LjMtMzIgMzItMzJIMjU2YzE0LjYtMTkuNCAzNy44LTMyIDY0LTMyczQ5LjQgMTIuNiA2NCAzMnptNTUuNiAyODhINTg0LjRMNTEyIDE5NS44IDQzOS42IDMyMHpNNTEyIDQxNmMtNjIuOSAwLTExNS4yLTM0LTEyNi03OC45Yy0yLjYtMTEgMS0yMi4zIDYuNy0zMi4xbDk1LjItMTYzLjJjNS04LjYgMTQuMi0xMy44IDI0LjEtMTMuOHMxOS4xIDUuMyAyNC4xIDEzLjhsOTUuMiAxNjMuMmM1LjcgOS44IDkuMyAyMS4xIDYuNyAzMi4xQzYyNy4yIDM4MiA1NzQuOSA0MTYgNTEyIDQxNnpNMTI2LjggMTk1LjhMNTQuNCAzMjBIMTk5LjNMMTI2LjggMTk1Ljh6TS45IDMzNy4xYy0yLjYtMTEgMS0yMi4zIDYuNy0zMi4xbDk1LjItMTYzLjJjNS04LjYgMTQuMi0xMy44IDI0LjEtMTMuOHMxOS4xIDUuMyAyNC4xIDEzLjhsOTUuMiAxNjMuMmM1LjcgOS44IDkuMyAyMS4xIDYuNyAzMi4xQzI0MiAzODIgMTg5LjcgNDE2IDEyNi44IDQxNlMxMS43IDM4MiAuOSAzMzcuMXoiLz48L3N2Zz4%3D&style=for-the-badge" alt="License"></a>
</div>
