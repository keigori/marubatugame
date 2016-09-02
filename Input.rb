#入力をするクラス
class Input
  def nyu    
    a = gets.to_i
    b = gets.to_i
    puts "#{a}行#{b}列目"
    
    [a, b]
  end
end
