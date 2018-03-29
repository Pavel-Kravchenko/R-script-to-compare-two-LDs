args <- commandArgs(trailingOnly = T)
name1 <- toString(args[4])
name2 <- toString(args[5])
dir <- toString(args[6])

"%+%" <- function(...){
  paste0(...)
}

name <- name1 %+% "_" %+% name2 %+% ".png"
id1 <- dir %+% "/LD_" %+% name1 %+% ".txt"
id2 <- dir %+% "/LD_" %+% name2 %+% ".txt"
print("---Names have been generated")

LD_D_txt <- read.csv(id1, sep = '\t', 
                 stringsAsFactors = F)
LD_D_txt <- LD_D_txt[order(LD_D_txt$Len, decreasing = F),] 
x1 <- LD_D_txt$Len
y1 <- LD_D_txt$LD

LD_S_txt <- read.csv(id2, sep = '\t', 
                   stringsAsFactors = F)
LD_S_txt <- LD_S_txt[order(LD_S_txt$Len, decreasing = F),] 
x2 <- LD_S_txt$Len
y2 <- LD_S_txt$LD


df1 <- data.frame(x1, y1)
df2 <- data.frame(x2, y2)
if (length(df1$x1) > 1000000) { df1 <- df1[1:1000000,]}
if (length(df2$x2) > 1000000) { df2 <- df2[1:1000000,]}

#if (length(df1$x1) > 1000000) {df1 <- df1[sample(nrow(df1), 1000000), ]}
#if (length(df2$x2) > 1000000) {df2 <- df2[sample(nrow(df2), 1000000), ]}
print("---Data have been selected")

print("---Data have been loaded")
wind1 <- as.integer(round(length(df1$x1)/10, 0))
if (wind1 == 0) {wind1 <- 2}
wind2 <- as.integer(round(length(df2$x2)/10, 0))
if (wind2 == 0) {wind2 <- 2}

l <- max(x1, x2)
png(file= name, width=1500, height=900, res=120)
plot(df1$x1, df1$y1, main = "LD plot", xlab ="Distance", ylab = "LD", xlim=c(0, max(l)), ylim=c(0, 1), type="n")

f1 <- rep(1/wind1, wind1)
y1_lag <- filter(df1$y1, f1, sides=1)
lines(df1$x1, y1_lag, col="red")


f2 <- rep(1/wind2, wind2)
y2_lag <- filter(df2$y2, f2, sides=1)
lines(df2$x2, y2_lag, col="blue")

abline(h=mean(df1$y1), col="red")
abline(h=mean(df2$y2), col="blue")
#abline(v=0, col="orange", lty=2)
#abline(v=2300, col="orange")
legend("bottomleft", inset=0.05, legend=c(name1, name2), col=c("red", "blue"), pch=20, title="Legend")
dev.off()
print("---Plot have been plotted")


# df1 <- data.frame(x1, y1)
# df2 <- data.frame(x2, y2)
# 
# for (xxx in c(10000,100000,200000,300000,400000,500000,600000)) {
#   print(paste("--- len",xxx ,"start iteration" , "---"))
#   if (length(df1$x1) > 10000000) { df1 <- df1[100000:100000+xxx*100,]}
#   if (length(df2$x2) > xxx) { df2 <- df2[1:xxx,]}
#   name_z <- name1 %+% "_" %+% name2 %+% "_" %+% toString(xxx) %+% ".png"
#   png(file= name_z, width=1500, height=900, res=120)
#   plot(df1$x1, df1$y1, main = "LD plot" %+% name1 %+% "_" %+% name2 %+% "_" %+% xxx, xlab ="Distance", ylab = "LD", xlim=c(0, max(l)), ylim=c(0, max(y1)), type="n")
#   f1 <- rep(1/wind1, wind1)
#   y1_lag <- filter(df1$y1, f1, sides=1)
#   lines(df1$x1, y1_lag, col="red")
#   f2 <- rep(1/wind2, wind2)
#   y2_lag <- filter(df2$y2, f2, sides=1)
#   lines(df2$x2, y2_lag, col="blue")
#   legend("bottomleft", inset=0.05, legend=c(name1, name2), col=c("red", "blue"), pch=20, title="Legend")
#   dev.off()
#   # if (length(df1$x1) > 20000) {df1 <- df1[sample(nrow(df1), 20000), ]}
#   # if (length(df2$x2) > 20000) {df2 <- df2[sample(nrow(df2), 20000), ]}
#   # c1 <- cor.test(as.integer(df1$y1), as.integer(df1$x1), method = "kendall")
#   # c2 <- cor.test(as.integer(df2$y2), as.integer(df2$x2), method = "kendall")
#   # print(c1)
#   # print(c2)
#   df1 <- data.frame(x1, y1)
#   df2 <- data.frame(x2, y2)
#   print(paste("---","end iteration" , "---"))
# }
# print(paste("---","end builging plots" , "---"))
