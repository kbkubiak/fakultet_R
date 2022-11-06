# ggplot2
library(ggplot2)
library(Przewodnik)

# zad 1 ####
View(countries)
summary(countries)

# a
ggplot(countries, aes(x = birth.rate, y = death.rate)) +
  geom_point() + 
  geom_smooth(se = FALSE, method = 'lm')

# b
ggplot(countries, aes(x = birth.rate, y = death.rate, col = continent)) +
  geom_point()

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

# f
ggplot(countries, aes(x = birth.rate, y = death.rate, 
                      col = continent, size = population)) +
  geom_point() +
  theme_minimal()

ggplot(countries, aes(x = birth.rate, y = death.rate, 
                      col = continent, size = population)) +
  geom_point() +
  theme_classic()

# zad 2 ####
library(ggthemes)

ggplot(countries, aes(x = birth.rate, y = death.rate)) +
  geom_point() + 
  theme_excel()

ggplot(countries, aes(x = continent, y = birth.rate)) +
  geom_boxplot() +
  theme_excel_new()

ggplot(countries, aes(x = birth.rate, y = death.rate)) +
  geom_point() +
  facet_wrap(~continent) +
  theme_economist()


# zad 3 ####
auta2012 %>% 
  filter(Marka == 'Skoda', Rok.produkcji == 2006) %>% 
  ggplot(aes(x = Cena.w.PLN, fill = Model)) + 
  geom_histogram(alpha = 0.5, col = 'white')





