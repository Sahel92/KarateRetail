package tests;

import net.datafaker.Faker;

public class DataGenerator {

	public static String getCountry() {
		Faker data = new Faker();
		return data.address().country();
	}
	
	public static String getFullName() {
		Faker data = new Faker();
		String firstName = data.name().firstName();
		String lastName = data.name().lastName();
		return (firstName + " " +lastName);
	}
	
	public static String getPhoneNum() {
		Faker data = new Faker();
		return data.phoneNumber().phoneNumber();
		
	}
	
	public static String getStreet() {
		Faker data = new Faker();
		return data.address().streetAddress();
	}
	
	public static String getApartment() {
		Faker data = new Faker();
		return data.address().buildingNumber();
	}
	
	public static String getCity() {
		Faker data = new Faker();
		return data.address().city();
	}
	

	public static String getState() {
		Faker data = new Faker();
		return data.address().state();
	}
	
	public static String getZipCode() {
		Faker data = new Faker();
		return data.address().zipCode();
	}
	
	public static String getCardNumber() {
		Faker data = new Faker();
		return data.numerify("4213############");
	}
	
	public static String getCCV() {
		Faker data = new Faker();
		return data.numerify("###");
	}
	
	
}
