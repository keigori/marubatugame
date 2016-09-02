require "./Check_out.rb"

#勝利条件の判定
class Judge_win
  def intern(i,s,t)
    $row = Array.new(3)
    $line = Array.new(3)
    for a in 0..2 do
      $row[a] = $array[a][0]+$array[a][1]+$array[a][2]
      $line[a] = $array[0][a]+$array[1][a]+$array[2][a]
    end
    dia1 = $array[0][0]+$array[1][1]+$array[2][2]
    dia2 = $array[0][2]+$array[1][1]+$array[2][0]
    ch = Check_out.new
    k = 0

    m = i.odd? ? '○○○' : '×××'
    if ch.check_row(s, m)
      return i
    end   
    if ch.check_column(t, m)
      return i
    end   
    if s==1 && t==1 then
      if ch.check_dia(dia1,m)
        return i
      end  
      if ch.check_dia(dia2,m)
        return i
      end  
    elsif s!=1 && t!=1 then
      if ch.check_dia(dia1,m)
        return i
      end  
      if ch.check_dia(dia2,m)
        return i
      end  
    end
    return k
  end
end
