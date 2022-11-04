install.packages("ggplot2") 
library(ggplot2)
detach("package::ggplot2", unload = T)
?detach # help

# komentarz do koñca 

# wektory
(a <- 1:5)
a
b <- c(TRUE, FALSE, FALSE, TRUE, TRUE)
(c <- c(12, 6, NA, 17, 2))

a[1]
b[1]
b[2:5]
c[c(1,3,5)]

length(a)
typeof(a)
typeof(b)
typeof(c)

a[-1] # usuwanie elementów wektora
a[-c(1,4,5)]
a[-(2:4)]

a[1] <- 11 # zmiana wartoœci wektora

(d <- seq(from = 1, to = 8, length.out = 5))
?seq

(d1 <- seq(from = 1, to = 8, by = 2))

?rep
(d2 <- rep(5, times = 10))
d3 <- rep(1:3, times = 3)
d4 <- rep(1:3, each = 3)

e <- vector(mode = "character")
e[1] <- 'R'
e[2:5] <- rep('fakultet', 4)
e

# ramki danych
ramka <- data.frame(a, b, c)
View(ramka)

data.frame(a, d1) # wektory musza miec rowna dlugosc 

ramka2 <- cbind(ramka, d, e)
View(ramka2)

colnames(ramka)
colnames(ramka2)

ramka$a
ramka[2,3]
ramka[ ,1] # jak ramka$a, kolumna nr 1
ramka[1, ] # wiersz nr 1

# zad 1 ####
v1 <- c(1, 15, 8, 13, 6, 4, 11)
v1.sorted.asc <- sort(v1) # rosnaco
?sort
v1.sorted.desc <- sort(v1, decreasing = TRUE) # malejaco

# zad 2 ####
v2 <- 10:50
v2.reversed <- rev(v2)

# zad 3 ####
v3 <- seq(from = 2, to = 50, by = 2)
length(v3)

v3.rem <- v3[-c(3,5,6)]

# zad 4 ####
v4 <- seq(from = 99, to = 1, by = -2)
# sposob 1
v4[!v4 %in% c(11,13)]

v4[v4 %in% c(11,13)]
v4[!v4 %in% c(11,13)]

# sposob 2
?which
which(v4 == 11) # == warunek logiczny: czy jest rowny?
which(v4 == 13)

v4[-c(which(v4 == 11), 
      which(v4 == 13))]

ind11 <- which(v4 == 11)
ind13 <- which(v4 == 13)

v4[-c(ind11, ind13)]

# zad 5 ####
v5 <- rep(c(4,6,8), times = 4)
v5[1:3] <- NA # zastap brakami w danych
v5
is.na(v5) # ktore elty sa brakami w danych?
length(is.na(v5))
sum(is.na(v5))
sum(a) # suma wszystkich eltów wektora a 

v5.1 <- rep(c(4,6,8), times = 4)
v5.rem <- v5.1[-(1:3)] # usun elementy od pierszego do trzeciego

# zad 6 ####
?range
range(v4) # min i max wektora

?sample
wiek <- sample(x = 20:60, size = 30, replace = TRUE)

mean(wiek)
var(wiek)
sd(wiek)
median(wiek)
Q1 <- quantile(wiek, 0.25) # kwartyl 1, czyli centyl 25
quantile(wiek, 0.5)  # kwartyl 2, czyli centyl 50, czyli mediana
Q3 <- quantile(wiek, 0.75) # kwartyl 3, czyli centyl 75
Q3 - Q1 # IQR 
IQR(wiek)
min(wiek)
max(wiek)
range(wiek)

summary(wiek)

# zad 8 ####
imie <- c('Ania', 'Ada', 'Kuba', 'Bartek', 'Ewa')
wzrost <- c(163, 159, 176, 182, 167)

osoby <- data.frame(imie, wzrost)
View(osoby)
summary(osoby)

# zad 9 ####
data.set9 <- read.table("C:/Users/student/Downloads/Table1.txt", 
                        quote="\"", comment.char="")
View(data.set9)

colnames(data.set9) <- c('Imie', 'Wiek', 'Wzrost', 'Masa', 'Plec')
colnames(data.set9)
