def fibs(n)
  first_num, second_num = [0,1]
  (n - 1).times do
    first_num, second_num = second_num, first_num + second_num
  end
  puts first_num
end

def fibs_rec(n)
  if n < 2
    return n
  else
    return (fibs_rec(n - 1) + fibs_rec(n - 2))
  end
end
