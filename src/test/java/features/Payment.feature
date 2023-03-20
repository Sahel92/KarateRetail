@completeTest
Feature: TEK Retail Payment API Test

Background:
Given url appUrl
* def retailToken = call read("tokenGenerator.feature")
* def token = retailToken.response.accessToken
* header x-access-token = token 

@getPayments
Scenario: Get Payment methods
* path "payment"
* method get
* status 200
* print response
* karate.write(response, 'payment.json')

@createPayment
Scenario: Create A New Payment Method
* path "payment"
* def cardInfo = Java.type('tests.DataGenerator')
* def cardNumber = cardInfo.getCardNumber()
* def securityCode = cardInfo.getCCV()
* def requestBody = read('cardInfo.json')
* request requestBody
* method post
* status 200
* print response

@deletePayment
Scenario: Delete A Payment Method 
* def paymentId = read('file:./target/payment.json')
* def id = paymentId[0].id
* path "payment/"+id
* param id = id
* method delete
* status 200

@updatePayment
Scenario: Update A Payment Method
* def paymentId = read('file:./target/payment.json')
* def id = paymentId[0].id
* path "payment/"+id
* param id = id
* def cardInfo = Java.type('tests.DataGenerator')
* def cardNumber = cardInfo.getCardNumber()
* def securityCode = cardInfo.getCCV()
* def requestBody = read('cardInfo.json')
* request requestBody[0]
* method put
* status 200
* print response
