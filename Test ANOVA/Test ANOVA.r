# Test ANOVA

# La situación problema consiste en cinco insecticidas, para los cuales se
# analizó el tiempo en que hacen caer a mosquitos al suelo luego de rociarlos.
# Esta información se encuentra en el archivo mosquito.csv y se procederá a
# analizarla. 

# 1 - Instalación de dependencias:
install.packages("RcppEigen")
install.packages("lme4")
install.packages("pbkrtest")
install.packages("car")
library(car)
library(ggplot2)

# 2 - Creación de un boxplot para visualizar los datos
boxplot_mosquito <- ggplot(mosquito, 
                           aes(x = Insecticida, 
                               y = Tiempo)) + 
                    geom_boxplot() + 
                    stat_boxplot(geom="errorbar")

boxplot_mosquito
# Como se puede visualizar en el boxplot, los datos no poseen homocedasticidad
# por lo cual hay que realizar una transformación de los datos.

# 3 - Transformación de los datos y creación del nuevo boxplot
mosquito$log.tiempo = log10(mosquito$Tiempo)
head(mosquito) # Acá puede visualizarse la creación de la nueva variable

boxplot_mosquito <- ggplot(mosquito, 
                           aes(x = Insecticida, 
                               y = log.tiempo)) + 
                    geom_boxplot() + 
                    stat_boxplot(geom="errorbar")
boxplot_mosquito  # Los datos parecen tener homocedasticidad

# 4 - Análisis estadístico
#     Primero se realizará el ANOVA y luego se probarán los supuestos
mosquito_anova = aov(mosquito$log.tiempo~factor(mosquito$Insecticida))
summary(mosquito_anova)

# Probar igualdad de varianzas
bartlett.test(mosquito$log.tiempo, mosquito$Insecticida)

# Test de residuos
shapiro.test(mosquito_anova$res)
shapiro.test(residuals(mosquito_anova))

# Test de Levene para homogeneidad de varianzas
leveneTest(mosquito$log.tiempo, mosquito$Insecticida)

# Gráfico de ANOVA
plot(mosquito_anova)

# Test de Bonferroni:
pairwise.t.test(mosquito$log.tiempo, mosquito$Insecticida, p.adjust="bonferroni")

# Test de Tuckey;
TukeyHSD(mosquito_anova, conf.level= 0.95)

