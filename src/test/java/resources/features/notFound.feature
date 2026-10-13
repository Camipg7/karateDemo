Feature: Validacion de recurso no encontrado

Background:
    * url jsonPlaceholderUrl

@negative @regression
Scenario: Validar respuesta HTTP 404 al consultar un recurso inexistente

    Given path '/posts/999999'
    When method get
    Then status 404
    And match response == {}
    And print 'Respuesta 404 validada correctamente:', response