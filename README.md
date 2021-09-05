# Buildesk（ビルデスク）

### **https://buildesk.app**  
<br />

## サービス概要
**快適なデスク環境を構築しよう**  
<br />
デスク環境に興味のある人達が「便利なアイテム」や「理想の見た目」を探せる、デスク環境に特化した写真投稿サービスです。  
<br />
[以前のREADME](https://github.com/en-Barry/buildesk/blob/main/README_old.md)  
<br />
<br />

### 作成した経緯
プログラミングの勉強を始めた頃、デスクワークに慣れておらずとにかく身体が痛くて集中が続かないことに悩んでいました。TwitterやInstagramを開けばデスク環境の投稿が多いことを知り、次第にそれらの投稿を参考にするようになりました。しかし、それらの多くは見た目は参考になるものの、実際にどのアイテムを使っているのか、また使い心地まで分からないものが多く、どこか参考になり切らないもどかしさを感じた経験から作りました。  
使っているアイテムまで紹介したいデスクにこだわりを持つユーザーと、どのアイテムを使っているのかまで知りたいユーザーの欲求を満たし、結果的にデスクワーカーの生産性が向上することを目的としています。

## 使用画面と機能
<br />

| 新規登録/ログイン | トップ | 投稿一覧 |
| :---: | :---: | :---: |
| ![Screenshot_20210905-174407_Chrome](https://user-images.githubusercontent.com/69828703/132120980-855cbbfb-0ca2-40fd-9941-5233330de47f.jpg) | ![Screenshot_20210905-182145_Chrome](https://user-images.githubusercontent.com/69828703/132121924-486ea3fd-087f-43ef-8c8a-925b61aa6089.jpg) | ![Screenshot_20210728-190450_Chrome](https://user-images.githubusercontent.com/69828703/132121153-d665a321-e5e1-4124-8bef-d471699a5559.jpg) |
| メールアドレス以外にもTwitter, GoogleでのSNSで認証できる。 | 最新の投稿を4件表示する。<br />カテゴリーページに飛べるリンクや機能紹介を表示する。 | 2カラムでこれまでの投稿を一覧表示する。<br />投稿を選択すると詳細画面に遷移する。 |
<br />
<br />
<br />

| 投稿画面 | 投稿詳細画面 | 投稿詳細画面 |
| :---: | :---: | :---: |
| ![Screenshot_20210905-182211_Chrome](https://user-images.githubusercontent.com/69828703/132121944-360706b5-8451-4ba6-b36c-1ac3c1510be6.jpg) | ![Screenshot_20210905-182903_Chrome](https://user-images.githubusercontent.com/69828703/132122070-516b1373-4f2d-4b0a-9805-53e584a78ae7.jpg) | ![Screenshot_20210905-172250_Chrome](https://user-images.githubusercontent.com/69828703/132121983-9fca0d8f-3d2b-49df-88b6-6f953ed10320.jpg) | 
| デスク写真と一緒にアイテムも選択し登録できる。 | 投稿に対していいねができたり、後から見返しやすいように保存ができる。 | 投稿に紐づいたアイテムが表示されるほか、コメントをすることもできる。 |
<br />
<br />
<br />

| マイページ | 保存した投稿画面 | アイテム詳細画面 |
| :---: | :---: | :---: |
| ![Screenshot_20210905-173643_Chrome](https://user-images.githubusercontent.com/69828703/132120828-2f9a88e7-8c6a-41d9-aa2c-7fefa7695945.jpg) | ![Screenshot_20210905-172523_Chrome](https://user-images.githubusercontent.com/69828703/132120830-b62e689c-894c-4745-8be3-c50317d566f8.jpg) | ![Screenshot_20210905-174210_Chrome](https://user-images.githubusercontent.com/69828703/132120986-e9d0fda0-be53-446b-acad-0a90037a7198.jpg) |
| プロフィールやこれまでの投稿、それらの投稿に紐づいたアイテムまで表示する | 保存した投稿を表示する。<br />自分以外のユーザーには表示されない。 | 投稿詳細やマイページからアクセスできる。<br />それぞれの販売サイトにアクセスできるリンクやそのアイテムが利用されている投稿を表示する。 |
<br />
<br />
<br />

# 使用技術

### フロントエンド
- jQuery　&ensp; 
- Swiper &ensp; 
- Bulma　&ensp; 

### バックエンド
- Ruby　2.6.6
- Rails　6.0.3.5
  - sorcery（ログイン）
  - ransack（検索）
  - enum_help（enumのi18n化）
  - meta-tags(タグ設定)
  - hanmoto（パブリックページの生成）
- rakuten_web_service（外部API）

### インフラ
- AWS
  - EC2
  - S3
  - CloudFront
  - RDS
- puma
- Nginx  
<br />

## **画面遷移図**
- https://xd.adobe.com/view/b78a14ae-708f-4ed6-8012-19908c2384f0-e2d9/

## **ER図**
- https://drive.google.com/file/d/1DXEMqbS_7hjjPsu6FCg9g8Q03sJmMHBi/view?usp=sharing
