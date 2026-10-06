Feature: Actualizacion de mascotas en PetStore
  Background:
    * url urlBase
  @putPet
  Scenario: Actualizar informacion de una mascota mediante PUT
    Given path '/pet'
     * def createRequest = read('classpath:resources/request/createForUpdate.json')
    And request createRequest

    When method post
    Then status 200
    And match response.id == '#number'
    And match response.name == 'Rocky'
    And match response.status == 'available'

    * def petId = response.id

    Given path '/pet'
    * def updateRequest = read('classpath:resources/request/update.json')
    And request updateRequest

    When method put
    Then status 200
    And match response.id == petId
    And match response.name == 'Rocky Actualizado'
    And match response.status == 'sold'
    And print 'Mascota actualizada:', response