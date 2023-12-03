require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

def memo_app
 puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する:"

 memo_type = gets.chomp

# if文を使用して続きを作成していきましょう。
# 「memo_type」の値（1 or 2）によって処理を分岐させていきましょう。
 if memo_type=="1"
    puts "新規メモを作成します。希望の新規ファイル名を入力してください。:"
    file_name=gets.chomp
    CSV.open("#{file_name}.csv", 'w') do |csv|
# 任意のCSVファイルを開く/作成・wで既存ファイルがあれば上書き、新規の場合は新規作成される
    
    puts "メモの内容を入力してください。保存して終了したい場合は\"exit\"と入力してください。:"
     while (memo=gets.chomp) !="exit"
        csv.puts ["#{memo}"]
     end#exitが入力されない限りメモ内容をCSVファイルへ追加するループ
     puts"メモを保存しました"
    end
 elsif memo_type=="2"
    puts"編集したいファイル名を入力してください。:"
    file_name=gets.chomp
    if File.exist?("#{file_name}.csv") #""内#{}の使用、文字列内に変数(file_name)の値を埋め込む
        CSV.open("#{file_name}.csv", 'a') do |csv| #aはファイル末尾に追加
        puts "メモの内容を入力してください。保存して終了したい場合は\"exit\"と入力してください）:"
     while (memo=gets.chomp) !="exit"
        csv.puts ["#{memo}"]
     end
     puts"メモを保存しました。"
    end
    else
        puts"そのファイルは存在しません。"
    end
 else
    puts"有効な値は1あるいは2のみです。"
    memo_app
 end
end
memo_app