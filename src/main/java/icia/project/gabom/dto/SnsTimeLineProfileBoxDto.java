package icia.project.gabom.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("timeLineProfile")
@Data
@Accessors(chain=true)
public class SnsTimeLineProfileBoxDto {
	
	private String id;
	private String name;
	private String pic;
	private String content;
	private int post;
	private int friend;
	private int friendRequset;
	
}
