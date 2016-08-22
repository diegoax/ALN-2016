# Curso de Álgebra Lineal Numérica 2016
## Centro de Matemática, Facultad de Ciencias, Univsersidad de la República.

### Docentes: 
* [Diego Armentano](http://www.cmat.edu.uy/~diego/), ([Centro de Matemática](http://www.cmat.edu.uy/cmat))
* [Mauricio Velasco](http://wwwprof.uniandes.edu.co/~mve) ([Centro Universitario Regional del Este](http://www.cure.edu.uy/))

### Descripción:
El álgebra lineal numérica es una de las áreas de la matemática con mayor impacto en otras ciencias, y en particular en el mundo del desarrollo científico-tecnológico. Más allá de las aplicaciones, el álgebra lineal numérica se ha transformado en un área fundamental de estudio en matemática. Además, es un área sumamente elegante e interesante debido a estar cargada de buenas y potentes ideas, las cuales difícilmente puedan abordarse en los cursos básicos de álgebra lineal. Aunque el título no lo sugiera, en realidad, el curso álgebra lineal numérica es un curso de análisis funcional con énfasis en ideas algorítmicas. Durante el curso se realizarán varias actividades prácticas en el lenguaje de programación científica Julia (www.julialang.org). Para tal fin al inicio del curso se realizará un mini-curso para utilizar este lenguaje. (No se requiere conocimientos previos de programación.)

### Temas del Curso:
Fundamentos y repaso de álgebra lineal; descomposición QR; estabilidad y
condicionamiento; sistemas de ecuaciones; valores propios; métodos iterativos.

### Bibliografía:
* L. Trefethen, D. Bau : Numerical linear algebra ,SIAM: Society for Industrial and
Applied Mathematics; null edition (1997).
* J. Demmel: Applied numerical linear algebra, ,SIAM: Society for Industrial and
Applied Mathematics; null edition (1997).
* J-P Dedieu, L. Amodei: Analyse numérique matricielle, Dunod, Science Sup, (2008).

### Instalación de repositorio

En las siguientes lineas se detallan los pasos a seguir para el uso de este repositorio.

Hay tres maneras diferentes de usarlo, y es a gusto del consumidor

1. Descargar archivos directamente e instalarlos en carpeta personal

2. Clonar repositorio usando git: 

 * Linux: escribir en consola 
 `git clone https://github.com/diegoax/ALN-2016`
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
  * `Pkg.add("IJulia")` (en caso de no tenerlo)

3. Para correr Ijulia se ejecuta en consola de Julia lo siguiente:
  * `using IJulia`
  * `notebook()`

Si todo corrió correctamente se debería abri una pestaña en el navegador de internet de preferencia. Para más información ver página [Ijulia](https://github.com/JuliaLang/IJulia.jl).

En caso de querer cambiar el directorio donde se abre IJulia se puede hacer lo siguiente:
* Abrir consola de `Julia`
* Ecribir `;` para entrar en modo `shell>`
* `cd ....\ALN-2016`donde los puntos indican la dirección de carpeta que se desea.
