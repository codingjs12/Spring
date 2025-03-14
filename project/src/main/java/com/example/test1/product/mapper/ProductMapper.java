package com.example.test1.product.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.product.model.Product;

@Mapper
public interface ProductMapper {

	List<Product> selectProductList(HashMap<String, Object> map);
	
	Product selectProduct(HashMap<String, Object> map);

	void insertProduct(HashMap<String, Object> map);

	void insertProductFile(HashMap<String, Object> map);
	

}
