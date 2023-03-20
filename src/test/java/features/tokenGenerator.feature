Feature: Generate Token For TEK Retail API

  @Token
  Scenario: Generate Token
    Given url appUrl
    * path "/auth/login"
    * request {"email" : "SpongeBobss46@tekschool.us","password" : "Test12345$"}
    * method post
    * status 200
    * match response.email == 'SpongeBobss46@tekschool.us'
    * print response.accessToken
