
Feature: Obtencion de token de autenticacion

  Background:
    * url dummyJsonUrl

  @token @regression @report=false
  Scenario: Obtener token mediante login
    * configure report = false

    Given path '/auth/login'
    * def loginRequest = read('classpath:resources/request/loginRequest.json')
    And request loginRequest
    When method post

    Then status 200
    And match response.accessToken == '#string'
    And match response.refreshToken == '#string'
    And match response.username == 'emilys'
    * print 'Autenticacion exitosa: tokens recibidos'
