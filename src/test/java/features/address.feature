@Address
Feature: TEK Retail Address API Test

Background:
Given url appUrl
* def retailToken = call read("tokenGenerator.feature")
* def token = retailToken.response.accessToken
* header x-access-token = token 


@GetAddress
Scenario: Get user address TEK Retail API
* path "address"
* method get
* print response
* status 200
* karate.write(response,'address.json')



@CreatetAddress
Scenario: Post Address Tek Retail API
* path "address"
* def dataGenerator = Java.type("tests.DataGenerator")
* def country = dataGenerator.getCountry()
* def fullName = dataGenerator.getFullName()
* def phoneNumber = dataGenerator.getPhoneNum()
* def street = dataGenerator.getStreet()
* def apartment = dataGenerator.getApartment()
* def city = dataGenerator.getCity()
* def state = dataGenerator.getState()
* def zipCode = dataGenerator.getZipCode()
* request 
""" 
{
  "country": "#(country)",
  "fullName": "#(fullName)",
  "phoneNumber": "#(phoneNumber)",
  "street": "#(street)",
  "apartment": "#(apartment)",
  "city": "#(city)",
  "state": "#(state)",
  "zipCode": "#(zipCode)"
}
"""
* method post 
* status 200
* print response


@RemoveAddress
Scenario: Delete Address TEK Retail API
* def addressID = read('file:./target/address.json')
* def id = addressID[0].id
* path "address/"+id
* param id = id
* method delete
* print response


@EditAddress
Scenario: Update Address TEK Retail API
* def addressID = read('file:./target/address.json')
* def id = addressID[0].id
* path "address/"+id
* param id = id
* def dataGenerator = Java.type("tests.DataGenerator")
* def country = dataGenerator.getCountry()
* def fullName = dataGenerator.getFullName()
* def phoneNumber = dataGenerator.getPhoneNum()
* def street = dataGenerator.getStreet()
* def apartment = dataGenerator.getApartment()
* def city = dataGenerator.getCity()
* def state = dataGenerator.getState()
* def zipCode = dataGenerator.getZipCode()
* request 
""" 
{
  "country": "#(country)",
  "fullName": "#(fullName)",
  "phoneNumber": "#(phoneNumber)",
  "street": "#(street)",
  "apartment": "#(apartment)",
  "city": "#(city)",
  "state": "#(state)",
  "zipCode": "#(zipCode)"
}
"""
* method put
* status 200
* print response 


