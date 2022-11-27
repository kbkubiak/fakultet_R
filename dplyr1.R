# dplyr ####
library(dplyr)

data(auta)
View(auta)
summary(auta)

# zad. 1 ####
# a 
filter(auta, Model == 'Astra')
auta[auta$Model == 'Astra', ]

filter(auta, Model == 'Astra', 
             Paliwo == 'diesel')
filter(auta, Model == 'Astra', 
             Paliwo == 'diesel', 
             Przebieg < 100000)
filter(auta, Model == 'Astra', 
             Paliwo == 'diesel', 
             Przebieg < 100000,
             Produkcja %in% c(2008, 2010, 2011))

# b
select(auta, Model, Marka, Cena)

# c
mutate(auta, Wiek = 2022 - Produkcja)

# d
arrange(auta, Cena) # rosnaco
arrange(auta, -Cena) # malejaco
auta.sort.po.markach <- arrange(auta, Marka, Cena)
View(auta.sort.po.markach)

# e
summarise(auta, cena.min = min(Cena), 
                cena.srednia = mean(Cena), 
                cena.max = max(Cena))

# f
summarise(group_by(auta, Marka), cena.min = min(Cena), 
                                 cena.srednia = mean(Cena), 
                                 cena.max = max(Cena))
# koty_ptaki
# wybierz zwierzeta, ktore osiagaja predkosc > 100 km/h
filter(koty_ptaki, predkosc > 100)
# wybierz zwierzeta, ktore osiagaja predkosc > 100 km/h i zamieszkuja
# Euroazje lub Afryke 
filter(koty_ptaki, predkosc > 100, habitat %in% c('Euroazja', 'Afryka'))
# wybierz kolumny z gatunkiem, dlugoscia i druzyna
select(koty_ptaki, gatunek, dlugosc, druzyna)
# utworz nowa kolumna z predkoscia wyrazona w milach/h
mutate(koty_ptaki, predkosc.mph = predkosc * 0.621)
# posortuj wiersze wzgledem masy 
arrange(koty_ptaki, waga)
# posortuj osobno ptaki i osobno koty wzgledem masy
arrange(koty_ptaki, druzyna, waga)
# wyznacz min, srednia i max predkosc w km/h dla calego zbioru
summarise(koty_ptaki, predk.min = min(predkosc), 
                      predk.srednia = mean(predkosc),
                      predk.mediana = median(predkosc),
                      predk.max = max(predkosc))
# wyznacz min, srednia i max predkosc w km/h 
# z podzialem ze wzgledu na druzyne
summarise(group_by(koty_ptaki, druzyna), predk.min = min(predkosc), 
                                         predk.srednia = mean(predkosc),
                                         predk.mediana = median(predkosc),
                                         predk.max = max(predkosc),
                                         licznosc = n())

# zad. 2 ####
# Jaki przebieg, cenê i rok produkcji maj¹ 4 najtañsze auta 
# marki Kia ze zbioru danych auta?

tylko.Kia <- filter(auta, Marka == 'Kia')
tylko.Kia.3kol <- select(tylko.Kia, Przebieg, Cena, Produkcja)
tylko.Kia.3kol.sorted <- arrange(tylko.Kia.3kol, Cena)
wynik <- head(tylko.Kia.3kol.sorted, 4)
View(wynik)

head(
  arrange(
    select(
      filter(auta, 
             Marka == 'Kia'), 
      Przebieg, Cena, Produkcja), 
    Cena), 
  4)

library(tidyr)

auta %>% 
  filter(Marka == 'Kia') %>% 
  select(Przebieg, Cena, Produkcja) %>% 
  arrange(Cena) %>% 
  head(4) -> wynik2

# zad. 3 ####
data(auta2012)
View(auta2012)
# a
auta2012 %>% 
  count(Marka) %>% 
  arrange(-n) %>% 
  head(1)

auta2012 %>% 
  group_by(Marka) %>% 
  summarise(licznosc = n()) %>% 
  arrange(-licznosc) %>% 
  head(1)

# b 
str(koty_ptaki)
str(a)
dim(koty_ptaki)
typeof(a)

auta2012 %>% 
  filter(Marka == 'Toyota') %>% 
  count(Rodzaj.paliwa) %>% 
  arrange(-n)

auta2012 %>% 
  filter(Marka == 'Toyota') %>% 
  group_by(Rodzaj.paliwa) %>% 
  summarise(licznosc = n()) %>% 
  arrange(-licznosc)




