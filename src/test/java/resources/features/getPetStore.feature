
Feature: Consulta de mascota en PetStore

  Background:
    * url urlBase

  @getPet @smoke @regression
  Scenario: Crear y consultar una mascota por ID
    * def petId = Java.type('java.lang.System').currentTimeMillis()

    * def creada = call read('classpath:resources/helpers/createPet.feature') { petId: '#(petId)', petName: 'Max' }
    * def idCreado = creada.createdPetId

    Given path '/pet', idCreado
    When method get
    Then status 200

    And match response.id == idCreado
    And match response.name == 'Max'
    And match response.status == 'available'
    And match response.category.name == 'dogs'
    And match response.photoUrls == '#array'
    * print 'Mascota consultada:', response
