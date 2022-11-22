Feature: parameter examples

  Background:
    * def baseUrl = 'https://api.exchangeratesapi.io'
    * def spartanUrl = 'http://44.202.119.26:8000'

  Scenario: path parameters
    Given url baseUrl
    And path 'latest'
    # no need to put /
    When method get
    Then status 200

  Scenario:  path parameters
    Given url baseUrl
    And path '2010-10-12'
    When method get
    Then status 200

  Scenario: get all spartans with path
    Given url spartanUrl
    And path 'api/spartans'
    When method get
    Then status 200
    And print response


  Scenario: get ones spartan only
    Given url spartanUrl
    And path 'api/spartans'
    And path '10'
    When method get
    Then status 200
    And print response


  Scenario: query parameters
    Given url spartanUrl
    And path 'api/spartans/search'
    And param nameContains = 'j'
    And param gender = 'Female'
    When method get
    Then status 200
    And match header Content-Type == "application/json"
    And print response
    # verify each content has gender = 'Female'
    And match each response.content contains {'gender':'Female'}
    And match each response.content contains[*].gender = 'Female'



