# dplyr
library(dplyr)
library(tidyr)
library(PogromcyDanych)
library(Przewodnik)

# zad 1 ####
data(auta)
View(auta)

summary(auta)

?glimpse
glimpse(auta)

# a 
filter(auta, Model == 'Astra')
filter(auta, Model == 'Astra', Paliwo == 'diesel', Przebieg < 100000)
filter(auta, Model == 'Astra', Paliwo == 'diesel', Przebieg < 100000,
       Produkcja %in% c(2008, 2010, 2011))

# b
select(auta, Marka, Model, Cena)
select(auta, 1:3)

# c 
mutate(auta, Wiek = 2022 - Produkcja)

# d 
arrange(auta, Cena) # rosnaco
arrange(auta, -Cena)# malejaco

auta.sorted <- arrange(auta, Model, -Cena)
View(auta.sorted)

# e
summarise(auta, min(Cena), mean(Cena), max(Cena))
summarise(auta, 
          cena.min = min(Cena), 
          cena.srednia = mean(Cena), 
          cena.max = max(Cena))

# f
summarise(group_by(auta, Marka),
          cena.min = min(Cena), 
          cena.srednia = mean(Cena), 
          cena.max = max(Cena))

# zad 2 ####
View(auta)

# 1
auta.Kia <- filter(auta, Marka == 'Kia')
auta.Kia.sorted <- arrange(auta.Kia, Cena)
auta.Kia.sorted.4kol <-  select(auta.Kia.sorted, Przebieg, Cena, Produkcja, Model)
auta.Kia.sorted.4kol.najt <- head(auta.Kia.sorted.4kol, 4)

auta.Kia.sorted.4kol.najt

# 2
head(select(arrange(filter(auta, 
                           Marka == 'Kia'), 
                    Cena), 
            Przebieg, Cena, Produkcja, Model), 
     4)

# 3
auta %>% 
  filter(Marka == 'Kia') %>% 
  arrange(Cena) %>% 
  select(Przebieg, Cena, Produkcja, Model) %>% 
  head(4) -> najtansze.Kia

najtansze.Kia

# zad 3 ####
View(auta2012)

auta2012 %>% 
  select(-Wyposazenie.dodatkowe, -Status.pojazdu.sprowadzonego)

koty_ptaki %>% 
  count(druzyna) 

koty_ptaki %>% 
  group_by(druzyna) %>% 
  summarise(licznosc = n(), 
            srednia.predkosc = mean(predkosc))

# a
auta2012 %>% 
  count(Marka) %>% 
  arrange(-n) %>% 
  head(1)

sort(table(auta2012$Marka), decreasing = TRUE)[1]

# b
auta2012 %>% 
  filter(Marka == 'Toyota') %>% 
  group_by(Rodzaj.paliwa) %>% 
  summarise(licznosc = n()) %>% 
  arrange(-licznosc)

auta2012 %>% 
  filter(Marka == 'Toyota') %>% 
  count(Rodzaj.paliwa) %>% 
  arrange(-n)

# c
# sposob 1
auta2012 %>% 
  filter(Marka == 'Volkswagen', Rodzaj.paliwa == 'benzyna') %>% 
  summarise(licznosc = n()) -> licznosc.VW

auta2012 %>% 
  count() -> licznosc.wszystkie

round(licznosc.VW / licznosc.wszystkie * 100, 2)

# sposob 2
nrow(auta2012)

auta2012 %>% 
  filter(Marka == 'Volkswagen', Rodzaj.paliwa == 'benzyna') %>% 
  summarise(licznosc = n(),
            procent = round(licznosc / nrow(auta2012) * 100, 
                            2)
            )

# d
auta2012 %>% 
  group_by(Marka) %>% 
  summarise(cena.srednia = mean(Cena.w.PLN)) %>% 
  arrange(cena.srednia) -> srednie.ceny.rosn  # rosnaco

head(srednie.ceny.rosn, 10) -> marki.najtansze
tail(srednie.ceny.rosn, 10) -> marki.najdrozsze

# e 
auta2012 %>% 
  filter(Marka == 'Ford') %>% 
  summarise(Q1 = quantile(Cena.w.PLN, 0.25),
            Q3 = quantile(Cena.w.PLN, 0.75))

auta2012 %>% 
  filter(Marka == 'Ford') %>% 
  summarise(quantile(Cena.w.PLN))

auta2012 %>% 
  filter(Marka == 'Ford') %>% 
  select(Cena.w.PLN) %>% 
  summary()

# f
auta2012 %>% 
  filter(Marka == 'Volkswagen', Model %in% c('Passat', 'Golf', 'Amarok')) %>% 
  group_by(Model) %>% 
  summarise(cena.srednia =   mean(Cena.w.PLN),
            cena.mediana = median(Cena.w.PLN),
            przebieg.sredni = mean(Przebieg.w.km, na.rm = TRUE)) %>% 
  arrange(-przebieg.sredni)

