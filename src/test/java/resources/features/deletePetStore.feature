Feature: Eliminacion de mascotas en PetStore
  Background:
    * url urlBase
  @deletePet @regression
  Scenario: Eliminar una mascota y verificar su eliminacion
    * def petId = Java.type('java.lang.System').currentTimeMillis()
    * def creada = call read('classpath:resources/helpers/createPet.feature') { petId: '#(petId)', petName: 'BobbyQA' }

    * def idCreado = creada.createdPetId

    Given path '/pet', idCreado
    When method get
    Then status 200
    And match response.id == idCreado
    And match response.name == 'BobbyQA'

    Given path '/pet', idCreado
    When method delete
    Then status 200

    Given path '/pet', idCreado
    When method get
    Then status 404

    * print 'Mascota eliminada:', idCreado
