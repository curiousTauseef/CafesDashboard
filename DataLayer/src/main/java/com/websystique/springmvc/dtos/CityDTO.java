package com.websystique.springmvc.dtos;

import com.websystique.springmvc.pojos.City;

public class CityDTO {

	private int id;
	private String city;
	private String uuid;
	private CountryDTO country;
	private byte isDeleted;

	public CityDTO() {
	}

	public CityDTO(String id) {
		this.id = Integer.parseInt(id);
	}

	public CityDTO(City city) {

		this.id = city.getId();
		this.city = city.getCity();
		this.uuid = city.getUuid();
		// this.country = new CountryDTO(city.getCountry());
		this.isDeleted = city.getIsDeleted();
	}

	public void setIsDeleted(byte isDeleted) {
		this.isDeleted = isDeleted;
	}

	public byte getIsDeleted() {
		return isDeleted;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public CountryDTO getCountry() {
		return country;
	}

	public void setCountry(CountryDTO country) {
		this.country = country;
	}

}
