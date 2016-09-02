#3つそろっているかをcheckするクラス
class CheckOut
  # 指定された行(row)が、すべて(mark)になっているかどうかを調べる
  def check_row(*banmen, row, mark)
    row3 = Array.new(3)
    3.times do |a|
      row3[a] = banmen[a][0]+banmen[a][1]+banmen[a][2]
    end
    row3[row] == mark
  end

  # 指定された行(column)が、すべて(mark)になっているかどうかを調べる
  def check_column(*banmen, column, mark)
    line3 = Array.new(3)
    3.times do |a|
      line3[a] = banmen[0][a]+banmen[1][a]+banmen[2][a]
    end
    line3[column] == mark
  end

  # 四隅と真ん中の時、斜め(dia)がどうなっているかを調べる
  def check_dia(dia, mark)
    dia == mark
  end 
end