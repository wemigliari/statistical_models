library(readxl)
library(ggplot2)
library(hrbrthemes)
library(ggforce)
library(gghighlight)

analise_geometrica <- read_xlsx("/Users/wemigliari/Documents/R/tabelas/analise_geometrica.xlsx")


ggplot(analise_geometrica, aes(Conservador,
                              Progressista, 
                              size=3)) +
  geom_point(alpha=0.3) +
  geom_text(aes(label = analise_geometrica$Tema), size = 1.5) +
  scale_size(range = c(6, 7)) +
              xlim(-1,1)+
              ylim(-1,1)+
              theme_ipsum() +
              theme(
                legend.position="none",
                plot.title = element_text(size=11))+
              geom_hline(yintercept=0)+
              geom_vline(xintercept=0) +
  labs(title="Capital Cultural/Moradia e Cidade",
        x ="Tradição", y = "Mudança") +
  annotate("text", 
           -0.6, 0.8, 
           label = "Reformas Profundas", 
           color = "steelblue", 
           size=2) +
  annotate("text", 
           0.6, 0.8, 
           label = "Privatização", 
           color = "steelblue", 
           size=3.5) +
  annotate("text", 
           0.2, 0.3, 
           label = "Corrupção", 
           color = "steelblue", 
           size=4.5) +
  annotate("text", 
           -0.5, -0.3, 
           label = "Emprego", 
           color = "steelblue", 
           size=3) +
  annotate("text", 
           -0.1, 0.3, 
           label = "Eleições", 
           color = "steelblue", 
           size=3) +
  annotate("text", 
           0.6, 0.5, 
           label = "Polarização", 
           color = "steelblue", 
           size=3) +
  annotate("text", 
           0.9, 0.5, 
           label = "Banqueiros", 
           color = "gray", 
           size=3) +
  annotate("text", 
           0.9, 0.7, 
           label = "Imprensa", 
           color = "gray", 
           size=3) 

  


ggplot() +
  geom_point(data = analise_geometrica, aes(x = Conservador,
                                            y = Progressista, 
                                            colour = Entrevistado,
                                            size=Conservador,
                                            alpha = 0.05)) +
  
  scale_size(range = c(2, 10)) +
  xlim(-1,1)+
  ylim(-1,1)+
  theme_ipsum() +
  theme(
    legend.position="none",
    plot.title = element_text(size=11))+
  geom_hline(yintercept=0)+
  geom_vline(xintercept=0) +
  labs(title="Capital Cultural/Moradia e Cidade",
       x ="", y = "") +
  annotate("text", 
           -0.6, 0.8, 
           label = "Reformas Profundas", 
           color = "steelblue", 
           size=4) +
  annotate("text", 
           0.6, 0.8, 
           label = "Privatização", 
           color = "steelblue", 
           size=6) +
  annotate("text", 
           0.2, 0.3, 
           label = "Corrupção", 
           color = "steelblue", 
           size=7.5) +
  annotate("text", 
           -0.5, -0.1, 
           label = "Emprego", 
           color = "steelblue", 
           size=7) +
  annotate("text", 
           -0.1, 0.1, 
           label = "Eleições", 
           color = "steelblue", 
           size=7) +
  annotate("text", 
           0.6, 0.5, 
           label = "Polarização", 
           color = "steelblue", 
           size=8) +
  annotate("text", 
           0.9, 0.5, 
           label = "Banqueiros", 
           color = "gray", 
           size=2) +
  annotate("text", 
           0.9, 0.7, 
           label = "Imprensa", 
           color = "gray", 
           size=5) 


ggplot(data = analise_geometrica, aes(x = Conservador,
                                      y = Progressista, 
                                      group = Entrevistado,
                                      size = Conservador,
                                      alpha = 0.05)) +
  geom_point(aes(shape=Entrevistado, 
                 color=Entrevistado)) +
  
  scale_size(range = c(2, 10)) +
  xlim(-1,1)+
  ylim(-1,1)+
  theme_ipsum() +
  theme(
    legend.position="none",
    plot.title = element_text(size=11))+
  geom_hline(yintercept=0)+
  geom_vline(xintercept=0) +
  labs(title="Capital Cultural, n = 114",
       x ="", y = "") +
  annotate("text", 
           -0.6, 0.8, 
           label = "Reformas Profundas", 
           color = "gray", 
           size=4) +
  annotate("text", 
           0.6, 0.8, 
           label = "Privatização", 
           color = "gray", 
           size=6) +
  annotate("text", 
           0.2, 0.3, 
           label = "Corrupção", 
           color = "gray", 
           size=7.5) +
  annotate("text", 
           -0.5, -0.1, 
           label = "Emprego", 
           color = "gray", 
           size=7) +
  annotate("text", 
           -0.1, 0.1, 
           label = "Eleições", 
           color = "gray", 
           size=7) +
  annotate("text", 
           0.6, 0.7, 
           label = "Polarização", 
           color = "gray", 
           size=8) +
  annotate("text", 
           0.9, 0.9, 
           label = "Banqueiros", 
           color = "gray", 
           size=3) +
  annotate("text", 
           0.9, 0.8, 
           label = "Imprensa", 
           color = "gray", 
           size=4) +
  annotate("text", 
           -0.5, 0.5, 
           label = "Progressista", 
           color = "black", 
           size=3) +
  annotate("text", 
           -0.5, -0.5, 
           label = "Conservador", 
           color = "black", 
           size=3) +
  annotate("text", 
           0.5, 0.5, 
           label = "Conservador", 
           color = "black", 
           size=3) +
  annotate("text", 
           0.5, -0.5, 
           label = "Progressista", 
           color = "black", 
           size=3)

