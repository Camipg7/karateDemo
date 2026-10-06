Feature: Validacion de recurso no encontrado

Background:
    * url jsonPlaceholderUrl

@notFound
Scenario: Validar respuesta HTTP 404 al consultar un recurso inexistente

    Given path '/posts/999999'
    When method get
    Then status 404
    And match response == {}
    And print 'Respuesta 404 validada correctamente:', response