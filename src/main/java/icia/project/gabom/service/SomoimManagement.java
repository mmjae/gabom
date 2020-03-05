package icia.project.gabom.service;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import icia.project.gabom.dao.ISomoimDao;
import icia.project.gabom.dto.Somoim;
import icia.project.gabom.userClass.SomoimUploadFile;

@Service
public class SomoimManagement {
	
	
	private Somoim sm;
	private ModelAndView mav;
	@Autowired
	private ISomoimDao sDao;
	
	@Autowired
	private SomoimUploadFile sUpload;
	
	public String InsertSomoim(MultipartHttpServletRequest multi, Principal pr) {
		// TODO Auto-generated method stub
		sm = new Somoim();
		
		System.out.println("multi.getParameter(\"somoim_maker\") : " +multi.getParameter("somoim_maker"));
		
		String somoim_maker = pr.getName();
		String somoim_name = multi.getParameter("somoim_name");
		String somoim_introduce = multi.getParameter("somoim_introduce");
		String somoim_location = multi.getParameter("somoim_location");
		String somoim_detail_location = multi.getParameter("somoim_detail_location");
		String somoim_interest = multi.getParameter("somoim_interest");
		String somoim_person = multi.getParameter("somoim_person");
		
		MultipartFile somoim_mainpicture_file = multi.getFile("somoim_mainpicture");
		String somoim_mainpicture = somoim_mainpicture_file.getOriginalFilename();  // 사진 원래 이름
		
		
		String somoim_name_noblank = somoim_name.replaceAll(" ", "");
		String somoim_sys_mainpicture = "./resources/somoimimage/upload/"+somoim_name_noblank+System.currentTimeMillis()+"."
	               +somoim_mainpicture.substring(somoim_mainpicture.lastIndexOf(".")+1);
		
		String sysfile = somoim_name+System.currentTimeMillis()+"."
	               +somoim_mainpicture.substring(somoim_mainpicture.lastIndexOf(".")+1);
		
		sm.setSomoim_detail_location(somoim_detail_location).setSomoim_interest(somoim_interest).setSomoim_introduce(somoim_introduce);
		sm.setSomoim_location(somoim_location).setSomoim_mainpicture(somoim_mainpicture).setSomoim_maker(somoim_maker).setSomoim_name(somoim_name);
		sm.setSomoim_person(somoim_person).setSomoim_sys_mainpicture(somoim_sys_mainpicture);
		
		System.out.println("sm : " +sm.toString());
		
		int result = sDao.InsertSomoimMake(sm);  
		System.out.println("insert : " + result);
		System.out.println("currvar : " + sm.getSomoim_number());  // 현재 번호
		
		int currval = sm.getSomoim_number();
		
		sDao.InsertOwnerMember(sm);
		
		String view = null;
		
		if(result == 1) {
			sUpload.fileUpProfilePic(multi, sysfile);
			view = "mainsomoim";
		}else {
			System.out.println("회원등록 실패");
			view = "makesomoim";
		}
		System.out.println("view = " + view);
		return view;
	}

	
	public ModelAndView selectMainSomoim(Principal pr, ModelAndView mav) {
		// TODO Auto-generated method stub
		
		List<Map<String,Object>> sList = sDao.selectMainSomoim(pr.getName());
		
		String json = new Gson().toJson(sList);
		System.out.println("json : " + json);
		mav.addObject("joinMoim", json);
		mav.setViewName("somoim/mainsomoim");
		return mav;
	}
	
	
	
	
}
