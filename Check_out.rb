
class Check_out
  # 指定された行(row)が、すべて(mark)になっているかどうかを調べる
  def check_row(row, mark)
    $row[row] == mark
  end

  # 指定された行(column)が、すべて(mark)になっているかどうかを調べる
  def check_column(column, mark)
    $line[column] == mark
  end

  # 四隅と真ん中の時、斜め(dia)がどうなっているかを調べる
  def check_dia(dia,mark)
    dia == mark
  end 
end