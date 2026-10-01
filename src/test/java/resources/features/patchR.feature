Feature: Actualizacion parcial de un recurso mediante PATCH

  @patchResource
  Scenario: Actualizar parcialmente un recurso
    Given url 'https://jsonplaceholder.typicode.com'
    And path '/posts/1'
    And request
    """
    {
      "title": "Titulo actualizado con Karate"
    }
    """
    When method patch
    Then status 200
    And match response.id == 1
    And match response.title == 'Titulo actualizado con Karate'
    And match response.userId == '#number'
    And match response.body == '#string'
    And print 'Recurso actualizado mediante PATCH:', response