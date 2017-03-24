---
layout: post
title: "fluent-plugin-sflow でっちあげた"
date: 2017-03-24 19:13:10 +0900
comments: true
categories: 
  - tech
---

[fluent-plugin-sflow](https://github.com/enukane/fluent-plugin-sflow)


JuniperやAlaxala, NEC製品などでサポートされているsFlowプロトコルのサンプルを受信するFluentdプラグインを書きました。

netflowプロトコルについては repeatedly さんが既に[fluent-plugin-netflow](https://github.com/repeatedly/fluent-plugin-netflow)を公開されています。
今回NECのIXシリーズからフローデータを送りつけたいという要望が某所であったため、実装してみました。
とはいえsflowのプロトコルを捌く部分は別の方のパーサに頼っています。


# 使い方

fluent-gemやtd-agent-gemでインストールするだけです。

```
% fluent-gem install fluent-plugin-sflow
```


設定項目は以下の通りです。 待ち受けアドレス(bind)、待ち受けポート(port)そしてタグ名ぐらいしかありません。

```
<source>
  @type sflow
  tag sflow.example

  bind 0.0.0.0
  port 6343
</source>

<match sflow.example>
  @type stdout
</match>
```


# host-sflow と組み合わせたテスト

実際のテストにはスイッチやルータが必要ですが、手元で簡単に試すために [host-sflow](http://www.sflow.net/) を導入します。
ここではMac OS X (MacBookPro)上に導入しWi-Fiのインタフェース(en0)のデータをサンプリング、先に挙げた設定で同一ホスト上で動作するfluentdに投げ込んでみます。

```
% git clone https://github.com/sflow/host-sflow.git
% cd host-sflow

% make

# pcap のターゲットデバイスとして en0 を指定する
% cat > /tmp/test.conf
sflow {
	polling=10
	collector { ip = 127.0.0.1 udpport=6343 }
	pcap { dev=en0 }
}
^D

# host-sflowの起動(デバッグ目的で -dddd としている)
% sudo ./src/Darwin/hsflowd -dddd -f /tmp/test.conf
```



fluentdの標準出力をしばらく眺めていると、以下の様にフローサンプルが出力されます。この時は \*.twttr.com (twitter) への通信がキャッチされたようです。

```
% fluentd -vv -c example/fluentd.conf
(中略)
2017-03-24 18:52:50.054347000 +0900 example.sflow: {"agent_address":null,"i_octets":0,"o_octets":0,"interface":6,"input_packets_error":0,"output_packets_error":0}
2017-03-24 18:52:52.519715000 +0900 example.sflow: {"agent_address":null,"sampling_rate":"400","i_iface_value":0,"o_iface_value":0,"ipv4_src":"199.59.148.241","ipv4_dst":"192.168.10.17","udp_src_port":1900,"udp_dst_port":57347,"frame_length":1486,"frame_length_multiplied":594400,"tcp_src_port":443,"tcp_dst_port":58076}
2017-03-24 18:53:01.984184000 +0900 example.sflow: {"agent_address":null}
2017-03-24 18:53:09.934539000 +0900 example.sflow: {"agent_address":null,"i_octets":0,"o_octets":0,"interface":6,"input_packets_error":0,"output_packets_error":0}
(中略)
```

ネットワーク機器にてよく見られるカウンタサンプルとフローサンプル以外にも、host-sflowはOSやアプリケーションの各種メトリックを集めsFlowプロトコルに載せて送信します。
現状の fluent-plugin-sflow ではカウンタ/フローサンプルのパースしかサポートしていないため、それらのメトリックは空扱いになります(上記5行目)。



# ToDo

- bindata 1.8.1以上への対応
  - 現状 Sflow5rawpacketdataVLAN の type メンバが BinData::Record あたりで定義されてる名前と被ってるらしく怒られるので、1.8.1にしている
  - [fluent-plugin-netflow](https://github.com/repeatedly/fluent-plugin-netflow)は2.5.3ベースであり、こちらと揃えたい
  - 名前の変更にはおそらく次の項目をクリアする必要がある
- パーサーの取り込み
  - 現状、[NETWAYS/sflow](https://github.com/NETWAYS/sflow/)のパーサをリポジトリごと丸っと使っている
  - ライセンスとオリジナルを明記した上でパーサとモデルの部分だけコピーしてくる
  - または全部1から書き直す
- IPv6対応

