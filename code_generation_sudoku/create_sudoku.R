X = matrix(0,9,9)
X[1,] = sample(1:9)

for (i in 1:2){
  X[i+1,4:6]<-X[i,1:3]
  X[i+1,7:9]<-X[i,4:6]
  X[i+1,1:3]<-X[i,7:9]
}
t=1:3
for (c in c(0,3)){
  for (k in c(0,3,6)){
    for (j in c(0,1)){
      X[t+3+c,2+j+k]=X[t+c,1+j+k]
      X[t+3+c,1+k]=X[t+c,3+k]}
  }
}

for (i in c(0,3,6)){
  X[,(1:3)+i] <- X[,(1:3)+i][,c(sample(1:3))]
  X[(1:3)+i,] <- X[(1:3)+i,][c(sample(1:3)),]
}

X %>%
  datatable(class="cell-border compact hover nowrap stripe", 
            options=list(ordering=FALSE,lengthMenu = 9, dom='t'), 
            editable = list(target = "cell", disable = list(columns = 0)),
            colnames=paste('',1:9), rownames=paste('',1:9))