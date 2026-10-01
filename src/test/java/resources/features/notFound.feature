Feature: Validacion de recurso no encontrado

  @notFound
  Scenario: Validar respuesta HTTP 404 al consultar un recurso inexistente
    Given url 'https://jsonplaceholder.typicode.com'
    And path '/posts/999999'
    When method get
    Then status 404
    And match response == {}
    And print 'Respuesta 404 validada correctamente:', response