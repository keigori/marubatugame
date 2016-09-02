require "./Input.rb"

class Judge_error
  #入力エラーの処理を行うメソッド
  def error(s)  
    it = Input.new 
    if s == 1 then
      puts "入力が違います。もう一度お願いします"
      a,b =it.nyu
    elsif s == 2 then
      puts "すでに埋まっています。もう一度お願いします。"
      a,b = it.nyu
    end
    return a,b
  end
end