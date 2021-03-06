package com.pj.pet.board.faq;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.pj.pet.util.Pager;

@Controller
@RequestMapping("/faq/*")
public class FaqController {

	@Autowired
	private FaqService faqService;
	
	@ModelAttribute("board")
	public String getBoard() {
		return "faq";
	}
	
	//제목 중복체크
	@PostMapping("titleCheck")
	public ModelAndView titleCheck(FaqVO faqVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = faqService.getTitleCount(faqVO);
		
		//공백체크 자바(공백일때 1 리턴)
		if(!StringUtils.hasText(faqVO.getTitle())) {
			result = 1;
		}
		
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	
	//전체 리스트
	@GetMapping("list")
	public ModelAndView getList(Pager pager, String grade, String gradeRef) throws Exception{
		ModelAndView mv = new ModelAndView();

		if(gradeRef != null) {
			pager.setGradeRef(gradeRef);
		}
		
		if(grade != null) {
			pager.setGrade(grade);
		}
		
		//faq 전체 리스트
		List<FaqVO> list = faqService.getList(pager);
		//faq 카테고리 리스트
		List<FaqCateVO> cate = faqService.getCateList(gradeRef);
		//faq 키워드 리스트
		List<FaqKeyVO> key = faqService.getKeyList();
		
		
		mv.addObject("list", list);
		mv.addObject("cate", cate);
		mv.addObject("key", key);
		
		//그냥 보내버림(파라미터 값 유무 확인)
		if(gradeRef != null) {
			mv.addObject("total", gradeRef);
		}
		
		//search 값 유무 확인
		if(pager.getSearch() != null) {
			mv.addObject("search", pager.getSearch());
		}
		
		
		mv.setViewName("faq/list");
		
		return mv;
	}
	
	//세부 페이지
	@GetMapping("detail")
	public ModelAndView getDetail(FaqVO faqVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		faqVO = faqService.getDetail(faqVO);
		
		
		mv.addObject("vo", faqVO);
		mv.setViewName("faq/detail");
		
		return mv;
	}
	
	//add form 이동
	@GetMapping("add")
	public ModelAndView setAdd(String gradeRef) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		List<FaqCateVO> list = faqService.getCateList(gradeRef);
		
		System.out.println(list);
		
		ObjectMapper objm = new ObjectMapper();
		String cateList = objm.writeValueAsString(list);
		
		System.out.println(cateList);
		mv.addObject("cateList", cateList);
		mv.setViewName("faq/add");
		return mv;
		
	}
	
	//add DB 적용
	@PostMapping("add")
	public ModelAndView setAdd(FaqVO faqVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = faqService.setAdd(faqVO);
		
		//System.out.println(faqVO.getGrade().substring(0,2));
		//문자열 잘라서 redirect 본인이 작성한 곳으로 이동하게 만들어줌
		mv.setViewName("redirect:./list?gradeRef="+faqVO.getGrade().substring(0,2)+"0");
		return mv;
	}
	
	//update form 이동
	@GetMapping("update")
	public ModelAndView setUpdate(FaqVO faqVO, String gradeRef) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		//update에 필요한 select 리스트 가져오기
		List<FaqCateVO> list = faqService.getCateList(gradeRef);
		ObjectMapper objm = new ObjectMapper();
		String cateList = objm.writeValueAsString(list);
		mv.addObject("cateList", cateList);
		
		//세부내용 갖고오기
		faqVO = faqService.getDetail(faqVO);
		mv.addObject("vo", faqVO);
		mv.setViewName("faq/update");
		
		return mv;
	}
	
	//update DB 적용
	@PostMapping("update")
	public ModelAndView setUpdate(FaqVO faqVO, ModelAndView mv) throws Exception{
		
		System.out.println("update에 들어왔음");
		
		int result = faqService.setUpdate(faqVO);
		
		//mv.setViewName("redirect:./list?gradeRef="+faqVO.getGrade().substring(0,2)+"0");
		
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		
		
		return mv;
	}
	
	//delete DB 적용
	@GetMapping("delete")
	public ModelAndView setDelete(FaqVO faqVO) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		//redirect에 grade가지고 오려고 씀
		//faqVO = faqService.getDetail(faqVO);
		//비동기면 redirect 설정이 아니고 common/ajaxResult로 보내서 삭제가 됐을때 그냥 페이지에서 리로딩하면 끝
		//mv.setViewName("redirect:./list?gradeRef="+faqVO.getGrade().substring(0,2)+"0");
		
		
		//faq 삭제 코드
		int result = faqService.setDelete(faqVO);
		
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		
		return mv;
	}
	
	
	
	
	
}
