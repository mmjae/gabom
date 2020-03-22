package icia.project.gabom.service;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;

import icia.project.gabom.dao.SnsSearchDao;
import icia.project.gabom.dto.Member;
import icia.project.gabom.dto.SnsFriendStatus;
import icia.project.gabom.dto.SnsSerachResult;
import icia.project.gabom.dto.Snsposts;

@Service
public class SnsSearch {

	@Autowired
	SnsSearchDao snsSearchDao;

	@Transactional
	public String search(String data, Principal principal) {
		HashMap<String, List<SnsSerachResult>> total = new HashMap<String, List<SnsSerachResult>>();
		List<Snsposts> postList = snsSearchDao.searchPost(data, principal.getName());
		List<Member> memberList = snsSearchDao.searchFriendList(data);
		List<SnsSerachResult> publicResult = new ArrayList<SnsSerachResult>();
		List<SnsSerachResult> friendListResult = new ArrayList<SnsSerachResult>();
		for (Snsposts post : postList) {
			publicResult = setResult(post, publicResult);
		}
		total.put("publicPost", publicResult);
		for (Member member : memberList) {
			System.out.println(member.getMember_id());
			Member friendStatus = snsSearchDao.check(member.getMember_id(), principal.getName());
			if (friendStatus == null || friendStatus != null) {
				friendListResult = setFriendListResult(member, friendListResult,friendStatus);
			}
		}
		total.put("friendList",friendListResult);


		return new Gson().toJson(total);
	}

	private List<SnsSerachResult> setFriendListResult(Member member, List<SnsSerachResult> friendListResult, Member friendStatus) {
		SnsSerachResult resultDto = new SnsSerachResult();
		resultDto.setId(member.getMember_id()).setPic(member.getMember_profile_picture());
		if(friendStatus==null) {
			resultDto.setStatus(0);
		}else {
			resultDto.setStatus(friendStatus.getFriendstatus());
		}
		friendListResult.add(resultDto);
		return friendListResult;
	}

	
	
	
	
	private List<SnsSerachResult> setResult(Snsposts post, List<SnsSerachResult> resultArr) {
		SnsSerachResult resultDto = new SnsSerachResult();
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		String date = format1.format(post.getSns_posts_date());
		resultDto.setPostNumber(post.getSns_posts_number()).setWriter(post.getSns_posts_writer()).setDate(date)
				.setReport(post.getSns_posts_report()).setContents(post.getSns_posts_content());
		resultArr.add(resultDto);
		return resultArr;
	}

}
