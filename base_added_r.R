library(mlxR)
library(ggplot2)
Paw <- list(name='Paw',time=seq(from=0, to=40, by=0.1))
KIN <- list(name='kin',time=seq(from=0, to=40, by=0.1))

p <- c(kgrow = 0.718,
       kin0 = 26,
       Imax = 0.289,
       Cp = 0,
       IC50 = 22.7,
       kout = 0.137,
       tonset = 14.5,
       Rdeg = 0.1,
       Paw0 = 64.8)

res <- simulx(model='base_added.txt', 
              parameter=p, 
              output=list(Paw, KIN))

ggplot(data=res$Paw, aes(x=time, y=Paw)) + geom_line(size=1) +
  PKPDmisc::base_theme() + scale_y_continuous(breaks = c(seq(40, 120, 10)))

print(ggplot(data=res$kin, aes(x=time, y=kin)) + geom_line(size=1))
