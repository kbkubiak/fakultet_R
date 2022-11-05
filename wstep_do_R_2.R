# zadanie 10 ####
library(Przewodnik)
View(koty_ptaki)

summary(koty_ptaki)

?head
head(koty_ptaki, 1)
tail(koty_ptaki, 1)

koty_ptaki[c(1,5,8), 1:3]

# zad 11 ####
View(daneSoc)
summary(daneSoc)

table(daneSoc$wyksztalcenie)
table(daneSoc$plec, daneSoc$wyksztalcenie)
table(daneSoc$wyksztalcenie, daneSoc$plec)
table(daneSoc$praca, daneSoc$wyksztalcenie)

# zad 12 ####
?barplot

barplot(daneSoc$wyksztalcenie) # argumentem musi byc wektor (lub macierz) licznosci
barplot(table(daneSoc$wyksztalcenie))

tab.wyksztalcenie <- table(daneSoc$wyksztalcenie)
barplot(tab.wyksztalcenie)
barplot(tab.wyksztalcenie, horiz = TRUE, las = 1, col = 'darkblue')

tab.pl.wy <- table(daneSoc$plec, daneSoc$wyksztalcenie)
tab.wy.pl <- table(daneSoc$wyksztalcenie, daneSoc$plec)

# wersja 1 & 2
barplot(tab.pl.wy, col = c('darkblue', 'darkred'), horiz = TRUE, las = 1)
barplot(tab.pl.wy, beside = TRUE, col = c('darkblue', 'darkred'), horiz = TRUE, las = 1)
?legend
legend('topright', c('kobieta', 'mezczyzna'), fill = c('darkblue', 'darkred'))

# wersja 3 & 4
barplot(tab.wy.pl)

# zad 13 ####
?hist
hist(daneSoc$wiek, 
     main = 'Histogram wieku',
     xlab = 'Wiek', 
     ylab = 'Licznoœæ')

hist(daneSoc$wiek, probability = TRUE)

hist(daneSoc$wiek, 
     main = 'Histogram wieku',
     xlab = 'Wiek', 
     ylab = 'Licznoœæ',
     col = 'lightblue', 
     border = 'darkblue',
     xlim = c(20, 80))

hist(daneSoc$wiek,
     breaks = seq(20, 80, length.out = 15))

hist(daneSoc$wiek, right = FALSE, breaks = seq(20, 80, by = 5)) 

summary(daneSoc)

# zad 14 ####
boxplot(daneSoc$wiek)

?boxplot

boxplot(daneSoc$cisnienie.rozkurczowe, daneSoc$cisnienie.skurczowe,
        names = c('rozkurczowe', 'skurczowe'),
        main = 'Cisnienie')

boxplot(daneSoc$cisnienie.rozkurczowe, daneSoc$cisnienie.skurczowe,
        names = c('rozkurczowe', 'skurczowe'),
        main = 'Cisnienie',
        horizontal = TRUE)

boxplot(wiek~wyksztalcenie, data = daneSoc)
boxplot(cisnienie.rozkurczowe~wyksztalcenie, data = daneSoc)
boxplot(cisnienie.skurczowe~wyksztalcenie, data = daneSoc)

# zad 15 ####
car::scatterplot(cisnienie.rozkurczowe~cisnienie.skurczowe, 
                 data = daneSoc,
                 regLine = TRUE, # dopasowuje linie prosta
                 smooth = FALSE)

