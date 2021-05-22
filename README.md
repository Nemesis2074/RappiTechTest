# Rappi - Prueba Técnica

El proyecto está organizado para seguiri la arquitectura MVC. Las capas se organizan de la sigueinte manera: 

- __Model__ : Lógica de negocios
    - __Servicies__ : Lógica del acceso al API
    - __Persistence__ : Lógica de la persistencia de datos
- __View__ : Vistas de la aplicación
- __Controller__ : Lógica de presentación de infromación

A continuación se explica cada capa y las clases que corresponden.

> NOTA: Para reducir el peso del repositorio, el código no incluyen los Pods utilizados en el proyecto, por lo que es necesarios ejecutar el comando **pod install** en la Terminal antes de ejecutar el proyecto. 

## Model
Contiene las clases correspondientes al modelo de datos y la lógica de negocio 

El primer grupo de clase del modelo solo definen la estrúctura de datos que se consulta del API y se guarda en la persistencia. Estas son:

Clase                           | Descripción  |
--------------------------|----------------|
Movie                           | Contiene la infromación básica de una película. Esta se muestra en los listados. |
MovieDetail                  | Contiene el detalle de una película. Esta clase incluye más propiedades como son videos y géneros. |
Genre                           | Representa el género de una película. |
MovieCategory            | Enumerador para clasificar/filtrar las películas de acuerdo a categorias: Top, Upcoming y Popular |
Video                           | Contiene los datos de un video de una película. Se utiliza pra obtener el trailer y reproducirlo. |
SourceType                 | Enumerador que determina el tipo de fuente de un video: Youtube o Vimeo |

Por otro lado, las clases que contiene la lógica de acceso, consulta y guardado de datos son las siguientes:

Clase                           | Descripción  |
--------------------------|----------------|
ServicesManager        | Ejecutar las llamadas al API |
PersistenceManager   | Controla el guardado y consulta de información desde la base de datos de persistencia |
__RepositoryManager__   | Es el punto de entrada para la consulta información del Modelo. Se encarga de llamar a ServicesManager y PersistenceManager para consultar el API, guardar en persistencia y regresar datos dependiendo del estado de la conexión | 

## Views

En la carpeta Views se encuentra la interfaz de la App; esto incluye controles personalizados, elementos de lista y pantallas de la app. 

Cada  pantalla de la App se define en un archio __*.xib__ con su correspondiente archivo __*.swift__ para configuraciones en código. Las pantallas creadas son las siguientes:

Clase                              | Descripción  |
----------------------------|----------------|
MoviesScreenView         | Interfaz para para una categoría de películas. |
MovieDetailScreenView  | Interfaz para el detalle de una película. |
SearchScreenView         | Interfaz para la sección de búsqueda de películas. | 

Para mostrar los listados de películas, se crearon los siguientes elementos de lista:

Clase               | Descripción  |
-----------------|----------------|
MovieCell        | Vista de una película en el listado. |
HeaderView    | Vista del título de un listado. |

Finalmente, los controles personalizados que se crearon son los siguientes:

Clase                          | Descripción  |
-------------------------|----------------|
RatingView                 | Indicador de la calificación de una película |
XibView                       | Clase de ayuda que renderiza archivos __*.xib dentro del Storyboard.  |
LoadingIndicatorView | Indicador de progreso de carga |
LoadingView               | Indicador de progreso de carga que ocupa toda la pantalla |

## Controllers
Aquí se encuentran los ViewControllers correspondientes a cada pantalla de la App y la lógica de navegación por la App. Desde aquí se hacen llamadas al Modelo a traves del __RepositoryManager__ y se muestran los datos en los Views. Las clases incluidas son las siguientes:

Clase                                 | Descripción  |
------------------------------|----------------|
MoviesViewController        | Controlador de una pantalla de categoría. Muestra el listado de películas dependiendo de la categoría indicada |
MovieDetailViewController | Controlador que muestra el detalle de una película |
SearchViewController        | Controlador que muestrar ejecuta búsquedas en la persistencia de datos |
MoviesController               | Esta clase implementa los protocolos de UICollectionView y se encarga de mostrar cualquier listado de películar. |
TabsViewController           | Controlador principal de la App que muestra las secciones de la App organizadas por pestañas | 

## Instances y Utils

Las carpetas Instances y Utils contienen extensiones utilitarias para simplificar la codificación. Los archivos que incluyen son los siguientes:

Clase                                 | Descripción  |
------------------------------|----------------|
Strings+Utils                     | Funciones utilitarias para Strings
Date+Utils                         | Funciones utilitarias para fechas
UICollectionView+Utils     | Simplifica el registro e instancia de items de lista
Float+Utils                        | Funciones utilitarias para numeros tipo Float
UIStoryboard+Instances  | Simplifica la instanciación de ViewControllers desde un Storyboard 

## Resources

Por último, la carpeta Resources contiene los recursos de la App como son Strings, Colores, Iconos y Tipos de Fuente.


## Preguntas

### ¿En qué consiste el principio de responsabilidad única?, ¿Cuál es su propósito?

Consiste en que una clase, módulo y/o función debe tener una única tarea o responsabilidad; esto permite reducir significativamente los errores, tener un código más limpio y facilitar el mantenimiento y actualización del código.   

### ¿Qué características tiene, según su opinión, un “buen” código o código limpio?

Desde mi punto vista, un código limpio debe tener:

- Definición de un modelo o estructura de datos. Nunca utilizar los datos en bruto obtenidos de un JSON y en su lugar definir clases o estructuras para trabajar con los datos.
- Clases y métodos con una única responsabilidad definida.
- Clases con pocas lineas de código. Dependiendo del lenguaje, pero si una clase tiene más de 1.000 lineas se vuelve dificil de mantener.
- Complir el principio DRY y eliminar la duplicidad de código. En su lugar, utilizar clases o funciones que agrupen dicha funcionalidad y pueda ser reutilizada.
- Utilizar enumeradores para mejorar la validación y evitar errores en tiempo de ejecución.
- En general, tratar de cumplir con los principios SOLID.
