# Test de nivel asintótico para una proporción

# Se define una función para realizar el test asintótico para una proporción
#     donde entrada = vector de datos
#                 n = número de éxitos
#       sample_size = tamaño de la muestra
#   null_hypothesis = la hipótesis nula (two.sided, right.sided, left.sided)
#             level = nivel de significancia

p.test.a = function(entrada, n, sample_size, null_hypothesis, level){
  z_obs = ((mean(entrada) - sample_size)/(sqrt(sample_size(1 - sample_size)))) * sqrt(n)
  
  if(null_hypothesis == "two.sided"){
    p.value = 2 * (1 - pnorm(abs(z_obs)))
  } else {
    if(null_hypothesis == "right.sided"){
      p.value = 1 - pnorm(z_obs) 
    } else {
      p.value = pnorm(z_obs)
    }
  }
  print("El p-valor corresponde a la hipótesis nula " + null_hypothesis + "con un valor de " + p.value)
  if(p.value > level){
    print("No se rechaza la hipótesis nula")
  } else {
    print("Se rechaza la hipótesis nula")
  }
}

