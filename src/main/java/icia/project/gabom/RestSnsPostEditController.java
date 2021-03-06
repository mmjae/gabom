package icia.project.gabom;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import icia.project.gabom.service.SnsPostEdit;

@RestController
public class RestSnsPostEditController {
	@Autowired
	SnsPostEdit snsPostEdit;
	
	
	
	@PostMapping(value = "sns/post/edit", produces = "application/json;charset=UTF-8")
	public String postEdit(@RequestParam("editContents") String editContents,
			@RequestParam("postNumber") String postNumber,Principal principal) {
		int postRNumber=Integer.parseInt(postNumber);
		String json=snsPostEdit.edit(editContents,postRNumber,principal);
		
		return json;
	}
	
}
