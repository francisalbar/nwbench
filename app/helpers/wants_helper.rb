module WantsHelper
  def minmaxpage(current,total,option)
    min = current - 2
    if min < 1
       min = 1
       max = 1 + 4
       if max > total then max = total end
    end
    max = min + 4
    if max > total
       max = total
       min = max - 4
       while min < 1
         min = min + 1
       end
    end
    if option == 'min' then return min else return max end
  end
end
