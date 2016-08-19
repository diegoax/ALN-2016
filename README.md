# Curso de Álgebra Lineal Numérica 2016
## Centro de Matemática, Facultad de Ciencias, UdelaR.

### Instalación de repositorio

En las siguientes lineas se detallan los pasos a seguir para el uso de este repositorio.

Hay tres maneras diferentes de usarlo, y es a gusto del consumidor

1. Descargar archivos directamente e instalarlos en carpeta personal

2. Clonar repositorio usando git: 

 * Linux: escribir en consola git clone https://github.com/diegoax/ALN-2016
 * En windows instalar [GitHub Desktop](https://desktop.github.com/) y clonar repositorio

3. Cargar repositorio a Juliabox: 
 * Ir a la pestaña __Sync__ de[JuliaBox](https://juliabox.org/):,
 * En git Repositories, en __Git Clone URL__ escribir `https://github.com/diegoax/ALN-2016/`
 * en __Branch__ escribir `master`
 * escribir en __JuliaBox Folder__ dice `ALN-2016`
 * marcar _+_ para agregarlo
 * marcar la flecha hacia abajo para sincronizar el repositorio
 * ir a  __IJulia__

### Instalación de IJulia

IJulia es un lenguage Julia combinado con el entorno gráfico Jupyter (similar a Juliabox).
En las siguientes lineas se detalla como instalarlo.

1. Abrir consola con Julia activo

2. Escribir en consola 
  * `Pkg.add("IJulia")`
  * `Pkg.add("PyPlot")` (en caso de no tenerlo)

3. Para correr Ijulia se ejecuta en consola de Julia lo siguiente:
  * `using IJulia`
  * `notebook()`

Si todo corrió correctamente se debería abri una pestaña en el navegador de internet de preferencia. Para más información ver página [Ijulia](https://github.com/JuliaLang/IJulia.jl).

En caso de querer cambiar el directorio donde se abre IJulia se puede hacer lo siguiente:
* Abrir consola de `Julia`
* Ecribir `;` para entrar en modo `shell>`
* `cd ....\ALN-2016`donde los puntos indican la dirección de carpeta que se desea.
