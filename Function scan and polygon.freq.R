
library(dplyr) ### Carregar a bibioteca

### A

x <- scan() ### Depois do comando "x <- scan(), 
# inserir os valores, exemplo, 123, 456 e 789, e teclar "Enter". Digitar no CONSOLE.

  
x #Ler os valores armazenados.

### B
### Transformar os valores armazenados em forma de "string" que estão em x
### em um dataframe, isto é, "tabela".

tabela1 <- data.frame(x)
tabela1

### C
### Vetores. Basta digitar uma sequência numérica e separá-la por : . Exemplo:

vetor1 <- 1:10
vetor1

### D
### Média

mean(x = 1:10)

### E
### Variança

var(x = 1:10)

### F
### Distribuição Normal

n <- rnorm(50, mean = 1, sd = 2) 
n
plot(n) ### Imprimir a distribuição.

### G
### Distribuição de Probabilidade

p <- pnorm(n)
p
plot(p)

### H
### Histograma

h <- hist(n)
h ### Veja os dados de seu histograma.

library(agricolae) ### Firulas ...
h <- hist(n)
polygon.freq(h, col="red", lwd=2, frequency=1, density=10)



