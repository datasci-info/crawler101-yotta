# constructors
c(2,1,4,2)
c(1,"1")
c(2,"1")
c(3,4,2,1,5)

1:100
as.character(1:100)
seq(0,1,0.1)
rep(0:10,times=2)

LETTERS
letters


# sub-vector
LETTERS[1:15]

# checking element
"A" %in% LETTERS[1:15]
"ABC" %in% LETTERS[1:15]


# for-loop
for (w in LETTERS[1:15]){
  print(w)
}

# combine
c(LETTERS[1:3],LETTERS[10:13])


# assign
v = c(LETTERS[1:3],LETTERS[10:13])
v
v[4] = "ABCDE"
v[4] <- "ABCDE"
v

`[<-`(v,4,54321)

# remove
v[-4]
v[c(-1,-4)]
