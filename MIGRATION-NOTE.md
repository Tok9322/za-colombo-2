# ZA COLOMBO: GitHub Pages → Cloudflare Pages 移行メモ

## 完了済み
- [x] 電話番号をアクセスセクションに追加済み
- [x] Cloudflare Pages でプロジェクト作成中（Connect GitHub まで進行）

## 次にやること

### Step 1: Cloudflare Pages セットアップ（途中）
1. 「Connect GitHub」からGitHubアカウントを連携
2. `Tok9322/za-colombo-2` リポジトリを選択
3. ビルド設定はすべて空欄のままでOK（静的HTML）
4. 「Save and Deploy」をクリック

### Step 2: XserverでDNS設定を変更
- ドメイン: `zacolombo.pages-hub.com`
- Xserverのドメイン管理画面でDNSレコードを変更
- Cloudflare Pagesのデプロイ完了後に表示されるドメイン設定の指示に従う
  - 通常は CNAME レコードを Cloudflare Pages のURLに向ける

### Step 3: GitHub Pagesを無効化
- リポジトリ Settings → Pages → 無効化
- CNAME ファイルの削除または更新

## 現在の構成
- リポジトリ: https://github.com/Tok9322/za-colombo-2
- 現ドメイン: zacolombo.pages-hub.com
- ドメイン管理: Xserver
- Cloudflareアカウント: あり
