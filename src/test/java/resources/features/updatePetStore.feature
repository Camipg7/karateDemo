Feature: Actualizacion de mascotas en PetStore

  Background:
    * url urlBase

  @putPet
  Scenario: Actualizar informacion de una mascota mediante PUT

    # Primero creamos la mascota para obtener un ID valido
    Given path '/pet'
    And request
    """
    {
      "id": 0,
      "category": {
        "id": 0,
        "name": "dogs"
      },
      "name": "Rocky",
      "photoUrls": [
        "string"
      ],
      "tags": [
        {
          "id": 0,
          "name": "string"
        }
      ],
      "status": "available"
    }
    """
    When method post
    Then status 200

    * def petId = response.id

    Given path '/pet'
    And request
    """
    {
      "id": "#(petId)",
      "category": {
        "id": 0,
        "name": "dogs"
      },
      "name": "Rocky Actualizado",
      "photoUrls": [
        "string"
      ],
      "tags": [
        {
          "id": 0,
          "name": "string"
        }
      ],
      "status": "sold"
    }
    """
    When method put
    Then status 200
    And match response.id == petId
    And match response.name == 'Rocky Actualizado'
    And match response.status == 'sold'
    And print 'Mascota actualizada:', response