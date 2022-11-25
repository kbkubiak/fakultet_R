# wektory ####
1:5
a <- 1:5
a

-3:3

(a1 <- c(12, 15, 16, 15.6, -3.5))

c(TRUE, FALSE, FALSE, TRUE, TRUE)
b <- c(TRUE, FALSE, FALSE, TRUE, TRUE)

c(12, 6, NA, 17, 2)
c <- c(12, 6, NA, 17, 2)

seq(from = 1, to = 11, by = 3)
seq(from = 1, to = 20, length.out = 4)
seq(from = 1, to = 20, length.out = 10)

?seq

(d <- seq(from = 1, to = 8, length.out = 5))

'R'

a[3]
a[c(1,2,4)]
b[c(1,2,4)]

zwierz <- c('pies', 'kot', 'kon', 'ptak', 'mysz')

e <- vector(mode = 'character')
e[1] <- 'R'

e[2:5] <- rep('fakultet', times = 4)
?rep
e

g <- c('R')
g[2:5] <- rep('fakultet', times = 4)
g

# zad. 1 ####
vec1 <- c(1, 15, 8, 13, 6, 4, 11)
sort(vec1)
?sort
sort(vec1, decreasing = TRUE)

# zad. 2 ####
vec2 <- 10:50
50:10
rev(vec2)
rev(vec1)

# zad. 3 ####
vec3 <- seq(from = 2, to = 50, by = 2)
vec3[-c(3,5,6)]
length(vec3)
length(vec3[-c(3,5,6)])
vec3.rem <- vec3[-c(3,5,6)]
length(vec3.rem)

# zad. 4 ####
rev(seq(from = 1, to = 99, by = 2))

vec4 <- seq(from = 99, to = 1, by = -2)
length(vec4)

# sposob 1
ind11 <- which(vec4 == 11)
ind13 <- which(vec4 == 13)

vec4[-c(ind11, ind13)]

# sposob 2
ind1113 <- which(vec4 %in% c(11, 13))
vec4[-ind1113]

# sposob 3
vec4[vec4 %in% c(11, 13)]
vec4[!vec4 %in% c(11, 13)]
