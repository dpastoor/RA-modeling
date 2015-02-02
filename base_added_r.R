library(mlxR)
library(ggplot2)
library(dplyr)
Paw <- list(name='Paw',time=seq(from=0, to=40, by=0.1))
KIN <- list(name='kin',time=seq(from=0, to=40, by=0.1))


pdf <- data.frame(id = 1,
                  kgrow = 0.718,
                  kin0 = 26,
                  Imax = 0.289,
                  Cp = 0,
                  IC50 = 22.7,
                  kout = 0.137,
                  tonset = 14.5,
                  Rdeg = 0.1,
                  Paw0 = 64.8)

p <- c(id = 2,
  kgrow = 0.718,
       kin0 = 12,
       Imax = 0.289,
       Cp = 0,
       IC50 = 22.7,
       kout = 0.137,
       tonset = 14.5,
       Rdeg = 0.128,
       Paw0 = 64.8)

p2 <- c(id = 3,
       kgrow = 0.718,
       kin0 = 18,
       Imax = 0.289,
       Cp = 0,
       IC50 = 22.7,
       kout = 0.137,
       tonset = 14.5,
       Rdeg = 0.128,
       Paw0 = 55)

param <- rbind(pdf, p, p2)

res <- simulx(model='base_added.txt', 
              parameter=param, 
              output=list(Paw, KIN))

ggplot(data=res$Paw, aes(x=time, y=Paw, color = id)) + geom_line(size=1) +
  PKPDmisc::base_theme() + scale_y_continuous(breaks = c(seq(40, 120, 10)), limits = c(40, 120))
ggplot(data=res$Paw %>% filter(id == 2), aes(x=time, y=Paw)) + geom_line(size=1) +
  PKPDmisc::base_theme() + scale_y_continuous(breaks = c(seq(40, 120, 10)), limits = c(40, 80))
ggplot(data=res$Paw %>% filter(id == 1), aes(x=time, y=Paw)) + geom_line(size=1) +
  PKPDmisc::base_theme() + scale_y_continuous(breaks = c(seq(40, 120, 10)), limits = c(40, 120))


ggplot(data=res$kin, aes(x=time, y=kin, color = id)) + geom_line(size=1) + PKPDmisc::base_theme()

res
