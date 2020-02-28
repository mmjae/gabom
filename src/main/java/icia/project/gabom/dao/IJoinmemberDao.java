package icia.project.gabom.dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import icia.project.gabom.dto.Member;

public interface IJoinmemberDao {
	
	int insertJoinMember(Member mb);

	int JoinMemberSecurityGrade(@Param("member_id") String member_id, @Param("securityGrade") String securityGrade);

	int resultJoinMemberSecurityROLEUSER(@Param("member_id") String member_id, @Param("ROLE_USER")String ROLE_USER);
	
	//@Select("SELECT MEMBER_ID FROM MEMBER where MEMBER_ID = #{userid}")
	Member idCheck(Member mb);
	
}
