# Tests estadísticos en RStudio

Este repositorio contiene algunos ejemplos de pruebas estadísticas para analizar conjuntos de datos en R.

## Contenidos (Última actualización 21/11/2021)

1. Test estadístico ANOVA con aplicación en un caso específico 
2. Función para test de nivel asintótico. 


## Uso de los tests

Para usar los tests, primero se debe instalar el lenguaje R. En Ubuntu puede realizarse en terminal ejecutando los siguientes comandos:
```bash
$ sudo apt update
$ sudo apt -y install r-base gdebi-core
```
Luego de descargar el software RStudio (que funciona en base a R) [del sitio oficial](https://rstudio.com/products/rstudio/download/#download), se procede a instalarlo. 

```bash
$ ls
rstudio-1.2.5019-amd64.deb # Ejemplo de archivo .deb descargado, el nombre puede variar según la versión
$ sudo gdebi rstudio-1.2.5019-amd64.deb
```
Una vez instalado, puede ejecutarse RStudio  mediante la terminal:
```bash
$ rstudio
```
En dicha plataforma podrán abrir los archivos correspondientes a los tests e importar los datasets sobre los cuales se realizarán los tests.
## Contribuciones
Se aceptan pull requests!
