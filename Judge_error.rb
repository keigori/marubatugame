require "./Input.rb"

class JudgeError
  #入力エラーの処理を行うメソッド
  def error(s)  
    it = Input.new 
    case
    when s == 1 
      puts "入力が違います。もう一度お願いします"
      a = it.nyu
      puts "行"
      b = it.nyu
      puts "列"
    when s == 2 
      puts "すでに埋まっています。もう一度お願いします。"
      a = it.nyu
      puts "行"
      b = it.nyu
      puts "列"
    end
    [a,b]
  end
end