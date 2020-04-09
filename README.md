# Curso-Zuul-Serve
Servidor Zuul API GATEWAY 

## ¿Qué es Zuul?

Zuul es un servicio perimetral que envía solicitudes a múltiples servicios de respaldo. Proporciona una "puerta de entrada" unificada a su ecosistema, que permite que cualquier navegador, aplicación móvil u otra interfaz de usuario consuma servicios de múltiples hosts. Puede integrar Zuul con otros componentes de la pila de Netflix como Hystrix para tolerancia a fallas y Eureka para descubrimiento de servicio o usarlo para administrar reglas de enrutamiento, filtros y equilibrio de carga en su sistema. Lo más importante es que todos esos componentes están bien adaptados por Spring Framework a través del enfoque Spring Boot / Cloud.

## Componentes de Zuul

Zuul tiene principalmente cuatro tipos de filtros que nos permiten interceptar el tráfico en diferentes líneas de tiempo del procesamiento de la solicitud para cualquier transacción en particular. Podemos agregar cualquier cantidad de filtros para un patrón de URL particular.

* **prefiltros** (Pre): se invocan antes de enrutar la solicitud.
* **filtros posteriores ** (Post): se invocan después de que se ha enrutado la solicitud.
* **filtros de ruta** (Routing): se utilizan para enrutar la solicitud.
* **filtros de error**  (Error): se invocan cuando se produce un error al manejar la solicitud.

![Flujo de procesamiento de solicitudes dentro de Zuul con diferentes filtros](https://howtodoinjava.com/wp-content/uploads/2017/07/Zull-filters.jpg)

Tomado de: https://howtodoinjava.com/spring-cloud/spring-cloud-api-gateway-zuul/

## Problemas con los microservicios

principales problemas a los que nos enfrentamos en arquitecturas orientadas a microservicios son:

* El número de instancias de servicios y su localización varia dinámicamente
* La granularidad de las APIs ofrecidas por los microservicios suele ser diferente a la que los clientes realmente requieren
* Cada cliente necesita datos diferentes
* El rendimiento de la red varia en función de los tipos de clientes
* La granularidad de los servicios puede variar en el tiempo, aspecto que debería ser totalmente trasparente para los clientes.


La implementación de un servicio en el lado servidor (API Gateway) responsable de la agregación de datos y enrutamiento de peticiones a los servicios que correspondan, podría ser una buena solución para intentar mitigar los problemas anteriormente descritos

![esquema API GATEWAY](http://www.robertocrespo.net/wp-content/uploads/2016/09/API-Gateway2.png)

## Funcionamiento ZUUL

### La infraestructura de solución técnica consta de:

![Funcionamiento de zuul en 5 pasos](http://www.robertocrespo.net/wp-content/uploads/2016/09/Arq-tecnica.png)

* Service Discovery (Netflix Eureka): Permite a los servicios registrarse en tiempo de ejecución, facilitando su localización a los consumidores
* Dynamic Routing y Load Balancer (Netflix Ribbon): Se comunicará con Eureka para obtener información de localización de los servicios. Como balanceador de carga, si Ribbon encontrará más de una instancia disponible, distribuirá las peticiones de la manera más óptima.
* Edge Service (Netflix Zuul): Actúa como un proxy inverso, proporcionando un punto de entrada a los servicios del sistema. Zuul utiliza Ribbon para localizar dichos servicios y conseguir enrutar una llamada externa a una instancia concreta de un microservicio el ejercicio. ¡Manos a la obra!

Tomado de: http://www.robertocrespo.net/kaizen/zuul-implementacion-de-un-api-gateway/
