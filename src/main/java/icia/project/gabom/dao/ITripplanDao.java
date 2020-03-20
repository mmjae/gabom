package icia.project.gabom.dao;

import java.security.Principal;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import icia.project.gabom.dto.Member;
import icia.project.gabom.dto.Sns_friend;
import icia.project.gabom.dto.Trip_member;
import icia.project.gabom.dto.Trip_plan;

public interface ITripplanDao {
   
   
   int savetripplan(Trip_plan tpl);
   
   
   boolean savetripdate(@Param("trip_number2")int trip_number2,@Param("date")String date, @Param("index")int index);

   List<Trip_plan> getmyplan(String trip_id);
   
   @Select("SELECT * FROM MEMBER WHERE MEMBER_ID=#{trip_id}")
   List<Member> getmemberinfo(String trip_id);
   
   @Select("SELECT * FROM SNS_FRIEND WHERE FRIEND_MY_ID=#{trip_id} AND FRIEND_STATUS=2")
   List<Sns_friend> getfriendlist(String trip_id);

   
   boolean togetherplan(Trip_member tm);

   List<Trip_member> requestmember(@Param("trip_id")String trip_id);

   List<Trip_member> requestme(@Param("trip_id")String trip_id);
   
   @Update("UPDATE TRIP_MEMBER SET TRIP_TYPE= 1 WHERE TRIP_NUMBER=#{trip_number} AND SHARE_ID=#{share_id}")
   boolean accepttrip(@Param("share_id")String share_id,@Param("trip_number")int trip_number);
   
   @Update("UPDATE TRIP_MEMBER SET TRIP_TYPE= 2 WHERE TRIP_NUMBER=#{trip_number} AND SHARE_ID=#{share_id}")
   boolean rejecttrip(@Param("share_id")String share_id,@Param("trip_number")int trip_number);

   List<Trip_plan> detailplan(@Param("trip_number")int trip_number);

}