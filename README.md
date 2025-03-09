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