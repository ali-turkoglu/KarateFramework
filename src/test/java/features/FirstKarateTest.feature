Feature: welcome to Karate
  
  Scenario: how to print
    Given print "Hello World!"
    When print 'another print'
    Then print "then print"


  Scenario: more printing
    Given print "Hello World again"
    * print "my name is",'karate'
    # , --> concat two strings +1 white space
    * print 2+2


  Scenario: variables
    * def name = 'Mike'
    * print 'my name is',name
    * def age = 24
    * print name,'is',age,'years old'


  Scenario: difficult parameters: json object
    * def student = {'name':'sam','owes_tuition':false}
    * print student
    * print student.name
    * print student.owes_tuition


  Scenario: json object 2
    * def student =
    """
    {
    "firstname":"Steven",
    "lastname":"Dave",
    "salary":2500
    }
    """
    * print student.salary
    * print student.firstname
    * print student.lastname


  Scenario: Spartan Variable
    * def spartan =
    """
    {
    "id": 10,
    "name":"Lorenzo",
    "gender":"Female",
    "phone":3312820936
    }
    """
    * print spartan.gender
    * print spartan.name


  Scenario: json array objects
    * def students =
    """
      [
        {
          'name':'sam',
          'owes_tuition':false
        },
        {
          'name':'John',
          'owes_tuition':false
        },
        {
          'name':'Adam',
          'owes_tuition':false
        },
        {
          'name':'Eugien',
          'owes_tuition':false
        },
      ]
    """
    * print students
    * print students[0].name
    * print students[1].name