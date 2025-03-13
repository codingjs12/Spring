package com.example.test1.product.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.product.mapper.ProductMapper;
import com.example.test1.product.model.Product;

@Service
public class ProductService {
	
	@Autowired
	ProductMapper productMapper;

	public HashMap<String, Object> getProductList(HashMap<String, Object> map) {
		
		HashMap<String, Object> resultMap = new HashMap<>();
		
		List<Product> list = productMapper.selectProductList(map);
		
		resultMap.put("list", list);
		
		return resultMap;
	}
	
	public HashMap<String, Object> getProduct(HashMap<String, Object> map) {
		
		HashMap<String, Object> resultMap = new HashMap<>();
		
		Product product = productMapper.selectProduct(map);
		
		resultMap.put("product", product);
		
		return resultMap;
	}

	public HashMap<String, Object> addProduct(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		
		productMapper.insertProduct(map);
		
		resultMap.put("itemNo", map.get("itemNo"));
		resultMap.put("result", "success");
		
		return resultMap;
		
		
	}

	public HashMap<String, Object> addProductImg(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		productMapper.insertProductFile(map);
		resultMap.put("result", "success");
		return resultMap;
	}
	
	

}
