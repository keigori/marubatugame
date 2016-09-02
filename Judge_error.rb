require "./Input.rb"

#入力エラーの処理を行うクラス
class JudgeError
  def error(s)  
    it = Input.new 
    case
    when s == 1 
      puts "入力が違います。もう一度お願いします"
      a, b = it.nyu
    when s == 2 
      puts "すでに埋まっています。もう一度お願いします。"
      a, b = it.nyu
    end
    [a,b]
  end
end