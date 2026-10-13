@ignore
Feature: Creacion reutilizable de mascotas
  Scenario: Crear mascota con datos personalizados
    * url urlBase
    * def mascota = read('classpath:resources/request/createPet.json')
    * set mascota.id = petId
    * set mascota.name = petName

    Given path '/pet'
    And request mascota
    When method post
    Then status 200

    And match response.id == '#number'
    And match response.id == petId
    And match response.name == petName
    And match response.status == 'available'
    And match response.category.name == 'dogs'
    And match response.photoUrls == '#[]'
    And match response.photoUrls[0] == '#string'

    * def createdPetId = response.id
