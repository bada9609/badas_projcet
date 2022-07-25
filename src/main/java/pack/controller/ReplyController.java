package pack.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import pack.model.TpBoardDaoInter;

@Controller
public class ReplyController {
	@Autowired
	private TpBoardDaoInter inter;

	@RequestMapping(value = "reply", method = RequestMethod.GET)
	public ModelAndView abc(@RequestParam(value = "tp_num", required = false) String tp_num,
			@RequestParam(value = "page", required = false) String page) {
		ModelAndView view = new ModelAndView("reply", "data", inter.getDetail(tp_num));
		view.addObject("page", page);
		return view;
	}

	@RequestMapping(value = "reply", method = RequestMethod.POST)
	public String def(@RequestParam("page") String page, TpBean bean) {

		// onum 갱신
		bean.setOnum(bean.getOnum() + 1);

		inter.updateOnum(bean);


		if (inter.insertReply(bean))
			return "redirect:/tdboard?page=" + page;
		else
			return "error";
	}
}
