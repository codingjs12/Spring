package com.example.test1.product.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.test1.product.dao.ProductService;
import com.google.gson.Gson;

@Controller
public class ProductController {
	
	@Autowired
	ProductService productService;
	
	@RequestMapping("/product/list.do")
	public String result(Model model) {
		
		return "/product/product-list";
	}
	
	@RequestMapping("/product/view.do")
	public String view(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) {
		request.setAttribute("map", map);
		return "/product/product-view";
	}
	
	
	@RequestMapping(value = "/product/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String productList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<>();
		
		resultMap = productService.getProductList(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/product/view.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String product(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<>();
		
		resultMap = productService.getProduct(map);
		return new Gson().toJson(resultMap);
	}

}
