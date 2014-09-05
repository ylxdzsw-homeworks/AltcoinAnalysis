makeTableOfSourceInfo <- function(){
  Sys.setlocale("LC_TIME", "English")
  setwd("./Data/sourceCode")
  sourceName <- dir(".")
  sourceInfo <- data.frame()
  for(i in 1:length(sourceName)){
    setwd(sourceName[i])
    commitInfo <- system("git log --pretty=format:\"%cd\"",intern=T)
    commitInfo <- strsplit(commitInfo," ")
    commitInfo <- sapply(commitInfo,function(x){paste(x[2],x[3],x[5])})
    commitInfo <- as.Date(commitInfo,"%b %d %Y")
    commitLm <- hist(commitInfo,10,plot=F)
    commitLm <- lm(commitLm$counts ~ commitLm$mids)
    sourceInfo <- rbind(sourceInfo,data.frame(coin=sourceName[i],
                                              counts=length(commitInfo),
                                              intercept=commitLm$coefficients[1],
                                              k=commitLm$coefficients[2]))
    setwd("../")
    print(paste0("finished ",floor(100 * i / length(sourceName)),"%"))
  }
  setwd("../../")
  write.table(sourceInfo,"./Data/sourceInfo.txt",row.names=1:length(sourceName))
}