APIs utilizadas
Swagger PetStore https://petstore.swagger.io/v2 :Automatización de creación, consulta, actualización y eliminación de mascotas.

JSONPlaceholder https://jsonplaceholder.typicode.com :Validación de respuestas negativas HTTP 404 y actualizaciones parciales mediante PATCH.

DummyJSON https://dummyjson.com : Automatización de autenticación mediante login y validación de tokens.

Ejecutar todo
mvn clean test

Ejecutar pruebas Smoke
mvn clean test "-Dkarate.options=--tags @smoke"

Ejecutar pruebas de regresión
mvn clean test "-Dkarate.options=--tags @regression"

Ejecutar pruebas negativas
mvn clean test "-Dkarate.options=--tags @negative"