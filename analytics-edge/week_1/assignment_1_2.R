IBM <- read.csv("IBMStock.csv")
GE <- read.csv("GEStock.csv")
CocaCola <- read.csv("CocaColaStock.csv")
ProcterGamble <- read.csv("ProcterGambleStock.csv")
Boeing <- read.csv("BoeingStock.csv")

IBM$Date <- as.Date(IBM$Date, "%m/%d/%y")
GE$Date <- as.Date(GE$Date, "%m/%d/%y")
CocaCola$Date <- as.Date(CocaCola$Date, "%m/%d/%y")
ProcterGamble$Date <- as.Date(ProcterGamble$Date, "%m/%d/%y")
Boeing$Date <- as.Date(Boeing$Date, "%m/%d/%y")

mean(IBM$StockPrice)
min(GE$StockPrice)
max(CocaCola$StockPrice)
median(Boeing$StockPrice)
sd(ProcterGamble$StockPrice)

plot(CocaCola$Date, CocaCola$StockPrice, type="l", col="red")
lines(ProcterGamble$Date, ProcterGamble$StockPrice, col="blue")

plot(CocaCola$Date[301:432], 
     CocaCola$StockPrice[301:432], 
     type = "l", col = "red", ylim = c(0,210))
lines(ProcterGamble$Date[301:432], 
      ProcterGamble$StockPrice[301:432],
      col="blue")
lines(Boeing$Date[301:432], 
      Boeing$StockPrice[301:432],
      col="black")
lines(GE$Date[301:432], 
      GE$StockPrice[301:432],
      col="purple")
lines(IBM$Date[301:432], 
      IBM$StockPrice[301:432],
      col="orange")
abline(v = as.Date(c("2000-01-01")), lty = 2)
abline(v = as.Date(c("1997-09-01")), lty = 2)
abline(v = as.Date(c("1997-11-01")), lty = 2)
abline(v = as.Date(c("2004-01-01")), lty = 2)
abline(v = as.Date(c("2005-12-31")), lty = 2)

tapply(IBM$StockPrice, months(IBM$Date), mean)
mean(IBM$StockPrice)

which.max(tapply(CocaCola$StockPrice, months(CocaCola$Date), mean))
which.max(tapply(GE$StockPrice, months(GE$Date), mean))

tapply(CocaCola$StockPrice, months(CocaCola$Date), mean)
tapply(GE$StockPrice, months(GE$Date), mean)

rm(Boeing, CocaCola, GE, IBM, ProcterGamble)
