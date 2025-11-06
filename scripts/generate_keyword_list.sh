#!/bin/bash

# キーワードリストを自動生成するスクリプト
# 使い方: ./scripts/generate_keyword_list.sh （リポジトリのルートから実行）
#        または ./generate_keyword_list.sh （scriptsディレクトリ内から実行）

# スクリプトのディレクトリを取得
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
# リポジトリのルートディレクトリ（scriptsの親ディレクトリ）
REPO_ROOT="$(dirname "$SCRIPT_DIR")"
# キーワードディレクトリへのパス
KEYWORDS_DIR="$REPO_ROOT/keywords"

# keywords ディレクトリが存在するか確認
if [ ! -d "$KEYWORDS_DIR" ]; then
    echo "エラー: ${KEYWORDS_DIR} ディレクトリが見つかりません。"
    echo "リポジトリの構造を確認してください。"
    exit 1
fi

# 一時ファイルを作成
TEMP_FILE=$(mktemp)

# ヘッダーを書き込み
cat > "$TEMP_FILE" << 'EOF'
# キーワードリスト

このディレクトリには、受講生が選んだキーワードとその解説が格納されています。

## キーワード一覧

EOF

# keywords/ 内の.mdファイルを学籍番号順（アルファベット順）にソートして処理
cd "$KEYWORDS_DIR"

for file in $(ls *.md 2>/dev/null | grep -v "^README.md$" | sort); do
    # ファイルが存在し、読み取り可能か確認
    if [ -f "$file" ] && [ -r "$file" ]; then
        # タイトル（1行目の # を除去）
        title=$(head -n 1 "$file" | sed 's/^# //')
        
        # 作成者情報を取得（## 作成者セクションから）
        author_name=""
        student_id=""
        
        # ファイル内から作成者情報を抽出
        while IFS= read -r line; do
            if [[ $line =~ ^-\ 氏名:\ (.+)$ ]]; then
                author_name="${BASH_REMATCH[1]}"
            elif [[ $line =~ ^-\ 学籍番号:\ (.+)$ ]]; then
                student_id="${BASH_REMATCH[1]}"
            fi
        done < "$file"
        
        # リンクを生成
        if [ -n "$student_id" ] && [ -n "$author_name" ] && [ -n "$title" ]; then
            echo "- [${student_id} - ${author_name} - ${title}](./${file})" >> "$TEMP_FILE"
        else
            # 情報が取得できない場合は、ファイル名とタイトルのみで表示
            echo "- [${file} - ${title}](./${file})" >> "$TEMP_FILE"
        fi
    fi
done

# 一時ファイルをREADME.mdに移動
mv "$TEMP_FILE" "README.md"

echo "✅ キーワードリスト (keywords/README.md) を生成しました。"
echo ""
echo "生成されたファイル:"
cat README.md

