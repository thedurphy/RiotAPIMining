summoners.Ch <- function(){
    library(rjson)
	url <- 'https://na.api.pvp.net/api/lol/na/v2.4/league/challenger?type=RANKED_SOLO_5x5&api_key=1357243f-e5ce-40a1-bb87-c7ec35821a79'
	df <- fromJSON(file = url, method = "C")
	sumdf <- df[[4]]
	sum.Challenger <- data.frame(t(sapply(1:length(df[[4]]), function(x){
							sumdf[[x]]
							})))						
}
