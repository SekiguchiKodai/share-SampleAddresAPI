package com.example.demo.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo.entity.VAddress;
import com.example.demo.mapper.VAddressMapper;

@Repository
public class AddressRepository {

	private final VAddressMapper vAddressMapper;
	
	@Autowired
	public AddressRepository(VAddressMapper vAddressMapper) {
		this.vAddressMapper = vAddressMapper;
	}
	
	public List<VAddress> findByPrefectureName(String name) {
		return vAddressMapper.findByPrefectureName(name);
	}
}
