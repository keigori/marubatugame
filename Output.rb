
class Output
  #盤面を出力するメソッド
  def ban 
    for i in 0..2 do  
      for n in 0..2 do
        print $array[i][n]
        print " "
      end
      puts ''
    end
  end
end