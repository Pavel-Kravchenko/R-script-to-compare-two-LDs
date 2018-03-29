name1 <- "D"
name2 <- "S"
wind1 <- 4000
wind2 <- 400

"%+%" <- function(...){
  paste0(...)
}

LD_D_txt <- read.csv("/home/pavel/Desktop/Work/Project/R/R_2_plots/LD_Saccharomyces.txt", sep = '\t',
                     stringsAsFactors = F)
LD_D_txt <- LD_D_txt[order(LD_D_txt$Len, decreasing = F),]
x1 <- LD_D_txt$Len
y1 <- LD_D_txt$LD
l <- max(x1, x2)

LD_S_txt <- read.csv("/home/pavel/Desktop/Work/Project/R/R_2_plots/LD_Drosophila.txt", sep = '\t',
                     stringsAsFactors = F)
LD_S_txt <- LD_S_txt[order(LD_S_txt$Len, decreasing = F),]
x2 <- LD_S_txt$Len
y2 <- LD_S_txt$LD

df1 <- data.frame(x1, y1)
df2 <- data.frame(x2, y2)

l <- max(x1, x2)

library(ggplot2)
p <- ggplot(gapminder, aes(x = gdpPercap, y = lifeExp))
p + geom_point()

plot(x1, y1, main = "LD plot", xlab ="Distance", ylab = "LD", xlim=c(0, max(l)), ylim=c(0, max(y1)), type="n")

f1 <- rep(1/wind1, wind1)
y1_lag <- filter(y1, f1, sides=1)
lines(x1, y1_lag, col="red")

f2 <- rep(1/wind2, wind2)
y2_lag <- filter(y2, f2, sides=1)
lines(x2, y2_lag, col="blue")
abline(h=mean(y1), col="red")
abline(h=mean(y2), col="blue")
legend("bottomleft", inset=0.05, legend=c(name1, name2), col=c("red", "blue"), pch=20, title="Legend")
