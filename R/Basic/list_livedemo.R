
# constructors
L1 = list(1,2,3,4,5,6)
L1

L2 = list(a=1,b=2,c=3,d=4,e=5,f=6)
L3 = list(aa=1,bb=2,cc=3,dd=4,ee=5,ff=6)
L4 = list(1,2,a=3,b=4,5,6)

L4$a
L4[[3]]

L3

# checking element
6 %in% L2
12 %in% L2



# sub-list
L1[2:4]
L2[2:4]
L4[2:4]


# show all keys
names(L1)
names(L2)
names(L3)
names(L4)


# for-loop
for (w in L1){
  print(w)
}



# combine
c(L1,L2)
c(L3,L2)


# assign
L3[3:5] = 100
L3

# remove
L2[-4]
L2[c(-1,-4)]


# as function arguments & keyword arguments

c(2,3)
c(1,2,3,4)

func = function(k1,k2,k3,...){
  c(k1,k2,k3)
  # list(...)
}


func(1,2)
func(1,2,3)
func(1,2,3,4,5)

func(3,2,1)
func(k2=3,2,1)

do.call(func,list(3,2,1))
func(3,2,1)

do.call(func,list(k2=3,k1=20,1,4,6,3))
do.call(func,list(k2=3,k1=20,1,4,k3=6,3))



