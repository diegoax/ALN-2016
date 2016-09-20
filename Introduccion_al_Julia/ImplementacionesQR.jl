#En este Script se implementan cuatro maneras de calcular la descomposicion de QR
# Donde Q es ortogonal y R es triangular superior. Se comparan las entradas diagonales
# de R con los valores propios de una matriz M = UDV^* con U y V ortogonales aleatorias
# y donde M tiene valores singulares que decrecen exponencialmente.
# Los metodos que usamos son:
# 1. Transformaciones de Householder
# 2. Transformaciones de Householder con signo fijo
# 3. Gram-Schmidt clasico
# 4. Gram-Schmidt modificado

function reflector(V)
  I = eye(length(V))
  W = V/norm(V)
  return I - 2* W * W'
end

V= [1,2,3]
R= reflector(V)
#Tests de la funcion
println(R*V+V)
det(R)
println(eigvals(R))
R'* R

#Un Paso de Householder
function houseHold(Z)
    X=Z[:,1]
    I = eye(length(X))
    W= -sign(X[1])*norm(X)*I[:,1]-X
    W = W/norm(W)
    ref = reflector(W)
    return ref *Z
end

function houseHoldMala(Z)
    X=Z[:,1]
    I = eye(length(X))
    W= -norm(X)*I[:,1]-X
    W = W/norm(W)
    ref = reflector(W)
    return ref * Z
end




function fullHousehold(Z)
  ncols = size(Z)[2]
  Result = copy(Z)
  for k in 1:ncols
      tmp = Result[k:end, k:end]
      tmp = houseHold(tmp)
      Result[k:end,k:end] = tmp
  end
  return Result
end

function fullHouseholdMala(Z)
  ncols = size(Z)[2]
  Result = copy(Z)
  for k in 1:ncols
      tmp = Result[k:end, k:end]
      tmp = houseHoldMala(tmp)
      Result[k:end,k:end] = tmp
  end
  return Result
end

#Implementacion de Gram-schidt de Federico y Veronica
function gs(D) #C es una matriz cuyas columnas forman una base de R^n
    C = copy(D)
    n = size(C)[1]
    #vectorq =  zeros(n,n)
    #vectora = zeros(n,n)
    for j in 1:n #j es la columna
        #vectora[:,j] = copy(C[:, j])
        if (j !=1)
            C[:,j] = C[:,j]/norm(C[:,j])

            for i in 1: (j-1)
                rij = (C[:,i]'*C[:,j])[1]
                C[:,j] = C[:,j] - rij*C[:,i]
            end

        else
            #vectorq[:,1] = vectora[:,1]/norm(C[:,1])
            C[:,1] = C[:, 1]/norm(C[:,1])
        end
    end
    return(C)
end

#asumo que tengo una lista C de vectores que son base
#C= diagm([12,2.0,3.0]) #reshape([1,2,3, 9,5,4, 3,4,6], 3,3) #para probar. Cada fila es un vector
#n = size(C)[1]
function gsm(D)
    C = copy(D)
    n = size(C)[1]#nro filas de C
    for i in 1:n #i es la fila
      rii = norm(C[:,i])
      C[:,i] = C[:,i]/rii
       if i !=n
              for j in (i+1):n
              rij = C[:,i]'*C[:,j]
              C[:,j] = C[:,j] - rij[1]*C[:,i]

              end
          end
      end
    return(C)
end

#Construimos una matriz aleatoria M cuyos valores singulares decrecen exponencialmente
n=80
A=randn(n,n)
Q,R = qr(A)
A=randn(n,n)
Q2,R2 = qr(A)
V = Array{Float64}([exp(-i) for i in collect(1:n)])
D = diagm(V)
#M = Array{BigFloat}(Q*D*Q2) #Cambiando el tipo a BigFloat se puede hacer que el Gram-Schmidt modificado sea tan bueno como Householder
M = Array{Float64}(Q*D*Q2) 

#Ahora calculamos la descomposicion QR de M de muchas maneras
#1. Transformaciones de Householder sin signo
R = fullHouseholdMala(M)
W = abs(diag(R))
#2. Transformaciones de Householder con signo
RB = fullHousehold(M)
WB = abs(diag(RB))
#3. Gram schmidt usual
RC = abs(diag(gs(M)'*M))
#4. Gram schmidt modificado
RD = abs(diag(gsm(M)'*M))

using PyPlot

k=1 #Queremos ver los valores propios solo a partir del k-esimo
B= [i for i in collect(1:n)]
B2 = B[k:end]
W2 = log(W[k:end])
W2B = log(WB[k:end])
R2C = log(RC[k:end])
R2D = log(RD[k:end])

plot(B2,W2, "cyan") #Householder
plot(B2,W2B, "blue") #Householder sin ajustar signos
plot(B2,R2C, "green") #Gram-Schmidt
plot(B2,R2D, "red") # Gram-Schmidt modificada
plot(B2, [-j for j in k:n], "black") #Recta alrededor de la que deberian estar los valores propios
#La grafica indica que en INestabilidad numerica los metodos son 1=2 < 4 < 3
#(ver primer parrafo para explicacion de la numeracion utilizada).
