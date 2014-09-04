makeTableOfSourceInfo <- function(){
  setwd("./Data/sourceCode")
  sourceName <- dir(".")
  for(i in 1:length(sourceName)){
    setwd(sourceName[i])
    commitInfo <- system("git log --pretty=format:\"%cd\"",intern=T)
    #TODO#
  }
  #TODO#
}