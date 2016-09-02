
class Output
  #盤面を出力するメソッド
  def ban (*banmen)
    3.times do |i| 
      3.times do |n|
        print banmen[i][n]
        print " "
      end
      puts ''
    end
  end

  def win(k)
    case 
    when k == 1 
      puts "先攻の勝利です"
    when k == 2 
      puts "後攻の勝利です"
    else k == 0
      puts "引き分けです"
    end
  end
end