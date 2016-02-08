---
layout: post
title: "2015-02-23 Released embulk-input-pcapng-files 0.1.0"
date: 2015-02-24 09:07:52 +0900
comments: true
categories: 
  - tech
---

pcapngファイルを読み込むembulk inputプラグインの新しいのをリリースしました.

- [embulk-input-pcapng-files](https://rubygems.org/gems/embulk-input-pcapng-files)
- [enukane/embulk-input-pcapng-files](https://github.com/enukane/embulk-input-pcapng-files)

embulk 0.4.X系ではプラグイン体系が0.3.X系のそれとは異なっているため,
これまで晒していた[embulk-plugin-input-pcapng-files](https://rubygems.org/gems/embulk-plugin-input-pcapng-files)
が動作しません. これを修正したものが上記になります.


使い方自体は変わらず, 以下の様なconfig.ymlを書いて実行すると...

```
exec: {}
in:
  type: pcapng_files
  paths: [ /Users/enukane/Desktop/emtestpcap/ ]
  threads: 2
  schema:
    - { name: frame.number,                 type: long }
    - { name: frame.time_epoch,             type: long }
    - { name: frame.len,                    type: long }
    - { name: radiotap.length,              type: long }
    - { name: radiotap.mactime,             type: long }
    - { name: radiotap.flags.preamble,      type: long }
    - { name: radiotap.flags.wep,           type: long }
    - { name: radiotap.flags.fcs,           type: long }
    - { name: radiotap.flags.shortgi,       type: long }
    - { name: radiotap.datarate,            type: long }
    - { name: radiotap.channel.freq,        type: long }
    - { name: radiotap.channel.type.ofdm,   type: long }
    - { name: radiotap.dbm_antsignal,       type: long }
    - { name: radiotap.dbm_antnoise,        type: long }
    - { name: radiotap.xchannel,            type: long }
    - { name: radiotap.xchannel.freq,       type: long }
    - { name: radiotap.xchannel.type.ofdm,  type: long }
    - { name: radiotap.mcs.gi,              type: long }
    - { name: radiotap.mcs.bw,              type: long }
    - { name: radiotap.mcs.index,           type: long }
    - { name: wlan.fc.type_subtype,         type: long }
    - { name: wlan.ta,                      type: string }
    - { name: wlan.ra,                      type: string }
    - { name: wlan.sa,                      type: string }
    - { name: wlan.da,                      type: string }
out:
  type: mysql
  host: localhost
  user: testuser
  password: testpassword
  database: testdb
  table: testtb
  mode: insert

```

こんな感じにoutput先 (今回の場合はMySQL) にデータをはき出してくれます.

![pcapng-mysql](/images/2015-02-23-pcapngmysql.png)


