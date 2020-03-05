package icia.project.gabom.dao;

import java.util.List;

import icia.project.gabom.dto.Adminfood;
import icia.project.gabom.dto.Adminhouse;
import icia.project.gabom.dto.Adminnotices;

public interface IAdminDao {
	//하우스 0번타입 리스트 출력
	List<Adminhouse> getHouseList();
	//음식점 0번타입 출력
	List<Adminfood> getFoodList();
	//house 모달 출력
	List<Adminhouse> gethousemodal(String num);
	//food 모달 출력
	List<Adminfood> getfoodmodal(String num);
	//house 승인
	boolean houseApproved(String number);
	//food 승인
	boolean foodApproved(String number);
	//house 거절
	boolean housefuse(String number);
	//food 거절
	boolean foodfuse(String number);
	//notices 전체출력
	List<Adminnotices> getadnotices();
	
}
