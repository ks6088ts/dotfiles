# Jetson Nano セットアップ

0. (AC アダプタを使用して電源供給する場合 J48 ヘッダにジャンパピンを取り付ける)
1. SD Card Formatter でマイクロ SD カードをフォーマット
2. balena Etcher で JetPack を書き込み
3. 初回 GUI 起動後、`settings>Wi-Fi>IPv4 Method` を `Manual` にして Address, Netmask, Gateway を指定。`sudo reboot` で再起動(Gateway はルータの IP アドレス)
4. 公開鍵 SSH 接続設定を行う

```bash
# ホストマシン側 ---
# 秘密鍵・公開鍵の作成(作成済であれば skip)
ssh-keygen -t rsa

# 公開鍵ファイル転送
scp ~/.ssh/id_rsa.pub <USER>@<IP_ADDRESS>:~/

# パスワードでターゲットに SSH 接続
ssh <USER>@<IP_ADDRESS>

# ターゲット側 ---
mkdir -p ~/.ssh
cat id_rsa.pub >> ~/.ssh/authorized_keys
```
5. ツール群をインストール

```bash
git clone https://github.com/ks6088ts/dotfiles-windows.git
cd dotfiles-windows
make install
# TODO: シェルスクリプトの実行回りに問題があるため、ターゲットボード環境にも Ansible をインストールしてしまっている。
# 本来はホスト PC 上で inventories/hosts に固定した ip アドレスを追加して `make install-playbook` を実行したい
```

# 各種セットアップ

[jetson.mk](./jetson.mk) を参照してください。
