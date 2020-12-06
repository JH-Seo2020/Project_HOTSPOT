package com.kh.hotspot.guest.myPage.model.vo;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Wish {
	
	private String userId;
	private int spcNo;
	private String wishDate;

}
