---
layout: post
title: "貧乏人でもスペアナがしたい!"
date: 2015-05-01 12:51:00 +0900
comments: true
categories: 
  - tech
  - 802.11
  - RF
---

## 貧乏人でもスペアナがしたい!(掲題ママ)

新品を買うと, 数十万〜数百万だし, ヤフオク等の中古品でも明らかなジャンク品でないものに限ったとしても十〜数十万ぐらいは行ってしまう.


やりたいことができて, こわしても気落ちしない程度のモノが欲しいので探してみたメモ.


やりたいことベースでのおおよその要件は以下の通り
(貧乏人にしては盛りすぎだ!生意気だ!等のコメントはNO)


* (MUST) 無線LANの周波数帯がカバーできること
  * 2.4 & 5GHz帯
* (MUST) PCと連携できること
  * (SHOULD) 外部のスクリプト等で扱える形式でデータがエクスポートできること
  * (MAY) あるいは, 独自形式でもかまわないが仕様が公開されていること
* (MUST) 数十万円後半は絶対にNO
  * 10〜20万ぐらいが限度
* (MAY) RBW と sweeptimeの両立がそこそこ成り立つこと
  * (MAY) できれば20/40MHzスパンに対して200〜300kHzのRBWで数百ms程度が望ましい (秒はかからない程度であれば)
* (MAY) できれば普通のスペアナと同じような汎用性
  * スペアナのお勉強用に使えること
* (MAY) Mac向けのアプリがあること
  * (MAY) あるいはUNIX系からアクセス可能なインタフェース(ライブラリ/API etc)が用意されていること
* (MAY) USBバスパワーで動くこと
* (MAY) 携帯可能な電源仕様, 形状, 重さであること

おおよそ2つの側面があって, きちんとしたスペアナ買ってお勉強したいというのと, 今までやってきている無線LANキャプチャに織り交ぜたいという2つの方向からの要求が混ざっている. 分けた方がいいような気はする.


## 候補になりそうな人たち

中古のスペアナをヤフオクで探すのは継続するとして, ハンディに使えそうな子達.

- Giga ST
- RF Explorer 6G Combo
- Aaronia AG
  - SPECTRAN HF-6060V4
  - SPECTRAN HF-6060V4 X
- Metageek WiSpy DBx
- Signal Hound
  - USB-SA124B
  - BB60C
- Tektronix RSA306

|機種|お値段|周波数レンジ|RBW|スイープ時間|アプリ対応OS| export可? |
|:---|-----------:|:----------:|:-----------|
|GigaSt v5c|29,000 (税, 送料込み)|3 - 12000MHz|15/30/180 KHz|500ms? (SPAN:100MHz, RBW:180KHz)|Windows| 形式不明 |
|RF Explorer 6G Combo|43,800 (税込み)|15 - 2700MHz, 4850 - 6100 MHz| 2.6 - 812 kHz | 200ms? (Span: 60MHz, 600KHz) |Windows, Mac(?) | XML/CSV |
|SPECTRAN HF-6060V4| €999.95 (129,384) | 10MHz - 6GHz | 3kHz - 50MHz | 200ms (Span: 20MHz, RBW: 300kHz) | Windows, Linux, Mac | CSV |
|SPECTRAN HF-6060V4 X| €999.95 (129,384) | 10MHz - 6GHz | 3kHz - 50MHz | 200ms (Span: 20MHz, RBW: 300kHz) | Windows, Linux, Mac | CSV |
|WiSpy DBx| $1,149 (136,834) | 2.4GHz帯, 5GHz帯 | 500ms (Span: 95MHz, RBW: 333KHz) | 500ms or 1s ? |Windows, Mac | sqlite DB |
|USB-SA124B| $1,995 (238,386) | 100kHz - 12.4GHz | 100Hz - 250KHz, 6MHz | | Windows | ? |
|BB60C| $2,879 (342,860) | 9kHz - 6GHz | 10khz | 24GHz/sec | Windows | ? |
|RSA306|434,000|9kHz - 6.2GHz| 10Hz - 10MHz | 100us (Span: 400MHz, RBW: 300KHz) | Windows | CSV |

### 諸々の前提

- とりあえず無線LANターゲットなので, スパンとして20/40/80/160MHzがありうる
    - OFDMの各キャリアは312.5KHz間隔
- RBWと掃引時間の関係: sweeptime [s] = (k * span [Hz]) / (RBW [Hz])^2
    - 掃引時間はRBWの二乗に反比例
    - 掃引時間は周波数スパンに比例

## 候補
### GigaSt v5c

- 参考
    - http://www.wa.commufa.jp/gigast/GigaSt5/GigaSt-v5.html
    - https://www.youtube.com/watch?v=3vLZrA0e8EY

- Pros
    - 安い! (送料込みで3万円以下)
    - USBバスパワー駆動
    - 内部的にはシリアル(VCP) & コントロール等々のドキュメントはそろってるので他OSでも触るのは簡単そう
- Cons
    - ケースはないので自分で用意
    - 「グラフデータ保存機能」でどんな形式がサポートされてるか
    - 注文ウィンドウがよく分からない (受付してない時期がある?)

## RF Explorer 6G Combo / WiFi Combo

- 参考
  - http://rfexplorer.com/combo-specs/
  - https://www.youtube.com/watch?v=3ZhdcUJanCI


- Pros
  - コンパクト
  - そこそこお安い(5万内)
  - 千石電商でも売っているので手には入れやすい
  - デバイスにLCDがついてる
  - バッテリー付き(16時間+ぐらいは動くらしい)
  - こちらも内部的にはシリアルっぽいのでコマンド叩けばいろいろ遊べる ([rfexplorer](https://code.google.com/p/rfexplorer/))
- Cons
  - 2700MHz〜4850MHzの間は計測不可
    - とはいっても今のところ使い道はない
  - 基本となるアプリ([touchstone](http://rfexplorer.com/touchstone/))は無料だけど, 一部のアプリが有料 ($49)
    - 有料版(PRO)でないとxml/csvへのエクスポート機能がない

## Aaronia SPECTRAN HF-6060V4 / HF-6060V4 X

- 参考
    - [SPECTRAN HF-6060 V4](http://www.aaronia.com/products/spectrum-analyzers/HF-6060-V4-RF-Spectrum-Analyzer/)
    - [SPECTRAN HF-6060 V4 X](http://www.aaronia.com/products/spectrum-analyzers/HF-6060-V4-X-USB-remote-Analyzer/)

V4はいわゆるハンドヘルド版で, V4 Xがデスクトップ向け.

- Pros
  - [MCS](http://www.aaronia.com/products/software/)なるアプリが無料, Win/Mac/Linuxをそれぞれサポートしてる
  - V4ハンドヘルド版は単体で動作可能
  - サポートしてる周波数帯は基本的に連続 (どこかで途切れてる可能性はあるが)
  - 悪くない価格 (11万程度)
- Cons
  - V4 XがUSBバスパワーだけでは動かない. 動いたら完璧だったのに...
    - モバイルバッテリーでは無理だろうが, DCなバッテリー + 電源ケーブル調達でなんとかなりそうではある
  - V4ハンドヘルド版の動作時間は?
  - V4とV4 Xの機能面での差は?
    - LCD, ジョグダイヤルの有無
    - 付属アンテナ: 
    - HyperLOG EMC directional LogPer antenna: 7060 vs なし
    - OmniLOG 90200 radial isotropic antenna: なし vs あり
    - Xのみ: マーカの数unlimited, 複数デバイス操作可, スイープポイント無限等々
      - Xの方にだけPRO版ソフト?とやらが付いてくるらしいが?


## WiSpy DBx

- 参考
    - [WiSpy](http://www.metageek.com/products/wi-spy/)

「無線LAN & スペアナ」でググると一番最初に出てくるデファクトスタンダード品みたいなもの.

- Pros
  - 無線LANに特化
    - AP(SSID)一覧との紐付けが標準で存在している
    - 「チャネル:周波数」の変換
  - Macのアプリがある (Channalyzer)
  - kismetが出してる[spectools](https://www.kismetwireless.net/spectools/)を使えばLinuxでも動きそう
- Cons
  - スペアナと見たときに, 細かいことがあまりできない
    - 細かいパラメータがいじれない
    - 無線LAN以外にはあまり使えなさそう
      - 無線LAN特化のスペアナという立ち位置
      - 現状無線LAN以外に使う予定はないが, 勉強用なので諸々のパラメータは弄りたい
    - 5GHz帯は細かくチャネルごとに見れない
      - 2.4GHz帯はチャネル毎に見れる
  - その割には値段が高い (13万ぐらい)


スイープの性能については以下の通り. 見てる幅により固定になっている.

- 2.4GHz 全体
  - Span: 95.310MHz ( 2400 - 2495 MHz )
  - RBW: 333.3 KHz
  - スイープ時間: 500ms?
- 2.4GHz各チャネル (例としてチャネル 1)
  - Span: 424MHz ( 2400 - 2424 MHz )
  - RBW: 100kHz
  - スイープ時間: 500ms?
- 5GHz
  - Span: 676.7 MHz ( 5160 - 5836 MHz )
  - RBW: 150.0 KHz
  - スイープ時間: 1s?


## Signal Hound USB-SA124B / BB60C

- 参考
    - [BB60C](https://signalhound.com/products/bb60c/)
    - [USB-SA124B](https://signalhound.com/products/usb-sa124b/)
    - [BBC60 Demo and Remote](https://www.youtube.com/watch?v=OWrp4M-T2r0)
    - [SA-Series Videos](https://www.youtube.com/playlist?list=PL3IOktxB0nG5baFmDHwiZrb284akt6n9K)


- Pros
  - スぺアナというよりはHackRFとかUSRPみたいなSDRデバイス + スペアナができるアプリという感じ
  - BB60Cに至っては24GHz/sec sweep speed (>= 10kHz RBW)
- Cons
  - お値段は微妙 (RSA306に手が届きそうな値段)
  - スペアナというよりSDR. これかうならHackRF買った方がよさそうな気はする.

## Tektronix RSA306

- [RSA306型USBスペクトラム・アナライザ](http://jp.tek.com/spectrum-analyzer/rsa306-0)


Tektronixが出した「USBリアルタイムスペクトラムアナライザ」

- Pros
  - 反応めっちゃはやい
    - 40MHz幅内ならRBW 120KHzぐらいまでならだいぶぬるぬる表示する
  - ソフトはタダ (基本部分は, という条件付きだが)
  - USB3.0ポート一つで制御・電源供給
- Cons
  - お値段
    - とはいえこの性能比で考えれば破格. 単純に予算の問題

