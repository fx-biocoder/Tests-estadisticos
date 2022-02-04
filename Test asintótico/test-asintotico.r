# TEST DE NIVEL ASINTÓTICO

# x = numero de exitos
# n = tamaño de la muestra
# p0 = hipotesis nula
# tipo = two.sided (test bilateral), greater (test unilateral a derecha), less (test unilateral a izquierda)
p.test.a = function(x, n, p0, tipo){
  z_obs = (((x/n) - p0)/(sqrt(n(1 - n)))) * sqrt(n)
  
  if(tipo == "two.sided"){ 
    p.valor = 2 * (1 - pnorm(abs(z_obs)))
  } else {
    if(tipo == "greater"){
      p.valor = 1 - pnorm(z_obs) 
    } else {
      p.valor = pnorm(z_obs)
    }
  }
  
  print("El p-valor es de " + p.valor)
  if(p.valor > nivel){
    print("No se rechaza la hipótesis nula")
  } else {
    print("Se rechaza la hipótesis nula")
  }
}