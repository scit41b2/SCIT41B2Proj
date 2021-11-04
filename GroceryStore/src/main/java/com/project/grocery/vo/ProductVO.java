package com.project.grocery.vo;

import lombok.Data;

@Data
public class ProductVO {
	private String pro_id;
	private String pro_company;
	private String pro_name;
	private String pro_note;
	private int pro_stock;
	private int pro_price;
	private int pro_saleprice;
}
