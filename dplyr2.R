library(PogromcyDanych)
library(tidyr)

# zad. 3 cd #### 
data(auta2012)
View(auta2012)

dim(auta2012)[1] # liczba wierszy
dim(auta2012)[2] # liczba kolumn
nrow(auta2012)
ncol(auta2012)

# c
auta2012 %>% 
  filter(Marka == 'Volkswagen', Rodzaj.paliwa == 'benzyna') %>% 
  summarise(licznosc = n(), 
            procent = round(licznosc / nrow(auta2012) * 100,
                            2)
            )

# d
auta2012 %>% 
  group_by(Marka) %>% 
  summarise(cena.srednia = mean(Cena)) %>% 
  arrange(cena.srednia) -> marki.posort

najtansze <- head(marki.posort, 10)
najdrozsze <- tail(marki.posort, 10)

# e 
?quantile
str(quantile(auta2012$Cena))
quantile(auta2012$Cena)[c(2,4)]

auta2012 %>% 
  filter(Marka == 'Ford') %>% 
  select(Cena) %>% 
  summarise(Q1 = quantile(Cena, 0.25),
            Q3 = quantile(Cena, 0.75)) 

auta2012 %>% 
  filter(Marka == 'Ford') %>% 
  select(Cena) %>% 
  summary()

# f
auta2012 %>% 
  filter(Marka == 'Volkswagen', Model %in% c('Passat', 'Golf', 'Amarok')) %>% 
  group_by(Model) %>% 
  summarise(cena.srednia = mean(Cena),
            cena.mediana = median(Cena),
            przebieg.sredni = mean(Przebieg.w.km, na.rm = TRUE)) %>% 
  arrange(-przebieg.sredni)

?mean




