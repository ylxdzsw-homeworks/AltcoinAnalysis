makeTableOfAllCleanData <- function(){
  a <- read.table("./Data/coinInfo.txt")[-c(2)]
  b <- read.table("./Data/githubInfo.txt")
  c <- read.table("./Data/sourceInfo.txt")
  library(plyr)
  x <- join_all(list(a,b,c))
  write.table(x,"./Data/allInfo.txt")
}