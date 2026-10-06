Feature: Actualizacion parcial de un recurso mediante PATCH
Background:
    * url jsonPlaceholderUrl
  @patchResource
  Scenario: Actualizar parcialmente un recurso
    Given path '/posts/1'
    * def patchRequest = read('classpath:resources/request/patch.json')
    And request patchRequest
    When method patch
    Then status 200
    And match response.id == 1
    And match response.title == 'Titulo actualizado con Karate'
    And match response.userId == '#number'
    And match response.body == '#string'
    And print 'Recurso actualizado mediante PATCH:', response