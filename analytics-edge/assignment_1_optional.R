poll <- read.csv("AnonymityPoll.csv")

nrow(poll)

sum(is.na(poll$Smartphone))
table(poll$Smartphone)

# table(poll$Sex, poll$Region)
which.max(table(poll$State, poll$Region)[, 3])
sort(table(poll$State, poll$Region)[, 1], decreasing = T)

nrow(subset(poll, Internet.Use == 0 & Smartphone == 0))
nrow(subset(poll, Internet.Use == 1 & Smartphone == 1))
nrow(subset(poll, Internet.Use == 1 & Smartphone == 0))
nrow(subset(poll, Internet.Use == 0 & Smartphone == 1))

sum(is.na(poll$Internet.Use))
sum(is.na(poll$Smartphone))

limited <- subset(poll, Internet.Use == 1 | Smartphone == 1)
nrow(limited)
summary(limited)

mean(limited$Info.On.Internet)

table(limited$Info.On.Internet)[c('0', '11')]

table(limited$Worry.About.Info)[2] / (sum(!is.na(limited$Worry.About.Info)))

prop.table(table(limited$Anonymity.Possible))[2]

prop.table(table(limited$Tried.Masking.Identity))[2]

prop.table(table(limited$Privacy.Laws.Effective))[2]

hist(limited$Age, breaks = 10)

max(table(limited$Age, limited$Info.On.Internet))

plot(limited$Age, limited$Info.On.Internet)
jitter(c(1, 2, 3))
plot(jitter(limited$Age), jitter(limited$Info.On.Internet))

tapply(limited$Info.On.Internet, limited$Smartphone, mean)

tapply(limited$Tried.Masking.Identity, 
       limited$Smartphone, mean, na.rm = T)
