Feature: Actualizacion de mascotas en PetStore
  Background:
    * url urlBase
  @putPet @regression
  Scenario: Actualizar informacion de una mascota mediante PUT
    * def petId = Java.type('java.lang.System').currentTimeMillis()
    * def creada = call read('classpath:resources/helpers/createPet.feature') { petId: '#(petId)', petName: 'Rocky' }

    * def idCreado = creada.createdPetId
    * def updateRequest = read('classpath:resources/request/update.json')
    * set updateRequest.id = idCreado
    * set updateRequest.name = 'Rocky Actualizado'
    * set updateRequest.status = 'sold'

    Given path '/pet'
    And request updateRequest
    When method put
    Then status 200

    And match response.id == idCreado
    And match response.name == 'Rocky Actualizado'
    And match response.status == 'sold'

    Given path '/pet', idCreado
    When method get
    Then status 200

    And match response.id == idCreado
    And match response.name == 'Rocky Actualizado'
    And match response.status == 'sold'
    And match response.category.name == 'dogs'

    * print 'Mascota actualizada y verificada:', response
