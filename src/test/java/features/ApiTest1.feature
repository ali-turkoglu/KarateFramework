Feature: exchange rate api tests

  Scenario: basic test with status code validation
    Given url 'https://api.exchangeratesapi.io/latest'
    When method GET
    Then status 200


  Scenario: get rates for specific day
    Given url 'https://api.exchangeratesapi.io/2010-01-12'
    When method GET
    Then status 200


  Scenario: header verification
    Given url 'https://api.exchangeratesapi.io/2010-01-12'
    When method GET
    Then status 200
    And match header Content-Type == "application/json; Charset=UTF-8"
    * match header Vary == null
    * match header Date == '#present'

  Scenario: body verification
    Given url 'https://api.exchangeratesapi.io/2010-01-12'
    When method GET
    Then status 200
    And match header Content-Type == "application/json; Charset=UTF-8"
    And print response
    And print response.base
    #verify base is EUR
    And match response.base == 'EUR'
    And match response.rates.USD == '#present'
    And match response.rates.USD == 1.8842





