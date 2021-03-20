
  Feature: Age of Empire
      Background:
      * def ageOfurl = 'https://age-of-empires-2-api.herokuapp.com'
    @ignore
    Scenario Outline: try to find some special armours for <id>
      Given url ageOfurl
      And path 'api/v1/unit',<id>
      And header Accept = 'application/json'
      When method GET
      Then status 200
      And print units.name
      And match response.accuracy == '50%'
      And match response.age == 'Imperial'
      And match response.cost.Wood == 40
      And match response.build_time == 27
      And match response.attack_bonus[0] == '+2 spearmen'
      Examples:
    |id|
    |5 |

    @wip
    Scenario Outline: find special <area>
        Given url ageOfurl
        * path 'api/v1/<area>/',<id>
        * method GET
        * status 200
        * print 'Expansion name of <area> is: ' + response.expansion
        * match response.expansion == 'Age of Kings'
        Examples:
          |area         |id|
          |unit         |1 |
          |civilization |2 |
          |structure    |3 |
          |technology    |4 |



