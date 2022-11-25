Feature: Karate Java Integration

  Background:
    * def spartanUrl = 'http://44.195.19.167:8000'

  Scenario: GET a spartan with request header
    Given url spartanUrl
    And path 'api/spartans'
    And header Accept = 'application/json'
    When method GET
    Then status 200


  Scenario: Create a new spartan
    Given url spartanUrl
    And path 'api/spartans'
    And header Accept = 'application/json'
    And header Content-Type = "application/json"
    And request
    """
    {
      "gender": "Male",
      "name": "Michone",
      "phone": 1234567891
    }
    """
    When method post
    Then status 201
    And print response


  Scenario: reading java methods
    #Java.type --> used to connect to java class
    * def SDG = Java.type('utilities.SpartanDataGenerator')
    #run the static method in that class and capture the result
    * def newSpartan = SDG.createSpartan()
    * print newSpartan


  Scenario: Create a new spartan with random data
    #everything is needs to be in one scenario. so no need to define a global variable
    * def newSpartan = Java.type('utilities.SpartanDataGenerator').createSpartan()
    Given url spartanUrl
    And path '/api/spartans'
    And header Accept = 'application/json'
    And header Content-Type = "application/json"
    And request newSpartan
    When method post
    Then status 201
    And print response
    And match response.success == 'A Spartan is Born!'
    And match response.data.name == newSpartan.name
    And def idToDelete = response.data.id
    Given url spartanUrl
    And path 'api/spartans'
    And path idToDelete
    When method delete
    Then status 204






