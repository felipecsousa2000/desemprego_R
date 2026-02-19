dados <- read.csv("C:/Users/X/Downloads/desemprego - Página1.csv")
head(dados)
str(dados)
summary(dados)


#Etapa 2 análise por região
library(dplyr)

desemprego_medio<-dados %>%
  group_by(regiao) %>%
  summarise(media_desemprego = mean(taxa_desemprego))

desemprego_medio

#Etapa 3 
library(ggplot2)
ggplot(desemprego_medio, aes(x=regiao, y=media_desemprego))+
  geom_bar(stat = "identity")+
  labs(
    title="Taxa Média de Desemprego por Região",
    x="Região",
    y="Taxa de Desemprego"
  )


#Etapa 4 - Evoluação ao longo do tempo
ggplot(dados, aes(x=ano, y=taxa_desemprego, color=regiao))+
  geom_line(size = 1.2)+
  labs(
    title = "Evolução do Desemprego por Região",
    x="Ano",
    y="Taxa de Desemprego (%)"
  )



