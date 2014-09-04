getInfoFromGithub <- function(githubAddress){
  library(httr)
  oauth_endpoints("github")
  myapp <- oauth_app("github", "0b4abea9dc9c0e97ef6d")
  github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
  gtoken <- config(token = github_token)
  getAddress <- sub("^https://github.com/","https://api.github.com/repos/",githubAddress)
  getAddress <- sub(".git$","",getAddress)
  req <- GET(getAddress, gtoken)
  stop_for_status(req)
  content(req)
}