# sets working directory
setwd("~/dataviz-fall-2013/line-chart/")

# imports the data into strikeouts variable
strikeouts <- read.csv("strikeouts.csv")

# give me the top 5 in the list
head(strikeouts)

# what is unique?
unique(strikeouts$g)

# so let's get the average strikeouts per game shall we?
strikeouts$kpg <- strikeouts$so / strikeouts$g


max(strikeouts$kpg)
min(strikeouts$kpg)
most_strikeouts <- max(strikeouts$kpg)
subset(strikeouts, kpg == most_strikeouts)
oakland <- subset(strikeouts, franchise == "OAK")
oakland <- oakland[order(oakland$kpg, decreasing=T),]
plot(oakland$year, oakland$kpg)
plot(oakland$year, oakland$kpg, pch=16, col="red", main="Strikeouts per game: A's", xlab="Year", ylab="Ks per game", ylim=c(0, max(oakland$kpg)))
oakland_through_time <- oakland[order(oakland$year, decreasing=F),]
plot(oakland_through_time$year, oakland_through_time$kpg, pch=16, col="red", main="Strikeouts per game: A's", xlab="Year", ylab="Ks per game", type="l", lwd=2)
minnesota <- subset(strikeouts, franchise == "MIN")
plot(minnesota$year, minnesota$kpg, pch=16, col="blue", main="Strikeouts per game: Minnesota", xlab="Year", ylab="Ks per game", ylim=c(0, max(minnesota$kpg)))
plot(oakland_through_time$year, oakland_through_time$kpg, pch=16, col="red", main="Oakland vs. Minnesota", xlab="Year", ylab="K's per game", ylim=c(0, max(oakland_through_time$kpg)))
points(minnesota$year, minnesota$kpg, pch=16, col="blue")
max_kpg <- max(c(max(oakland_through_time$kpg), minnesota$kpg))
plot(oakland_through_time$year, oakland_through_time$kpg, pch=16, col="red", main="Oakland vs. Minnesota", xlab="Year", ylab="K's per game", ylim=c(0, max(max_kpg)), type="l", lwd=2)
lines(minnesota$year, minnesota$kpg, col="blue", lwd=2)
league_average <- aggregate(strikeouts$kpg, list(strikeouts$year), mean)
names(league_average) <- c("year", "meankpg")
plot(league_average$year, league_average$meankpg, col="orange", main="MLB mean strikeouts per game", xlab="Year", ylab="Ks per game", type="l", lwd=2)
plot(league_average$year, league_average$meankpg, col="grey", main="Oakland vs league average", xlab="Year", ylab="Ks per game", type="l", lwd=2, ylim=c(0, max(oakland$kpg)))
lines(oakland$year, oakland$kpg, col="red", lwd=2)