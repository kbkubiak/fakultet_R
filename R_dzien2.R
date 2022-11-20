# zad. 5 ####
?rep
c(4,6,8)
seq(from = 4, to = 8, by = 2)

rep(c(4,6,8), times = 4)
rep(c(4,6,8), each = 4)
rep(c(4,6,8), times = c(4,7,3))

vec5 <- rep(c(4,6,8), times = 4)
vec5[1:3]
vec5[c(1,2,3)]
vec5[1:3] <- NA
vec5
vec5[1:3] <- c(11,13,17)
vec5

?replace
vec5.1 <- rep(c(4,6,8), times = 4)
vec5.1.na <- replace(vec5.1, 1:3, NA)

# zad. 6 ####
seq(from = 20, to = 60, length.out = 30)
?round
round(seq(from = 20, to = 60, length.out = 30))
floor(seq(from = 20, to = 60, length.out = 30))
ceiling(seq(from = 20, to = 60, length.out = 30))

?runif
round(runif(30, min = 20, max = 60))

?sample
wiek <- sample(20:60, size = 30, replace = TRUE)

mean(wiek)
median(wiek)
var(wiek)
sd(wiek)
IQR(wiek)
min(wiek)
max(wiek)

summary(wiek)

# ramki danych ####
a <- 1:5 
b <- c(TRUE, FALSE, FALSE, TRUE, TRUE)
c <- c(12, 6, NA, 17, 2)
d <- seq(from = 1, to = 8, length.out = 5)
e <- vector(mode = "character")
e[1] <- 'R'
e[2:5] <- rep('fakultet', times = 4)

data.frame(a, b, c)
ramka1 <- data.frame(a, b, c)
View(ramka1)

?cbind
cbind(ramka1, d, e)
ramka2 <- cbind(ramka1, d, e)
View(ramka2)

colnames(ramka2)

ramka2[2,3]
ramka2[2,]  # wybierz caly wiersz 2
ramka2[,3]  # wybierz cala kolumne 3

ramka2$a
ramka2$a[4]

# zad. 8 ####
imie <- c('Ada', 'Ania', 'Ola', 'Piotr', 'Ewa')
wzrost <- c(159, 172, 167, 163, 175)
osoby <- data.frame(imie, wzrost)
View(osoby)

# zad. 9 ####
colnames(Table1) <- c('Imie', 'Wiek', 'Wzrost', 'Masa', 'Plec')
colnames(Table1)
View(Table1)



# zad. 10 ####
library(Przewodnik)

View(koty_ptaki)
summary(koty_ptaki)

koty_ptaki[1,]
koty_ptaki[13,]
nrow(koty_ptaki)
koty_ptaki[nrow(koty_ptaki),]

koty_ptaki[c(1,5,8), 1:3]

# zad. 11 ####
View(daneSoc)
summary(daneSoc)

var(daneSoc$cisnienie.skurczowe)
sd(daneSoc$cisnienie.skurczowe)

table(daneSoc$wyksztalcenie)

table(daneSoc$wyksztalcenie, daneSoc$plec)
table(daneSoc$plec, daneSoc$wyksztalcenie)


# dplyr ####
library(PogromcyDanych)
library(dplyr)
library(tidyr)

# zad. 1 ####
data(auta)
View(auta)
summary(auta)

# a
filter(auta, Model == 'Astra')
filter(auta, Model == 'Astra', Paliwo == 'diesel', Przebieg < 100000)
filter(auta, Model == 'Astra', 
             Paliwo == 'diesel', 
             Przebieg < 100000,
             Produkcja %in% c(2008, 2010, 2011))

# b 
select(auta, Marka, Model, Cena)

# c
mutate(auta, Wiek = 2022 - Produkcja)

# d
arrange(auta, Cena)  # rosnaco
arrange(auta, -Cena) # malejaco

auta.posortowane <- arrange(auta, Model, Cena)
View(auta.posortowane)

# e
summarise(auta, cena.min = min(Cena), 
                cena.srednia = mean(Cena), 
                cena.max = max(Cena))


# f
summarise(group_by(auta, Marka), 
          cena.min = min(Cena),
          cena.srednia = mean(Cena),
          cena.max = max(Cena))

# zad. koty_ptaki ####
# wybierz zwierzeta o masie powyzej 50 kg, zamieszkujace w Azji lub Afryce 
filter(koty_ptaki, waga > 50, habitat %in% c('Azja', 'Afryka'))

# wybierz kolumny gatunek, dlugosc, predkosc
select(koty_ptaki, gatunek, dlugosc, predkosc)

# utworz nowa kolumne z predkoscia wyrazona w milach na h
mutate(koty_ptaki, predkosc.mph = predkosc * 0.62)

# posortuj wzgledem predkosci rosnaco i malejaco
arrange(koty_ptaki, predkosc)
arrange(koty_ptaki, -predkosc)

# posortuj osobno ptaki i osobno koty wzgledem predkosci 
arrange(koty_ptaki, druzyna, predkosc)

# wyznacz min, max, srednia predkosc dla kotow i dla ptakow 
summarise(group_by(koty_ptaki, druzyna), 
          predkosc.min = min(predkosc),
          predkosc.srednia = mean(predkosc),
          predkosc.max= max(predkosc))

head(koty_ptaki, 2)
tail(koty_ptaki, 3)

# zad. 2 ####
tylko.Kia <- filter(auta, Marka == 'Kia')
tylko.Kia.3kol <- select(tylko.Kia, Model, Przebieg, Cena, Produkcja)
tylko.Kia.3kol.sorted <- arrange(tylko.Kia.3kol, Cena)
head(tylko.Kia.3kol.sorted, 4)

head(
  arrange(
    select(
      filter(auta, Marka == 'Kia'), 
      Model, Przebieg, Cena, Produkcja), 
    Cena),
  4)

library(tidyr)

auta %>% 
  filter(Marka == 'Kia') %>% 
  select(Model, Przebieg, Cena, Produkcja) %>% 
  arrange(Cena) %>% 
  head(4) -> najtansze.Kia


