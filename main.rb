require "./Output.rb"
require "./Input.rb"
require "./Judge_win.rb"
require "./Judge_error.rb"

ot = Output.new
it = Input.new
jwin = JudgeWin.new
jer = JudgeError.new
banmen =
[
    ["□","□","□"],
    ["□","□","□"],
    ["□","□","□"]
]
k = 0

#ターン数を数える
9.times do |turn|
  turn += 1

  ot.ban(*banmen)

  #入力をする
  puts "どこにしますか？"
  a, b = it.nyu

  while a < 0 || a > 2 || b < 0 || b > 2 || banmen[a][b] == "○" || banmen[a][b] == "×" do
    #ない盤面の指定エラー処理
    if a < 0 || a > 2 || b < 0 || b > 2 
      a,b = jer.error(1)
    end
    #すでに埋まっている盤面の指定エラー処理
    if banmen[a][b] == "○"|| banmen[a][b] == "×" 
      a,b = jer.error(2)
    end
  end

  #プレイヤーの駒を入れる
  case
  when turn%2 == 1 
    banmen[a][b] = "○"
    k = jwin.intern(*banmen, 1, a, b)
  when turn%2 == 0 
    banmen[a][b] = "×"
    k = jwin.intern(*banmen, 2, a, b)
  end

  #勝敗が決まったらループからぬける
  if k == 1 || k == 2 
    break
  end
end

ot.ban(*banmen)
ot.win(k)