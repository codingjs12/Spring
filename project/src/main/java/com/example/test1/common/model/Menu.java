package com.example.test1.common.model;

import lombok.Data;

@Data
public class Menu {
	private String menuId;
	private String parentId;
	private String menuName;
	private String menuType;
	private String menuUrl;
	private int depth;
}
