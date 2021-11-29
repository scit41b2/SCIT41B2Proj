package com.project.grocery.vo;

import lombok.Data;

@Data
public class OrderTableVO { //주문 번호+날짜 정보
	private int ord_id;
	private String ordDate;
	private int ord_con;
	private String acc_id;
}
