summonerGames <- function(x, custom.games = F){
require(rjson)

## If argument is just the name
if(class(x) == "character"){
url <- paste('https://na.api.pvp.net/api/lol/na/v1.4/summoner/by-name/', x, '?api_key=1357243f-e5ce-40a1-bb87-c7ec35821a79', sep = '')
df <- fromJSON(file = url, method = 'C')
x <- df[[1]][[1]]
}

## Normal code
					url <- paste("https://na.api.pvp.net/api/lol/na/v1.3/game/by-summoner/", x, "/recent?api_key=1357243f-e5ce-40a1-bb87-c7ec35821a79", sep = "")
				df <- fromJSON(file = url, method = 'C')
## Code to organize data
			## The Following gathers original summoner's data per game
summonerGame <- data.frame(t(sapply(1:10, function(x){
						data.frame("summonerId" = df$summonerId,
                       "teamId" = df$games[[x]]$teamId,
                       "championId" = df$games[[x]]$championId)
})))	
## Code to determine game type
gameType <- sapply(1:10, function(x){df$games[[x]]$gameType})



## Game 1
if(df$games[[1]]$gameType == "MATCHED_GAME"){
game1 <- data.frame(t(sapply(1:length(df$games[[1]]$fellowPlayers), function(x){
         df$games[[1]]$fellowPlayers[[x]]
     })))
game1 <- rbind(summonerGame[1,], game1)
## Results for Game 1
if(df$games[[1]]$stats$win == TRUE){
     result1 <- gsub(summonerGame$teamId[1], "Win", game1$teamId)
     result1[result1 != "Win"] <- "Loss"
} else if(df$games[[1]]$stats$win == FALSE){
     result1 <- gsub(summonerGame$teamId[1], "Loss", game1$teamId)
     result1[result1 != "Loss"] <- "Win"
}
game1$results <- result1
gameId <- rep(df$games[[1]]$gameId, length(df$games[[1]]$fellowPlayers)+1)
game1 <- cbind(gameId, game1)  ## Final Data set
}
else {results <- "Custom"
gameId <- df$games[[1]]$gameId
game1 <- cbind(gameId, summonerGame[1,], results)
}

## Game 2
if(df$games[[2]]$gameType == "MATCHED_GAME"){
game2 <- data.frame(t(sapply(1:length(df$games[[2]]$fellowPlayers), function(x){
         df$games[[2]]$fellowPlayers[[x]]
     })))
game2 <- rbind(summonerGame[2,], game2)
## Results for Game 2
if(df$games[[2]]$stats$win == TRUE){
     result2 <- gsub(summonerGame$teamId[2], "Win", game2$teamId)
     result2[result2 != "Win"] <- "Loss"
} else if(df$games[[2]]$stats$win == FALSE){
     result2 <- gsub(summonerGame$teamId[2], "Loss", game2$teamId)
     result2[result2 != "Loss"] <- "Win"
}
game2$results <- result2
gameId <- rep(df$games[[2]]$gameId, length(df$games[[2]]$fellowPlayers)+1)
game2 <- cbind(gameId, game2)  ## Final Data set
}
else {results <- "Custom"
gameId <- df$games[[2]]$gameId
game2 <- cbind(gameId, summonerGame[2,], results)
}


## Game 3
if(df$games[[3]]$gameType == "MATCHED_GAME"){
game3 <- data.frame(t(sapply(1:length(df$games[[3]]$fellowPlayers), function(x){
         df$games[[3]]$fellowPlayers[[x]]
     })))
game3 <- rbind(summonerGame[3,], game3)
## Results for Game 3
if(df$games[[3]]$stats$win == TRUE){
     result3 <- gsub(summonerGame$teamId[3], "Win", game3$teamId)
     result3[result3 != "Win"] <- "Loss"
} else if(df$games[[3]]$stats$win == FALSE){
     result3 <- gsub(summonerGame$teamId[3], "Loss", game3$teamId)
     result3[result3 != "Loss"] <- "Win"
}
game3$results <- result3
gameId <- rep(df$games[[3]]$gameId, length(df$games[[3]]$fellowPlayers)+1)
game3 <- cbind(gameId, game3)  ## Final Data set
}
else {results <- "Custom"
gameId <- df$games[[3]]$gameId
game3 <- cbind(gameId, summonerGame[3,], results)
}

## Game 4
if(df$games[[4]]$gameType == "MATCHED_GAME"){
game4 <- data.frame(t(sapply(1:length(df$games[[4]]$fellowPlayers), function(x){
         df$games[[4]]$fellowPlayers[[x]]
     })))
game4 <- rbind(summonerGame[4,], game4)
## Results for Game 4
if(df$games[[4]]$stats$win == TRUE){
     result4 <- gsub(summonerGame$teamId[4], "Win", game4$teamId)
     result4[result4 != "Win"] <- "Loss"
} else if(df$games[[4]]$stats$win == FALSE){
     result4 <- gsub(summonerGame$teamId[4], "Loss", game4$teamId)
     result4[result4 != "Loss"] <- "Win"
}
game4$results <- result4
gameId <- rep(df$games[[4]]$gameId, length(df$games[[4]]$fellowPlayers)+1)
game4 <- cbind(gameId, game4)  ## Final Data set
}
else {results <- "Custom"
gameId <- df$games[[4]]$gameId
game4 <- cbind(gameId, summonerGame[4,], results)
}

## Game 5
if(df$games[[5]]$gameType == "MATCHED_GAME"){
game5 <- data.frame(t(sapply(1:length(df$games[[5]]$fellowPlayers), function(x){
         df$games[[5]]$fellowPlayers[[x]]
     })))
game5 <- rbind(summonerGame[5,], game5)
## Results for Game 5
if(df$games[[5]]$stats$win == TRUE){
     result5 <- gsub(summonerGame$teamId[5], "Win", game5$teamId)
     result5[result5 != "Win"] <- "Loss"
} else if(df$games[[5]]$stats$win == FALSE){
     result5 <- gsub(summonerGame$teamId[5], "Loss", game5$teamId)
     result5[result5 != "Loss"] <- "Win"
}
game5$results <- result5
gameId <- rep(df$games[[5]]$gameId, length(df$games[[5]]$fellowPlayers)+1)
game5 <- cbind(gameId, game5)  ## Final Data set
}
else {results <- "Custom"
gameId <- df$games[[5]]$gameId
game5 <- cbind(gameId, summonerGame[5,], results)
}

## Game 6
if(df$games[[6]]$gameType == "MATCHED_GAME"){
game6 <- data.frame(t(sapply(1:length(df$games[[6]]$fellowPlayers), function(x){
         df$games[[6]]$fellowPlayers[[x]]
     })))
game6 <- rbind(summonerGame[6,], game6)
## Results for Game 6
if(df$games[[6]]$stats$win == TRUE){
     result6 <- gsub(summonerGame$teamId[6], "Win", game6$teamId)
     result6[result6 != "Win"] <- "Loss"
} else if(df$games[[6]]$stats$win == FALSE){
     result6 <- gsub(summonerGame$teamId[6], "Loss", game6$teamId)
     result6[result6 != "Loss"] <- "Win"
}
game6$results <- result6
gameId <- rep(df$games[[6]]$gameId, length(df$games[[6]]$fellowPlayers)+1)
game6 <- cbind(gameId, game6)  ## Final Data set
}
else {results <- "Custom"
gameId <- df$games[[6]]$gameId
game6 <- cbind(gameId, summonerGame[6,], results)
}

## Game 7
if(df$games[[7]]$gameType == "MATCHED_GAME"){
game7 <- data.frame(t(sapply(1:length(df$games[[7]]$fellowPlayers), function(x){
         df$games[[7]]$fellowPlayers[[x]]
     })))
game7 <- rbind(summonerGame[7,], game7)
## Results for Game 7
if(df$games[[7]]$stats$win == TRUE){
     result7 <- gsub(summonerGame$teamId[7], "Win", game7$teamId)
     result7[result7 != "Win"] <- "Loss"
} else if(df$games[[7]]$stats$win == FALSE){
     result7 <- gsub(summonerGame$teamId[7], "Loss", game7$teamId)
     result7[result7 != "Loss"] <- "Win"
}
game7$results <- result7
gameId <- rep(df$games[[7]]$gameId, length(df$games[[7]]$fellowPlayers)+1)
game7 <- cbind(gameId, game7)  ## Final Data set
}
else {results <- "Custom"
gameId <- df$games[[7]]$gameId
game7 <- cbind(gameId, summonerGame[7,], results)
}


## Game 8
if(df$games[[8]]$gameType == "MATCHED_GAME"){
game8 <- data.frame(t(sapply(1:length(df$games[[8]]$fellowPlayers), function(x){
         df$games[[8]]$fellowPlayers[[x]]
     })))
game8 <- rbind(summonerGame[8,], game8)
## Results for Game 8
if(df$games[[8]]$stats$win == TRUE){
     result8 <- gsub(summonerGame$teamId[8], "Win", game8$teamId)
     result8[result8 != "Win"] <- "Loss"
} else if(df$games[[8]]$stats$win == FALSE){
     result8 <- gsub(summonerGame$teamId[8], "Loss", game8$teamId)
     result8[result8 != "Loss"] <- "Win"
}
game8$results <- result8
gameId <- rep(df$games[[8]]$gameId, length(df$games[[8]]$fellowPlayers)+1)
game8 <- cbind(gameId, game8)  ## Final Data set
}
else {results <- "Custom"
gameId <- df$games[[8]]$gameId
game8 <- cbind(gameId, summonerGame[8,], results)
}


## Game 9
if(df$games[[9]]$gameType == "MATCHED_GAME"){
game9 <- data.frame(t(sapply(1:length(df$games[[9]]$fellowPlayers), function(x){
         df$games[[9]]$fellowPlayers[[x]]
     })))
game9 <- rbind(summonerGame[9,], game9)
## Results for Game 9
if(df$games[[9]]$stats$win == TRUE){
     result9 <- gsub(summonerGame$teamId[9], "Win", game9$teamId)
     result9[result9 != "Win"] <- "Loss"
} else if(df$games[[9]]$stats$win == FALSE){
     result9 <- gsub(summonerGame$teamId[9], "Loss", game9$teamId)
     result9[result9 != "Loss"] <- "Win"
}
game9$results <- result9
gameId <- rep(df$games[[9]]$gameId, length(df$games[[9]]$fellowPlayers)+1)
game9 <- cbind(gameId, game9)  ## Final Data set
}
else {results <- "Custom"
gameId <- df$games[[9]]$gameId
game9 <- cbind(gameId, summonerGame[9,], results)
}


## Game 10
if(df$games[[10]]$gameType == "MATCHED_GAME"){
game10 <- data.frame(t(sapply(1:length(df$games[[10]]$fellowPlayers), function(x){
         df$games[[10]]$fellowPlayers[[x]]
     })))
game10 <- rbind(summonerGame[10,], game10)
## Results for Game 10
if(df$games[[10]]$stats$win == TRUE){
     result10 <- gsub(summonerGame$teamId[10], "Win", game10$teamId)
     result10[result10 != "Win"] <- "Loss"
} else if(df$games[[10]]$stats$win == FALSE){
     result10 <- gsub(summonerGame$teamId[10], "Loss", game10$teamId)
     result10[result10 != "Loss"] <- "Win"
}
game10$results <- result10
gameId <- rep(df$games[[10]]$gameId, length(df$games[[10]]$fellowPlayers)+1)
game10 <- cbind(gameId, game10)  ## Final Data set
}
else {results <- "Custom"
gameId <- df$games[[10]]$gameId
game10 <- cbind(gameId, summonerGame[10,], results)
}


gamesAlmost <- rbind(game1, game2, game3, game4, game5, game6, game7, game8, game9, game10)

## Loads current Champion list to Augment champion IDs

url <- 'https://na.api.pvp.net/api/lol/static-data/na/v1.2/champion?api_key=1357243f-e5ce-40a1-bb87-c7ec35821a79'
	df <- fromJSON(file = url, method = 'C')
	champ <- df[[3]]
	champDf <- data.frame(t(sapply(1:length(df[[3]]), function(x){
							champ[[x]]})))
							
ch <- champDf[,c(1, 3)]  ## Creates a dataframe of just champ IDs and Names
id <- data.frame(unlist(gamesAlmost$championId))  ## Creates a vector of the champion IDs from gamesAlmost
names(id) <- "id"
id$order <- 1:nrow(id)  ## Creates an order index vector to later sort after merging data
gameChamp <- merge(id, ch, by.x = "id", sort = F)
gameChamp <- gameChamp[order(gameChamp$order), ]  ## Orders the data by the original champion order
gameChamp <- gameChamp$name

## Combining data with Champion names

results <- gamesAlmost$results
gamesAlmost$results <- NULL
gamesAlmost$ch.Names <- gameChamp
gamesAlmost$results <- results
row.names(gamesAlmost) <- NULL
gamesAlmost <- gamesAlmost

## Getting summoner names from summoner IDs

## Making a vector of just the summonerIds
sumId <- data.frame(unlist(gamesAlmost$summonerId))
names(sumId) <- "sumId"
sumId$order <- 1:nrow(sumId)
uniqueId <- unique(sumId$sumId)  ## Creates a vector of Unique IDs
uniqueId <- data.frame(uniqueId)

## Pulling the Id translations

head <- 'https://na.api.pvp.net/api/lol/na/v1.4/summoner/'  ## Start of url
tail <- '/name?api_key=1357243f-e5ce-40a1-bb87-c7ec35821a79' ## end of url

if(length(uniqueId$uniqueId) <= 40){
a <- paste(uniqueId[1:nrow(uniqueId),], collapse = ",")
url1 <- paste(head, a, tail, sep = "")
df1 <- fromJSON(file = url1, method = 'C')

## Set of summoners
sum1 <- data.frame(cbind(names(df1), df1))
row.names(sum1) <- NULL
names(sum1) <- c("sumId", "Summoners")
sumAll <- sum1

## Combining/Renaming
mergesum <- merge(sumId, sumAll, by.x = "sumId", sort = F)
mergesum <- mergesum[order(mergesum$order), ]  ## Orders it by the order in sumId
gamesAlmost$Summoners <- mergesum$Summoners  ## Inserting the summoner names
gamesFinal <- gamesAlmost[,c(1, 2, 7, 3, 4, 5, 6)]  ## Reordering the columns

}
else if(length(uniqueId$uniqueId) > 40 & length(uniqueId$uniqueId) <= 80){
a <- paste(uniqueId[1:40,], collapse = ",")
b <- paste(uniqueId[41:nrow(uniqueId),], collapse = ",")
url1 <- paste(head, a, tail, sep = "")
url2 <- paste(head, b, tail, sep = "")
df1 <- fromJSON(file = url1, method = 'C')
df2 <- fromJSON(file = url2, method = 'C')

## First 40 Summoners by their IDs
sum1 <- data.frame(cbind(names(df1), df1))
row.names(sum1) <- NULL
names(sum1) <- c("sumId", "Summoners")

## Final set of Summoners
sum2 <- data.frame(cbind(names(df2), df2))
row.names(sum2) <- NULL
names(sum2) <- c("sumId", "Summoners")

## Combining and renaming
sumAll <- rbind(sum1, sum2)
mergesum <- merge(sumId, sumAll, by.x = "sumId", sort = F)
mergesum <- mergesum[order(mergesum$order), ]  ## Orders it by the order in sumId
gamesAlmost$Summoners <- mergesum$Summoners  ## Inserting the summoner names
gamesFinal <- gamesAlmost[,c(1, 2, 7, 3, 4, 5, 6)]  ## Reordering the columns


}
else if(length(uniqueId$uniqueId) > 80){
a <- paste(uniqueId[1:40,], collapse = ",")
b <- paste(uniqueId[41:80,], collapse = ",")
c <- paste(uniqueId[81:nrow(uniqueId),], collapse = ",")

url1 <- paste(head, a, tail, sep = "")
url2 <- paste(head, b, tail, sep = "")
url3 <- paste(head, c, tail, sep = "")

df1 <- fromJSON(file = url1, method = 'C')
df2 <- fromJSON(file = url2, method = 'C')
df3 <- fromJSON(file = url3, method = 'C')

## First 40 Summoners by their IDs
sum1 <- data.frame(cbind(names(df1), df1))
row.names(sum1) <- NULL
names(sum1) <- c("sumId", "Summoners")

## 41-80 Summoners by their IDs
sum2 <- data.frame(cbind(names(df2), df2))
row.names(sum2) <- NULL
names(sum2) <- c("sumId", "Summoners")

## Final set of Summoners by their IDs
sum3 <- data.frame(cbind(names(df3), df3))
row.names(sum3) <- NULL
names(sum3) <- c("sumId", "Summoners")

sumAll <- rbind(sum1, sum2, sum3)
mergesum <- merge(sumId, sumAll, by.x = "sumId", sort = F)
mergesum <- mergesum[order(mergesum$order), ]  ## Orders it by the order in sumId
gamesAlmost$Summoners <- mergesum$Summoners  ## Inserting the summoner names
gamesFinal <- gamesAlmost[,c(1, 2, 7, 3, 4, 5, 6)]  ## Reordering the columns


}
## Custom Games or Not
cust <- length(which(gamesFinal$results=='Custom'))
         if(custom.games == F && cust > 0){
		 output <- gamesFinal[-which(gamesFinal$results=="Custom"),]
		 }
		output <- gamesFinal
         row.names(output) <- NULL
         
						

## Unlisted final dataframe, renaming, classifying columns
ff <- cbind(unlist(output$gameId), unlist(output$summonerId), unlist(output$Summoner), unlist(output$teamId), unlist(output$championId), unlist(output$ch.Names), unlist(output$results))
row.names(ff) <- NULL
ff2 <- data.frame(ff, stringsAsFactors = F)
names(ff2) <- c("GameID", "SummonerID", "Summoner", "TeamID", "ChampionID", "Champion.Names", "Outcome")
ff2$GameID <- as.numeric(ff2$GameID); ff2$SummonerID <- as.numeric(ff2$SummonerID);
ff2$TeamID <- as.numeric(ff2$TeamID); ff2$ChampionID <- as.numeric(ff2$ChampionID)  ## Makes numeric columns
ff2						
}




