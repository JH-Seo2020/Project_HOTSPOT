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
public class SpcNotes {
	private int notesNo;
	private String notesContent;
	private int spcNo;
	private String userId;
}
