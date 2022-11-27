# zad. 5 ####
?rep
rep(c(4, 6, 8), times = 4)
rep(c(4, 6, 8), each = 4)
rep(seq(from = 4, to = 8, by = 2), times = 4)

vec5 <- rep(c(4, 6, 8), times = 4)
vec5[1:3] <- NA
vec5

# zad. 6 ####
?runif
runif(30, min = 20, max = 60)
?sample
sample(20:60, size = 30, replace = TRUE)

wiek <- sample(20:60, size = 30, replace = TRUE)
hist(wiek)

wiek2 <- sample(20:60, size = 1000, replace = TRUE)
hist(wiek2)

mean(wiek)
sd(wiek)
var(wiek)
median(wiek)
min(wiek)
max(wiek)
IQR(wiek)

summary(wiek)

# ramki danych ####
a <- 1:5
b <- c(TRUE, FALSE, FALSE, TRUE, TRUE)
c <- c(12, 6, NA, 17, 2)
d <- seq(from = 1, to = 8, length.out = 5)
e <- c("R", rep('fakultet', times = 4))

data.frame(a, b, c)
ramka <- data.frame(a, b, c)
View(ramka)

cbind(ramka, d, e)
cbind(d, e, ramka)

ramka2 <- cbind(ramka, d, e)

summary(ramka2)

colnames(ramka2)

ramka2$b
ramka2$b[2]

ramka2[,2]
ramka2[2,]

ramka2[3, 4]
ramka2[1:3, c(1,4,5)]
ramka2[1:3, c('a', 'd', 'e')]

# zad. 8 ####
imie <- c('Ada', 'Ania', ' Asia', 'Aga', 'Ola')
wzrost <- c(160, 159, 172, 171, 168)
osoby <- data.frame(imie, wzrost)
View(osoby)

# zad. 9 ####
Table1 <- read.table("C:/Users/student/Downloads/Table1.txt", quote="\"", comment.char="")
View(Table1)

colnames(Table1) <- c('Imie', 'Wiek', 'Wzrost', 'Masa', 'Plec')
colnames(Table1)
View(Table1)

# zad. 10 ####
library(Przewodnik)

data("koty_ptaki")
View(koty_ptaki)

summary(koty_ptaki)

head(koty_ptaki, 3)
tail(koty_ptaki, 1)

koty_ptaki[c(1,5,8), 1:3]

# zad. 11 ####
data(daneSoc)
View(daneSoc)

summary(daneSoc)
summary(daneSoc$cisnienie.skurczowe)

?table
table(daneSoc$wyksztalcenie)
table(daneSoc$wyksztalcenie, daneSoc$plec)
table(daneSoc$plec, daneSoc$wyksztalcenie)

