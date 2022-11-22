Feature: using match keyword

  Scenario: some matching example
    * def name = 'Severus Snape'
    * match name == 'Severus Snape'
    # similar to Assert.assertEquals(name,"Severus Snape");
    * match name != 'Tom Raider'


  Scenario:  more matching example
    * def employee =
    """
    {
      "firstname":"TJ",
      "salary":2500,
      "active":true
    }
    """
    * def emp_name = employee.firstname
    * match emp_name == "TJ"
    * match employee.salary == 2500


  Scenario:  fuzzy matching
    * def employee =
    """
    {
      "firstname":"TJ",
      "salary":2500,
      "active":true
    }
    """
    * match employee.firstname == '#string'
    * match employee.salary == '#number'
    * match employee.active == '#boolean'
    * match employee.lastname == '#notpresent'


  Scenario: contain matching
    * def employees =
        """
        [
    {
      "firstname":"TJ",
      "salary":2500,
      "active":true
    },
        {
      "firstname":"Steven",
      "salary":3000,
      "active":false
    }
    ]
    """
    * def length = employees.length
    * print length
    * match length == 2
    * match employees contains {"firstname":"TJ","salary":2500,"active":true}




