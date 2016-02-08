---
layout: post
title: "SIGCOMM2015: Large-scale Measurements of Wireless Network Behavior を読む"
date: 2015-08-28 09:10:56 +0900
comments: true
categories: 
- tech
- research
- 802.11
---

## 概要

リンク: http://conferences.sigcomm.org/sigcomm/2015/pdf/papers/p153.pdf

- SIGCOMM '15で発表された論文。Cisco Merakiの人たちが著者。
- Merakiはいわゆるクラウド型無線LANコントローラとAPのセットのサービス。
- 自社のサービスを展開している中で収集されたデータのオーバービュー的な文章。

### 読んだモチベーション

- Wireless Network という題に惹かれて
- お仕事で似た様なことやってるため

## 内容

[落合先生フォーマット](http://lafrenze.hatenablog.com/entry/2015/08/04/120205)に従って並べてみる

### どんなもの？

- Merakiのサービスを提供するに当たって収集したデータの分析を行った
  - 2万台のMeraki AP, 2万個のネットワーク, 5百万クライアント/week の規模
  - これらのネットワークにぶら下がる数百万のデバイスの様々な情報が自社のDBに溜まっている
    - ネットワークに所属するデバイスたち: AP, クライアント端末(ノートPC, スマホ e.t.c), スイッチ, ルータ など
    - 情報: 接続断のイベント, 通信先 など
    - Meraki(のサービス側)は, いわゆる無線LANコントローラなのでこれらの情報を常にpolling/収集している
- これだけ規模が大きく, 期間も長いと"無線LANネットワークのトレンド"的なものが見えてくる
  - 電波的な傾向
    - 他のAP or 802.11以外の干渉
  - 規格上の傾向
    - 2.4 or 5GHz帯への偏り
    - 802.11g, a, n, acの偏り(利用率の変化)
    - チャネル幅の遷移
    - ストリーム数の遷移
  - クライアントの傾向
    - OSのバリエーション
    - 信号強度
  - ネットワークの傾向
    - いわゆる普通のトラフィック分析
    - アプリケーション利用率

### 先行研究と比べて何がすごい？何が違う？

- まず数
  - Gemberら(当該研究者が所属する大学ネットワークや施設のネットワークが対象)、Rodrigら(カンファレンスネットワークが対象)等、干渉の計測やネットワークトラフィックの分析を行った研究は存在する。この論文では、さらに大規模なユーザベースでの分析を行っている。
  - Hotspotを対象にそこそこの規模で行った例としては Ghoshら(243000デバイス)、Google (500AP, 30000クライアント)等があるがこれらはあくまでHotspot向けであり、この論文(およびMerakiのサービス)が対象としているオフィス/キャンパスユースではない
- 計測期間の長さ (とそこから来るデータ量)
  - おもに他の研究ではショットないし1年内程度のスパンで行ったものが主
    - 短いスパンであれば、個々の技術・計測に関する分析を行った既存研究は多種存在する
    - 干渉の定性的分析や規格の技術的妥当性の検証という観点で
  - この論文では5年程度のスパンで見ている
    - "トレンド"という点に着目できる内容になっている
    - さらに取得した、サービスの継続にあたって重要な無線LANインフラ(!=無線LAN only)の情報を分析対象としている

### 技術の手法とかキモはどこ？

- サービスのプロダクション環境に当該情報収集系を組み込んだところ
  - いわゆる"実用"の場でのデータが取れる
  - お客さんのバリエーション == "実用”の度合い に直結する
- 観点として「サービスの継続性」のための情報収集に特化しているところ
  - 個々の規格・技術の妥当性検証というよりは、その現れ方・利用され方の観測が主

### どうやって有効だと検証した？

- Evaluationとして有効性を示す文章はない
- 強いて言えば実環境でこんな感じのデータが取れたぜ！という報告に近い?

### 議論はある？

- (TBD)

### 次に読むべき論文は？

- GamberらのとGoogleのやつ？
  - A. Gember, A. Anand, and A. Akella. A comparative study of handheld and non-handheld traffic in campus wi-fi networks.
  - M. Afanasyev, T. Chen, G. M. Voelker, and A. C. Snoeren. Usage patterns in an urban wifi network
- Senらの"Cspy: finding the best quality channel without probing"も気になる
  - S. Sen, B. Radunovic, J. Lee, and K.-H. Kim. Cspy: finding the best quality channel without probing. 
