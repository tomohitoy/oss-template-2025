# CFS (Completely Fair Scheduler)

## 説明

CFS（Completely Fair Scheduler）は、Linuxカーネルで採用されているプロセススケジューリング方式で、すべてのプロセスに「公平なCPU時間」を与えることを目的としています。CFSは従来の優先度ベースのスケジューラとは異なり、厳密なタイムスライスを使用せず、各プロセスがどれだけCPUを利用したか を記録し、その値が小さいプロセスから順に実行させる仕組みです。これにより、重い処理や軽い処理に関係なく、全プロセスが偏りなくCPUを使えるようになります。また、CFSは「赤黒木」というデータ構造で実装されており、CPU使用量が最も少ないプロセスを効率よく選び出せる点も特徴です。結果として、応答性と安定性を保ちながら、同時に多くのプロセスを扱う環境でも公平性を維持できるスケジューラになっています。

## 参考文献

Linux Kernel Documentation – Scheduler（https://www.kernel.org/doc/html/latest/scheduler/index.html）

Red Hat Developer – How the Completely Fair Scheduler works（https://developers.redhat.com）

## 作成者

- 氏名: 萩原大城
- 学籍番号: G384722023
- 作成日: 2025-11-15
- 最終更新日: 2025-11-15