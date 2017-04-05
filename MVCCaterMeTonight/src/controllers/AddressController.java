package controllers;

import org.springframework.beans.factory.annotation.Autowired;

import data.AddressDAO;

public class AddressController {

	@Autowired
	AddressDAO addressDAO;
}
