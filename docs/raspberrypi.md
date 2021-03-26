# Raspberry Pi

## セットアップ

1. [Raspberry Pi Imager](https://www.raspberrypi.org/software/) で Raspberry Pi OS (32bit) を SD カードに書き込む。
2. [SSH サービス有効化と Wi-Fi の事前設定](https://soracom.jp/recipes_index/4171/#microSD__SSH_Wi-Fi) を行う。具体的には、以下 2 つのファイルを microSD の “boot” にコピーする。

```bash
# wpa_supplicant.conf
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
country=JP
update_config=1
network={
    ssid="YOUR_WIFI_AP_SSID1"
    psk="password1"
}
network={
    ssid="YOUR_WIFI_AP_SSID2"
    psk="password2"
}
# 空ファイル `ssh` を作成
```

3. `sudo raspi-config` で設定変更
- CLI 起動: System Options > Boot > Console
- Interface Options > SSH/VNC/I2C/SPI

## ツールをインストール

1. [公開鍵 SSH 接続設定を行う](./jetson-nano.md) を参照し、
公開鍵認証を使って ssh 接続できるようにする。
2. `inventories/hosts` を編集
```
# inventories/hosts
192.168.3.10 ansible_user=pi
```
3. ホスト PC から `make -f ubuntu.mk install-playbook` でインストール
