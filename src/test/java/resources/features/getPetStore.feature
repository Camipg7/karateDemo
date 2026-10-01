Feature: Consulta de mascota en PetStore

  Background:
    * url urlBase

  @getPet
  Scenario: Crear y consultar una mascota por ID

    Given path '/pet'
    And request
    """
    {
      "id": 0,
      "category": {
        "id": 0,
        "name": "dogs"
      },
      "name": "Max",
      "photoUrls": [
        "string"
      ],
      "tags": [
        {
          "id": 0,
          "name": "test"
        }
      ],
      "status": "available"
    }
    """
    When method post
    Then status 200

    * def petId = response.id

    Given path '/pet', petId
    When method get
    Then status 200
    And match response.id == petId
    And match response.name == 'Max'
    And match response.status == 'available'
    And match response.category.name == 'dogs'
    And match response.photoUrls == '#array'
    And print 'Mascota consultada:', response