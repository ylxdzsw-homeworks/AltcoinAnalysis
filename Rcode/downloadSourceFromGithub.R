#WARNING:Considering the speed downloading files from github, you may want to download it yourself rather than use this script
downloadSourceFromGithub <- function(){
  coinInfo <- read.table("./Data/coinInfo.txt")
  setwd("./Data/sourceCode")
  for(i in 1:nrow(coinInfo)){
    system(paste("git clone",coinInfo[i,"githubAddress"]))
  }
  setwd("../../")
}