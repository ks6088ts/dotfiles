# マニュアルセットアップ

- タッチパッド設定 > スクロール方向(ダウンモーションで下にスクロール)
- [ctrl2cap](https://docs.microsoft.com/en-us/sysinternals/downloads/ctrl2cap) で CapsLock を Ctrl に変更
- エクスプローラーの拡張子・隠しファイル表示
- 「テーマと関連項目の設定」でダークモードに
- アプリのインストール
  - Google Chrome
    - Extensions
      - Octotree - GitHub code tree
      - Google 翻訳
      - Vimium
      - Keepa
      - crxMouse Chrome™ Gestures
  - Docker Desktop for Windows
  - Visual Studio Code
  - SourceTree
  - Adobe Acrobat Reader DC
  - [Everything](https://www.voidtools.com/downloads/)
  - [Directory Opus](https://www.gpsoft.com.au/)
- Microsoft Store
  - LINE
  - Windows Terminal
  - Ubuntu 20.04
- [WSL2 のセットアップ](https://docs.microsoft.com/ja-jp/windows/wsl/install-win10)
  - [WSL2によるホストのメモリ枯渇を防ぐための暫定対処](https://qiita.com/yoichiwo7/items/e3e13b6fe2f32c4c6120)
- スクリプトの実行
  - VS Code 拡張のインストール: [scripts/install-vscode-extensions.sh](../scripts/install-vscode-extensions.sh)

# Windows Terminal セットアップ

## zsh セットアップ
1. Microsoft Store から Ubuntu 20.04, Windows Terminal をインストール
2. Ubuntu を起動して `make -f ubuntu.mk install` でツール群をインストール
3. `chsh -s /bin/zsh` でデフォルトシェルを zsh に切り替え

## CLI セットアップ
1. `ssh-keygen -t rsa` で鍵ペアを作成
2. `GitHub` に公開鍵を登録
3. `gh auth login` で GitHub CLI を設定
4. `aws configure` で AWS CLI を設定(~/.aws/credentials|config が生成される)
5. `soracom configure` で SORACOM CLI を設定(~/.soracom/default.json が生成される)

# トラブルシュート

**ls: cannot access '/mnt/c': Input/output error #4377**
`wsl.exe --shutdown` で再起動します。
