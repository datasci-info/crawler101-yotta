f = function(x,y) c(x,y)
f(1,2)
do.call(f,list(3,4))
do.call(f,list(y=3,x=4))

# function with variable arguments
c(1,2,3)
c(1,2)
list(1,2,3,4)
sum(1,2,3)
sum(3,2)

# DEFINE function with variable arguments
g = function(...) list(...)
g(a=1,b=10,c=31,12,321)

# CALL function with variable arguments by do.call
do.call(g, list(a=1,b=10,c=31,12,321))
