
#入力をするメソッド
def nyu    
  a = gets.to_i
  b = gets.to_i
  return a,b
end

 #入力エラーの処理を行うメソッド
def error(s)  
  if s == 1 then
    puts "入力が違います。もう一度お願いします"
    a,b =nyu
  elsif s == 2 then
    puts "すでに埋まっています。もう一度お願いします。"
    a,b = nyu
  end
  return a,b
end

#盤面を出力するメソッド
def ban 
  for i in 0..2 do  
    for n in 0..2 do
      print @array[i][n]
      print " "
    end
    puts ''
  end
end

#三つが一列に並んで、どちらが勝ったかを判定
def intern(i,s,t)
  @row = Array.new(3)
  @line = Array.new(3)
  for a in 0..2 do
    @row[a] = @array[a][0]+@array[a][1]+@array[a][2]
    @line[a] = @array[0][a]+@array[1][a]+@array[2][a]
  end
    dia1 = @array[0][0]+@array[1][1]+@array[2][2]
    dia2 = @array[0][2]+@array[1][1]+@array[2][0]


 # if i == 1
 #   m="○○○"
 # else
 #   m="×××"
 # end

  k = 0

  m = i.odd? ? '○○○' : '×××'
  if check_row(s, m)
    return i
  end   
  if check_column(t, m)
    return i
  end   
  if s==1 && t==1 then
    if check_dia(dia1,m)
      return i
    end  
    if check_dia(dia2,m)
      return i
    end  
  elsif s!=1 && t!=1 then
    if check_dia(dia1,m)
      return i
    end  
    if check_dia(dia2,m)
      return i
    end  
  end

=begin
  if s == 0 && t == 0 then
    if row[0] == m || line[0] == m || dia1 == m then
      k = i
    end
  elsif s == 0 && t == 1 then
    if row[0] == m || line[1] == m then
        k = i
    end
  elsif s == 0 && t == 2 then
    if row[0] == m || line[2] == m || dia2 == m then
        k = i
    end
  elsif s == 1 && t == 0 then
    if row[1] == m || line[0] == m then
      k = i
    end
  elsif s == 1 && t == 1 then
    if row[1] == m || line[1] == m || dia1 == m || dia2 == m then
        k = i
    end
  elsif s == 1 && t == 2 then
    if row[1] == m || line[2] == m then
        k = i
    end
  elsif s == 2 && t == 0 then
    if row[2] == m || line[0] == m || dia2 == m then
      k = i
    end
  elsif s == 2 && t == 1 then
    if row[2] == m || line[1] == m then
        k = i
    end
  elsif s == 2 && t == 2 then
    if row[2] == m || line[2] == m || dia1 == m then
        k = i
    end
  end
=end
return k
end


# 指定された行(row)が、すべて(mark)になっているかどうかを調べる
def check_row(row, mark)
  @row[row] == mark
end

# 指定された行(column)が、すべて(mark)になっているかどうかを調べる
def check_column(column, mark)
  @line[column] == mark
end

# 四隅と真ん中の時、斜め(dia)がどうなっているかを調べる
def check_dia(dia,mark)
  dia == mark
end 


@array =
[
    ["□","□","□"],
    ["□","□","□"],
    ["□","□","□"]
]

#ターン数を数える
for turn in 1..9 do

  ban

  #入力をする
  puts "どこにしますか？"
  a,b = nyu

  while a<0 || a>2 || b<0 || b>2 || @array[a][b] == "○" || @array[a][b] == "×" do
    #ない盤面の指定エラー処理
    if a<0||a>2||b<0||b>2 then
      a,b = error(1)
    end

    #すでに埋まっている盤面の指定エラー処理
    if @array[a][b] == "○"||@array[a][b] == "×" then
      a,b = error(2)
    end
  end

  #プレイヤーの駒を入れる
  if turn%2 == 1 then
    @array[a][b] = "○"
    k = intern(1,a,b)
  elsif turn%2 == 0 then
    @array[a][b] = "×"
    k = intern(2,a,b)
  end

  #勝敗が決まったらループからぬける
  if k == 1 || k == 2 then
    break
  end

end

ban

if k == 1 then
  puts "先攻の勝利です"
elsif k == 2 then
  puts "後攻の勝利です"
else
  puts "引き分けです"
end

