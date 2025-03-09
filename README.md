# Projecto_Invitados

## Como ejecutar la webapp en local

1. Clona el repositorio

2. Ejecuta el siguiente goal de maven:
    ```shell
    mvn package
     ```

3. Configura el entorno:
   
   Las variables de entorno a configurar son las siguientes.

   ``DATABASE_URL``, ``DATABASE_USER`` y ``DATABASE_PASSWORD``


4. Ejecuta el siguiente comando desde la raiz del proyecto:
    ```shell
    java -jar target/dependency/webapp-runner.jar target/*.war
    ```

5. La webapp debería estar ejecutandose en el puerto 8080

---

## Enlace al repositorio

```
https://github.com/MarcosAlonso05/Projecto_Invitados.git
```

---

## Comentario: Usando Render

Si queremos utilizar Render, no podemos utilizar el preset de Static Web Page porque
eso solo crearía una página estática, es decir, un servidor web que sirve contenidos
para ver directamente en el navegador (archivos html con css y javascript, imagenes, videos...)

Si queremos que ejecute un servidor web con contenido dinámico (como es nuestro caso con el `.war`)
necesitaríamos utilizar el preset de Web Service, que, aunque tiene una version gratuita, no hemos conseguido
hacer funcionar el Dockerfile con este. Cuando hemos ejecutado el Dockerfile utilizando Docker Desktop en Windows
en nuestras máquinas en local, ha funcionado sin problema usando los siguiente comandos.

```shell
docker build --tag "invitados" .
docker run -p 8080:8080 -e DATABASE_URL=ep-aged-snow-a837dr9h.eastus2.azure.neon.tech/neondb?sslmode=require -e DATABASE_USER=neondb_owner -e DATABASE_PASSWORD=npg_dIK2rs3yNgfw invitados
```

Sin embargo, no hemos encontrado opción para cambiar el comando de ejecución en render. 

Podemos confirmar que si se ejecuta en local configurando las variables de entorno a los siguientes valores para conectarse con
la base de datos alojada en Neon, funciona el proyecto sin ningún problema.

No es necesario utilizar Docker en local para ejecutarlo, solo hay que seguir los pasos detallados
en la sección anterior.

Los valores para las variables de entorno son los siguientes:
```shell
DATABASE_URL = ep-aged-snow-a837dr9h.eastus2.azure.neon.tech/neondb?sslmode=require
DATABASE_USER = neondb_owner
DATABASE_PASSWORD = npg_dIK2rs3yNgfw
```

Si se ejecuta en Windows, se puede copiar el siguiente código en la terminal para configurar las variables de entorno
a los valores correctos sin tener que ir copiando una a una.

```shell
SET DATABASE_URL=ep-aged-snow-a837dr9h.eastus2.azure.neon.tech/neondb?sslmode=require
SET DATABASE_USER=neondb_owner
SET DATABASE_PASSWORD=npg_dIK2rs3yNgfw
```