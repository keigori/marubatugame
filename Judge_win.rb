require "./Check_out.rb"

#勝利条件の判定
class JudgeWin
  def intern(*banmen,i,s,t)
    dia1 = banmen[0][0]+banmen[1][1]+banmen[2][2]
    dia2 = banmen[0][2]+banmen[1][1]+banmen[2][0]
    ch = CheckOut.new

    m = i.odd? ? '○○○' : '×××'
    if ch.check_row(*banmen,s, m)
      return i
    end   
    if ch.check_column(*banmen,t, m)
      return i
    end   
    if s==1 && t==1 
      if ch.check_dia(dia1,m)
        return i
      end  
      if ch.check_dia(dia2,m)
        return i
      end  
    elsif s!=1 && t!=1 
      if ch.check_dia(dia1,m)
        return i
      end  
      if ch.check_dia(dia2,m)
        return i
      end  
    end
    0
  end
end
