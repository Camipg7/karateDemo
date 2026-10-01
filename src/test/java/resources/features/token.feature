Feature: Obtencion de token de autenticacion

  @token
  Scenario: Obtener token mediante login
    Given url 'https://dummyjson.com'
    And path '/auth/login'
    And request
    """
    {
      "username": "emilys",
      "password": "emilyspass",
      "expiresInMins": 30
    }
    """
    When method post
    Then status 200
    And match response.accessToken == '#string'
    And match response.refreshToken == '#string'
    And match response.username == 'emilys'

    * def token = response.accessToken
    And print 'Token obtenido:', token