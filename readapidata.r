library(httr)

#install.packages("httpuv")
library(httpuv)

#install.packages("jsonlite")
library(jsonlite)


# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. To make your own application, register at 
#    https://github.com/settings/developers. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.
myapp <- oauth_app("coursera_test_app",
                   key = "6e61ebf35c0e087b38c3",
                   secret = "*")

# 3. Get OAuth credentials

github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)


#req <- GET("https://api.github.com/rate_limit", gtoken)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
#content(req)


json1 <- content(req)

# Convert to a data.frame
gitDF <- jsonlite::fromJSON(jsonlite::toJSON(json1))

gitDF[gitDF$full_name == "jtleek/datasharing","created_at"]

# Subset data.frame
gitDF[gitDF$full_name == "jtleek/datasharing", "created_at"] 
