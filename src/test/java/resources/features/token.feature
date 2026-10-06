Feature: Obtencion de token de autenticacion
Background:
* url dummyJsonUrl

  @token
  Scenario: Obtener token mediante login
    Given  path '/auth/login'
    * def loginRequest = read ('classpath:resources/request/loginRequest.json')
    And request loginRequest
  
    When method post
    Then status 200
    And match response.accessToken == '#string'
    And match response.refreshToken == '#string'
    And match response.username == 'emilys'

    * def token = response.accessToken
    And print 'Token obtenido:', token