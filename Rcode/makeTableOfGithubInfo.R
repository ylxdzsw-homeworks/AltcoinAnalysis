makeTableOfGithubInfo <- function(){
  source("./Rcode/getInfoFromGithub.R")
  coinInfo <- read.table("./Data/coinInfo.txt")
  githubInfo <- data.frame()
  for(i in 1:nrow(coinInfo)){
    infos <- getInfoFromGithub(coinInfo[i,"githubAddress"])
    githubInfo <- rbind(githubInfo,data.frame(coin=coinInfo[i,"coin"],
                                              size=infos$size,
                                              star=infos$stargazers_count,
                                              watch=infos$watchers_count,
                                              network=infos$network_count,
                                              subscriber=infos$subscribers_count
                                              ))
  }
  write.table(githubInfo,"./Data/githubInfo.txt")
}