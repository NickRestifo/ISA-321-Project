#Prep
setwd("/Users/gavinmorton/Desktop/ISA321")
install.packages("lpSolve")
library(lpSolve)
library(readxl)
P2<-read_excel("ISA321_Project_P2Constraints.xlsx")


#STEP 1
obj.2<-c(P2$Ratings)

#STEP 2
lhs.2<-matrix(c(P2$C1,
                P2$C2,
                P2$C3,
                P2$C4,
                P2$C5,
                P2$C6,
                P2$C7,
                P2$C8,
                P2$C9,
                P2$C10,
                P2$C11,
                P2$C12,
                P2$C13),  
            ncol=13,
            byrow=FALSE)
lhs.2 #looks good!

#STEP 3
signs.2<-c("<=","<=","<=","<=","<=","<=","<=",">=",">=",">=",">=",">=",">=")

#STEP 4
rhs.2<-c(761,2,2,2,2,2,2,1,1,1,1,1,1) 

#STEP 5
solution.2<-lp(direction="max",
             obj.2,
             lhs.2,
             signs.2,
             rhs.2,
             all.bin=TRUE)
#SOLUTION
solution.2$objval 
Solution2<-solution.2$solution 
Solution2

#Format to make easy to read
Solution.output2<-cbind(P2$Variables,Solution2,P2$Description)
Solution.output2 #Looks Great!
