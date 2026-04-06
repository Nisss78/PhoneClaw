<div align="center">

![banner](assets/banner.jpg)

**iPhoneでローカル実行するプライベートAIエージェント**  
インターネット不要、データ送信なし、完全オフライン動作

![Swift](https://img.shields.io/badge/Swift-5.10-orange?style=flat-square)
![iOS](https://img.shields.io/badge/iOS-17%2B-blue?style=flat-square)
![License](https://img.shields.io/badge/License-Apache%202.0-green?style=flat-square)

[English](README_EN.md) · [中文](README.md) · [バグ報告](https://github.com/Nisss78/phoneclaw/issues) · [機能リクエスト](https://github.com/Nisss78/phoneclaw/issues)

</div>

<div align="center">

[主な機能](#主な機能) · [内蔵Skill](#内蔵skill) · [クイックスタート](#クイックスタート) · [カスタムSkill](#カスタムskill) · [FAQ](#よくある質問) · [今後の計画](#今後の計画)

</div>

## デモ動画

<div align="center">
  <video src="https://github.com/user-attachments/assets/be57bb84-ef68-406f-9dd2-5e214db1b191" width="100%" height="auto" controls autoplay loop muted></video>
</div>

**PhoneClaw**はiPhone上でローカル実行されるAIエージェントです。Gemma 4を使用してデバイス上で推論を完結し、クラウドに依存せず、チャット内容をアップロードしません。

## 2026-04-07 アップデート

- 音声機能を追加：録音・送信対応、音声内容の分析・認識が可能に
- 思考モードを追加：チャット画面右上からオンデマンドで有効化可能
- メモリ管理と推論予算を最適化：長文回答、マルチモーダル、モデル切り替え時の安定性を向上

## 2026-04-06 アップデート

- デフォルトのインストール方法を「空壳インストール」に変更：モデルはデバイス上でオンデマンドダウンロード
- 設定ページでモデルダウンロード、権限確認、日英名称表示に対応
- 連絡先、リマインダー、カレンダー、デバイス情報、クリップボードの連携を安定化

---

## 主な機能

**画像理解（マルチモーダル）**  
カメラ撮影やフォトライブラリから画像を選択して質問。コンテンツの識別、チャートの解読、シーンの説明が可能。推論はすべてデバイス上で完結し、写真がスマホを離れることはありません。

**ファイルベースのSkillシステム**  
各機能はMarkdownファイル（SKILL.md）に対応。新規追加や修正にアプリの再コンパイルは不要。Skillの記述は言語非依存で、誰でも直接記述・配布可能。

**完全オフライン＆プライバシー保護**  
すべての推論をスマホ上で完結。デフォルトでネットワーク接続を確立しない。チャット内容、画像、個人データはアップロードされず、第三者サーバーを経由しない。

**柔軟なモデル管理**  
Gemma 4 E2BとE4Bの2サイズに対応。デバイス上で直接ダウンロード可能。ビルド時にアプリ内パッケージングも可能。モデル切り替え、システムプロンプト編集を内蔵。iPhoneのメモリ制限に対応したキャッシュクリアと履歴トリミングを実装。

---

## 内蔵Skill

**カレンダー**  
自然言語でカレンダーイベントを作成。タイトル、時間、場所の指定に対応。

> 「明日の午後2時に、ハイテクパークで会議があるからカレンダーに追加して」

**リマインダー**  
時限リマインダーを作成。指定時刻にシステム通知を表示。

> 「今夜8時に上司に資料を送るのをリマインドして」

**連絡先**  
連絡先の保存・更新。名前、電話番号、会社、メール、メモに対応。電話番号で自動重複排除。

> 「王社長の電話番号13812345678を保存して、バイトダンスの」

**クリップボード**  
システムクリップボードの読み書き。マルチステップタスクのデータ中継として利用可能。

> 「さっきの文章をクリップボードにコピーして」

**デバイス情報**  
デバイス名、OSバージョン、利用可能メモリ、プロセッサ数などを照会。

> 「このスマホのデバイス情報は？」

**テキスト処理**  
ハッシュ計算、テキスト反転などの基本テキストツール。

> 「この文章のMD5を計算して」

---

## クイックスタート

### 環境要件
- macOS + Xcode 16
- iOS 17以上
- CocoaPods
- 実機 + Apple ID

### モデル対応表

| モデル | 推奨用途 |
|--------|----------|
| Gemma 4 E2B | より安定。デフォルト配布向き。A16以上 |
| Gemma 4 E4B | より高精度。iPhone 15 Pro以上を推奨 |

### 1. プロジェクトをクローン

```bash
git clone https://github.com/Nisss78/phoneclaw.git
cd phoneclaw
```

### 2. 依存関係をインストール

```bash
pod install
```

### 3. モデルインストール方法を選択

**方法A（推奨）— 空壳インストール、デバイス上でダウンロード**

Xcodeでアプリをインストール後、「モデル設定」からE2BまたはE4Bをデバイス上で直接ダウンロード。デフォルトでは`Models/`のファイルをパッケージに含めないため、インストールサイズが小さく、インストールも高速。

**方法B — E2Bをアプリにパッケージング**

1. PCでモデルを`Models/gemma-4-e2b-it-4bit`にダウンロード（Hugging Face CLIを推奨）：

```bash
brew install hf
mkdir -p ./Models/gemma-4-e2b-it-4bit
hf download mlx-community/gemma-4-e2b-it-4bit --local-dir ./Models/gemma-4-e2b-it-4bit
```

2. Xcodeの`Build Phases > Copy Bundle Resources`でモデルディレクトリを手動追加
3. `LLM/MLXLocalLLMService.swift`の`availableModels`を修正し、配布するモデルのみ残す

> E2Bは約3.58 GB、E4Bは約5.22 GB。`Models/`は`.gitignore`に含まれ、リポジトリにコミットされません。

**方法C — E2B + E4Bを同時にパッケージング**

両モデルをダウンロード：

```bash
brew install hf
mkdir -p ./Models/gemma-4-e2b-it-4bit ./Models/gemma-4-e4b-it-4bit
hf download mlx-community/gemma-4-e2b-it-4bit --local-dir ./Models/gemma-4-e2b-it-4bit
hf download mlx-community/gemma-4-e4b-it-4bit --local-dir ./Models/gemma-4-e4b-it-4bit
```

両モデルフォルダをXcodeの`Copy Bundle Resources`にfolder referenceとして追加。

### 4. プロジェクトを開く

```bash
open PhoneClaw.xcworkspace
```

> 必ず`.xcworkspace`を開いてください。`.xcodeproj`ではありません

### 5. 署名を設定して実行

1. PhoneClawターゲット → Signing & Capabilities
2. Teamを選択し、Bundle Identifierを自分のユニークな値に変更
3. iPhoneを接続し、⌘Rを押す

> 初回インストール後に証明書信頼のプロンプトが出た場合：設定 → 一般 → VPNとデバイス管理 → 信頼

### 6. 初回利用

- 右上のパズルピース：Skill管理
- 右上のスライダー：モデル設定 / システムプロンプト / 権限
- 空壳インストールの場合、先にモデル設定ページでモデルをダウンロードしてから権限を有効化し、以下を試す：

```
このスマホのデバイス情報は？
今夜8時に資料を送るのをリマインドして
王社長の電話番号13812345678を保存して
```

---

## カスタムSkill

新規Skillを追加する最も手軽な方法は、アプリディレクトリに`SKILL.md`を追加すること：

```
Application Support/PhoneClaw/skills/<skill-id>/SKILL.md
```

```yaml
---
name: MySkill
name-ja: マイ機能
description: このSkillの役割
version: "1.0.0"
icon: star
disabled: false

triggers:
  - キーワード1

allowed-tools:
  - my-tool-name

examples:
  - query: "ユーザーがこう言う"
    scenario: "このシチュエーションでトリガー"
---

# Skill指示

モデルにツールをいつ呼び出すか、パラメータをどう組織化するか、いつ直接回答するかを指示。
```

このSkillが実際にシステム機能を呼び出す必要がある場合、`Skills/ToolRegistry.swift`で対応ツールを登録。

---

## よくある質問

**インストール後に権限ダイアログが表示されないのはなぜ？**  
通常、対応するSkillが実際にシステムAPIを実行していないため。以前に一度拒否している場合、iOSは繰り返しダイアログを表示しない。システム設定で手動で有効化する必要がある。

**モデルを切り替えた後にロードに失敗するのはなぜ？**  
以下を確認：モデルディレクトリ名とコード内の`availableModels`が一致しているか。空壳インストールの場合、モデルのデバイス上でのダウンロードが完了しているか。内蔵配布の場合、そのモデルが実際にアプリパッケージに含まれているか。デバイスのメモリが十分か。

**リマインダーの作成に失敗するのはなぜ？**  
最新のコードは既存のリマインダーリストの再利用を試みる。システムに書き込み可能なリストがない場合、PhoneClawリマインダーリストを自動作成しようとする。それでも失敗する場合、通常はシステムのリマインダーソース自体が書き込み不可。

---

## 今後の計画

PhoneClawの次の方向性は、単に「ツールを追加する」だけでなく、真に実用的なローカルiPhoneエージェントへと段階的に進化させること。

### 1. より多くのiOSネイティブAPI拡張

- ファイル・ディレクトリ操作
- 写真の読み取り、整理、説明、検索
- メモ / Notes
- ローカル通知
- 地図 / 位置関連機能
- Safari / URLオープンとコンテキスト渡し
- 連絡先、カレンダー、リマインダーのより詳細な読み書き機能

### 2. より多くのSkill拡張

今後、すべてのロジックを巨大なプロンプトに詰め込むのではなく、より明確なSkillに分割していく。適切な拡張方向：

- ファイル管理
- 写真の理解と整理
- スケジュール計画
- 個人情報管理
- ローカル知識ベース検索
- 音声入力 / 音声読み上げ

### 3. より多くのローカルモデル連携

メインチャットモデルに加え、今後統合に適したローカルモデル：

- OCRモデル
- 音声認識モデル
- 音声合成モデル
- Embedding / Rerankerモデル
- より小さなツールパラメータ抽出モデル
- より強力な計画モデルまたはマルチモデル協調チェーン

これにより、PhoneClawは「1つの大規模モデルがすべてを行う」から「複数のローカルモデルが協調動作する」アーキテクチャへと進化。

### 4. クロスアプリ自動化

PhoneClawはデスクトップシステムのようにすべてのアプリを自由に操作できるとは仮定しない。iOSが実際に許可する機能を優先：

- App Intents / Shortcuts
- URL Scheme / Deep Link
- Share Sheet / 共有拡張
- クリップボード中継
- システム通知とウェイクアップ

より現実的な目標：アプリ間でコンテンツを渡す、特定アプリを特定ページに起動、複数ステップ操作を1つの自然言語コマンドに圧縮。

### 5. 外部ハードウェアとビジュアル拡張

外部ビデオ入力、スクリーンキャプチャ理解、ローカルモデルを連携させ、PhoneClawを単なる「スマホ内で質問に答える」存在から、より強力な現実世界認識とスケジューリング能力を持つ存在へと進化させる。

### 優先順位の推奨

「最も早く体験差別化できる」順序：

1. ファイル / 写真 / メモ の3つの高頻度API
2. Shortcuts / App Intents統合
3. OCR + 音声認識
4. ローカル知識ベース検索
5. より詳細な自動化Skillオーケストレーション

---

## 参考リンク

- [Hugging Face CLI ドキュメント](https://huggingface.co/docs/huggingface_hub/guides/cli)
- [Hugging Face ダウンロードドキュメント](https://huggingface.co/docs/huggingface_hub/en/guides/download)
- [Gemma 4 E2B MLX モデル](https://huggingface.co/mlx-community/gemma-4-e2b-it-4bit)
- [Gemma 4 E4B MLX モデル](https://huggingface.co/mlx-community/gemma-4-e4b-it-4bit)

## License

Apache 2.0
