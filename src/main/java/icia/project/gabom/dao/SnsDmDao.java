package icia.project.gabom.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import icia.project.gabom.dto.SnsDmDto;

public interface SnsDmDao {

	

	List<SnsDmDto> getDmList(@Param("id")String id);

}
