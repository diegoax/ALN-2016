#We compute the binomial probabilities form scratch
p=0.5

function logFactorial(m::Int64)
  res = 0
  for k in 1:m
    res = res + log(k)
  end
  return res
end


function binomialProbability(k,N;prob = 0.5)
#returns the binomial probability of exactly k successes with probability p on N trials
#Keyworded arguments
  N < 0 ? error("ERROR: Numero de intentos no puede ser positivo") :
  0 > k ? error("ERROR: k no puede ser negativo") :
  k > N ? error("ERROR: k debe ser menor o igual a N") :
  intermediateRes = logFactorial(N)+(k*log(prob)+(N-k)*log(1-prob))-(logFactorial(N-k)+logFactorial(k))
  return exp(intermediateRes)
end

binomialProbability(2,10)
N=100
Prueba  = map((j)->binomialProbability(j,N,prob=0.3),0:N)
#How to show a fixed number of significant digits?
for prob in Prueba
  @printf "%.2f " prob
end
sum(Prueba)

#Por ultimo hacemos un dibujo de lo que hemos hecho hasta ahora
using PyPlot
x = [0:1:N;]
y = Prueba
fig = figure("pyplot_barplot",figsize=(10,10))

b = bar(x,y,color="#0f87bf",align="center",alpha=0.4)

axis("tight")
title("Vertical Bar Plot")
grid("on")
xlabel("X")
ylabel("Y")
prob=0.6
Prueba2  = map((j)->binomialProbability(j,N,prob=prob),0:N)
b = bar(x,Prueba2,color="red",align="center",alpha=0.4)

#Comparemos con la distribucion normal, y veamos pyplot
mu=N*prob
sigmasq = N *prob*(1-prob)
normalDist = (x) -> exp(-(x-mu)^2/(2*sigmasq))*(1/sqrt(2pi*sigmasq))
xHighRes = [0:0.05:N;]
Ys = map(normalDist,xHighRes)
plot(xHighRes,Ys)
#Luego hacemos una simulacion de como deberia comportarse una moneda y comparamos.
