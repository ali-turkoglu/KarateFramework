Feature: get user token
  #we use this feature file to create token and then we call this feature file in another feature file

  Scenario: get one user token
    Given url 'https://cybertek-reservation-api-qa3.herokuapp.com'
    And path 'sign'
    And header Accept = 'application/json'
    And param email = 'teachervawiltonamiss@gmail.com'
    And param password = 'wiltonamiss'
    When method get
    Then status 200
    And def token = response.accessToken
    And print token


