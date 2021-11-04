package com.project.grocery.vo;

import lombok.Data;

@Data
public class BasketlistVO {
	private String pro_id;
	private String pro_name;
	private int pro_price;
	private int pro_saleprice;
	private int pro_stock;
	private int bas_num;
}
