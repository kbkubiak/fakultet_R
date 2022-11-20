setLang(lang = 'eng')

# zad. 3 ####
View(auta2012)
summary(auta2012)

auta2012 %>% 
  select(-Accessories)

colnames(auta2012)

View(cats_birds)

summary(cats_birds)

cats_birds %>% 
  count(group)

cats_birds %>% 
  group_by(group) %>% 
  summarise(licznosc = n(), 
            predkosc.srednia = mean(speed))

# a
auta2012 %>% 
  count(Brand) %>% 
  arrange(-n) %>% 
  head(1)

auta2012 %>% 
  group_by(Brand) %>% 
  summarise(licznosc = n()) %>% 
  arrange(-licznosc) %>% 
  head(1)

# b
auta2012 %>% 
  filter(Brand == 'Toyota') %>% 
  count(Type.of.fuel) %>% 
  arrange(-n)

# c
auta2012 %>% 
  filter(Brand == 'Volkswagen', Type.of.fuel == 'benzyna') %>% 
  count() -> liczba.vw.b

str(liczba.vw.b) # data frame

round(liczba.vw.b[1,1] / nrow(auta2012) * 100, 2)

auta2012 %>% 
  filter(Brand == 'Volkswagen', Type.of.fuel == 'benzyna') %>%
  summarise(licznosc.vw.b = n(),
            procent.vw.b  = round(licznosc.vw.b / nrow(auta2012) * 100, 2))
  
# d
auta2012 %>% 
  group_by(Brand) %>% 
  summarise(cena.srednia = mean(Price.in.PLN)) %>% 
  arrange(-cena.srednia) -> auta.sorted
  
top10.najdrozsze <- head(auta.sorted, 10)
top10.najtansze <- tail(auta.sorted, 10)
top10.najtansze.rosn <- arrange(top10.najtansze, cena.srednia)

# e
auta2012 %>% 
  filter(Brand == 'Ford') %>% 
  summarise(Q1 = quantile(Price.in.PLN, 0.25),
            Q3 = quantile(Price.in.PLN, 0.75))
  
auta2012 %>% 
  filter(Brand == 'Ford') %>% 
  select(Price.in.PLN) %>% 
  summary()

# f
auta2012 %>% 
  filter(Brand == 'Volkswagen', 
         Model %in% c('Passat', 'Golf', 'Amarok')) %>% 
  group_by(Model) %>% 
  summarise(cena.srednia = mean(Price.in.PLN),
            cena.median = median(Price.in.PLN),
            przebieg.sredni = mean(Mileage, na.rm = TRUE)) %>% 
  arrange(cena.srednia)
?mean

# ggplot2 ####
# zad.1 ####
library(Przewodnik)
View(countries)
summary(countries)

# a
ggplot(countries, aes(x = birth.rate, y = death.rate))

ggplot(countries, aes(x = birth.rate, y = death.rate)) +
  geom_point()

ggplot(countries, aes(x = birth.rate, y = death.rate)) +
  geom_point() +
  geom_smooth()

ggplot(countries, aes(x = birth.rate, y = death.rate)) +
  geom_point() +
  geom_smooth(method = 'lm', se = FALSE)

# b
ggplot(countries, aes(x = birth.rate, y = death.rate,
                      col = continent, size = population)) +
  geom_point()

# c
ggplot(countries, aes(x = continent, y = birth.rate)) +
  geom_boxplot()

ggplot(countries, aes(x = continent, y = death.rate)) +
  geom_boxplot()

# d
ggplot(countries, aes(x = continent)) +
  geom_bar()

# e 
ggplot(countries, aes(x = birth.rate, y = death.rate)) +
  geom_point() +
  facet_grid(~continent)

ggplot(countries, aes(x = birth.rate, y = death.rate)) +
  geom_point() +
  facet_wrap(~continent)

# zad. 2 ####
library(ggthemes)

ggplot(countries, aes(x = birth.rate, y = death.rate,
                      col = continent)) +
  geom_point() +
  theme_minimal()

ggplot(countries, aes(x = birth.rate, y = death.rate,
                      col = continent)) +
  geom_point() + 
  theme_excel_new()

ggplot(countries, aes(x = birth.rate, y = death.rate,
                      col = continent)) +
  geom_point() + 
  theme_economist()

ggplot(countries, aes(x = birth.rate)) +
  geom_histogram() +
  facet_wrap(~continent)


