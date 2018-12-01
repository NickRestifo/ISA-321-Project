#Prep
install.packages("lpSolve")
install.packages("TSP")
install.packages("readxl")
library(lpSolve)
library(readxl)
library(TSP)

#Read in the data
P1<-read_excel("ISA321_Project_P1Matrix.xlsx")

#Need a square matrix to make an atsp object
PriceMatrix<-matrix(c(P1$Chicago,
                      P1$Barcelona,
                      P1$Rome,
                      P1$Athens,
                      P1$Dublin,
                      P1$Paris,
                      P1$London),
                    ncol=7,
                    byrow=FALSE)
PriceMatrix #Looks good


#Create the ATSP object
P1atsp<-as.ATSP(PriceMatrix)

MinCost<-solve_TSP(P1atsp,method="two_opt")
MinCost

path <- cut_tour(MinCost, 1, exclude_cut = FALSE)
head(labels(path))
tail(labels(path))

plot(path)

?cut_tour


