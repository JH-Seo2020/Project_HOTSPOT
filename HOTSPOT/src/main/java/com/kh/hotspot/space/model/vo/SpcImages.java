package com.kh.hotspot.space.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class SpcImages {
	private int imgNo;		 // 상세이미지 번호
	private String imgOgImg; // 상세이미지 파일명
	private String imgChImg; // 상세이미지 저장경로 
	private int spcNo;		 // 공간번호
}
