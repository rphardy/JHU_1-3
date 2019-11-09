#Week2-Quiz 1
#created API application with:
      #http://github.com Homepage URL
      #http://localhost:1410 Callback URL - for Authentication of OAuth app
#install.packages("httr")
#install.packages("httpuv")

library(httr)
library(httpuv)
oauth_endpoints("github")

myapp <- oauth_app("github",
                   key = "7a5abf8f872a26454073",#from site
                   secret = "80a58b070cf10f29adbd177b9a53cb1ad94d3d85"#from site
)

github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)

obj <- content(req)

#returns data for the time the datasharing repo was created.
obj[[16]]$created_at