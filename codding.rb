# Sample 1)  
# Input:
# 6 2 5 3

# Output:
# YES

# Sample 2)
# Input:
# 12 3 4 2

# Output:
# NO

def check_covid (n,k,x,y)
  for i in 0..n
    x = 1 if x + i * k == n - 1
    x += i * k
    break if x >= y
  end
  if x == y
    puts("YES")
  else
    puts("NO")
  end
end