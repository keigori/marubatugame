
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

#三つが一列に並んでいるかを判定
def jg 
n = 0
  for i in 0..2 do
    if @array[i][0..1] == @array[i][1..2] || @array[0..1][i] == @array[1..2][i] then
      n = win(1,i)
      break
    elsif (@array[0][0] == @array[1][1] && @array[1][1] == @array[2][2]) || 
          (@array[0][2] == @array[1][1] && @array[1][1] == @array[2][0]) then    
      n = win(2, i)
      break
    end
  end
  return n
end

#どちらが勝ったかを判定
def win(s,t) 
  i = 0

  if s == 1 && @array[t][t] == "○" then
    i = 1
  elsif s == 1 && @array[t][t] == "×" then
    i = 2
  end

  if s == 2 && @array[1][1] == "○" then
    i = 1
  elsif s == 2 && @array[1][1] == "×" then
    i = 2
  end

  return i
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
  elsif turn%2 == 0 then
    @array[a][b] = "×"
  end

  k = jg
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

