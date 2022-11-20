install.packages("ggplot2") 
library(ggplot2) # zaladuj biblioteke

# komentarz do konca linii

?mean

# wektory ####
1:5 
a <- 1:5 
a
(a1 <- 6:10)

(b <- c(TRUE, FALSE, FALSE, TRUE, TRUE))

(c <- c(12, 6, NA, 17, 2)) # NA - brak w danych

?seq
(d <- seq(from = 1, to = 8, length.out = 5))

(d1 <- seq(from = 0, to = 25, by = 4))

?vector
e <- vector(mode = "character")
e[1] <- 'R'
e
?rep
e[2:5] <- rep('fakultet', times = 4)
e

a[1] # indeksowanie 

# zad. 1 ####
vec1 <- c(1, 15, 8, 13, 6, 4, 11)
?sort
sort(vec1)
sort(vec1, decreasing = TRUE)
vec1
vec1.sorted <- sort(vec1, decreasing = TRUE)

# zad. 2 ####
vec2 <- 10:50
sort(vec2, decreasing = TRUE)
rev(vec2)
rev(vec1)

# zad. 3 ####
vec3 <- seq(from = 2, to = 50, by = 2)

seq(from = 2, to = 50, length.out = 25)

vec3[c(3,5,6)] 

vec3.rem <- vec3[-c(3,5,6)]

length(vec3)
length(vec3.rem)

# zad. 4 ####
vec4 <- seq(from = 99, to = 1, by = -2)

vec4 == 11
which(vec4 == 11)
which(vec4 == 13)

vec4[-c(45, 44)]

vec4[-c(which(vec4 == 11), 
        which(vec4 == 13))]

ind11 <- which(vec4 == 11)
ind13 <- which(vec4 == 13)

vec4[-c(ind11, ind13)]

vec4[-which(vec4 %in% c(11, 13))]

indeksy <- which(vec4 %in% c(11, 13))
vec4[-indeksy]

vec4[!vec4 %in% c(11, 13)]

