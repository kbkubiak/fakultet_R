library(ggplot2)
library(Przewodnik)

# zad. 1 ####
View(countries)
summary(countries)

hist(countries$birth.rate)

# a 
ggplot(countries, aes(x = birth.rate, y = death.rate)) +
  geom_point()

ggplot(countries, aes(x = birth.rate, y = death.rate)) +
  geom_point() +
  geom_smooth()

ggplot(countries, aes(x = birth.rate, y = death.rate)) +
  geom_point() +
  geom_smooth(se = FALSE, method = 'lm')

# b 
ggplot(countries, aes(x = birth.rate, y = death.rate,
                      col = continent)) +
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
  facet_wrap(~continent) +
  labs(title = "[miejsce na tytu³]",
       subtitle = "[miejsce na podtytu³]") +
  xlab('Birth rate') +
  ylab('Death rate')

# f
ggplot(countries, aes(x = birth.rate)) +
  geom_histogram() +
  theme_minimal()

ggplot(countries, aes(x = birth.rate, y = death.rate,
                      col = continent, size = population)) +
  geom_point() +
  theme_minimal()

library(ggthemes)

