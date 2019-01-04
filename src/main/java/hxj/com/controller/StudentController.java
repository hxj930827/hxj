package hxj.com.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageInfo;
import hxj.com.model.BzflModel;
import hxj.com.service.BzflService;
import hxj.util.pageHelper.PageBase;
import hxj.util.redis.RedisUtil;
import hxj.util.session.UserSession;
import hxj.util.tips.Tips;

@Controller
@RequestMapping("/book")
public class StudentController {
	private static ObjectMapper objectMapper = new ObjectMapper();
	@Autowired
	private BzflService bzflService;
	/**
	 * redis������
	 */
	@Autowired
	private RedisUtil redisUtil;

	@RequestMapping("/index")
	public ModelAndView index(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		// List<BzflModel> bzflList=bzflService.showList();
		// mv.addObject("list",bzflList);
		mv.setViewName("/login");
		return mv;
	}

	@RequestMapping("/test")
	public ModelAndView test(HttpServletRequest request) {
		UserSession useSession=(UserSession) request.getSession().getAttribute("UserSession");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/noModel");
		return mv;
	}

	@RequestMapping("/getBzfl")
	public void getBzfl(HttpServletRequest requesst, HttpServletResponse response, PageBase pageBase) {

		PageInfo<BzflModel> pageInfo = bzflService.showList(pageBase);
		List<BzflModel> list = pageInfo.getList();
		// ����json
		String json = toStr(list, "", pageInfo.getTotal());
		outJson(response, json);
	}

    @RequestMapping("/indexJq")
    public ModelAndView indexJq(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/jqgrid");
        return mv;
    }

	@RequestMapping("/BzflJq")
	public void BzflJq(HttpServletRequest requesst, HttpServletResponse response) {
		List<BzflModel> list=bzflService.showList();
		String json=toStr(list);
		outJson(response,json);
	}

	public String toStr(Object obj, String msg, Long count) {
		String json_str = "";
		String new_json_str = "";
		try {
			objectMapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"));
			json_str = objectMapper.writer().writeValueAsString(obj);
			new_json_str = "{\"code\":0,\"msg\":\"" + msg + "\",\"count\":" + count + ",\"data\":" + json_str + "}";
		} catch (Exception e) {
		}

		return new_json_str;
	}

	/**
	 * �Ѷ���ת��json��
	 *
	 * @param obj
	 *            ���󣬿�����VO��List��HashMap�ȵ�
	 * @return �������ɵ�jsonֵ
	 */
	public static String toStr(Object obj) {
		String json_str = "";
		try {
			objectMapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"));
			json_str = objectMapper.writer().writeValueAsString(obj);
		} catch (Exception e) {

		}
		return json_str;
	}

	public void outJson(HttpServletResponse response, Object obj) {
		try {
			response.setContentType("application/json; charset=UTF-8");
			response.getWriter().println(obj);
		} catch (Exception e) {
		}
	}

	@RequestMapping("/upload")
	public void upload(HttpServletRequest request, HttpServletResponse response, MultipartFile[] file) {
		Tips tips = new Tips();
		try {
			String image = uploadFile(file[0], "d:");
			tips.setFlag(true);
			tips.setMsg(image);
			response.setContentType("application/json; charset=UTF-8");
			objectMapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"));
			String json_str = objectMapper.writer().writeValueAsString(tips);
			response.getWriter().println(json_str);
		} catch (IOException e) {
			tips.setFlag(false);
			tips.setMsg("�ϴ�ʧ��");
			e.printStackTrace();
		}

	}

	public static String uploadFile(MultipartFile file, String path) throws IOException {
		// ��ȡ�ϴ��ļ�����ʵ����
		String name = file.getOriginalFilename();
		// ��ȡ��׺��
		String suffixName = name.substring(name.lastIndexOf("."));
		// ����һ�����ļ���
		String fileName = "hxj" + suffixName;
		File tempFile = new File(path, fileName);
		// �������
		if (tempFile.exists()) {
			tempFile.delete();
		}
		// �����ļ���
		tempFile.createNewFile();
		file.transferTo(tempFile);
		return tempFile.getName();
	}

	/**
	 * 
	 * @param request
	 * @param response
	 * @param accountNo
	 *            �ʺ�
	 * @param password
	 *            ����
	 */
	@RequestMapping("/login")
	public void login(HttpServletRequest request, HttpServletResponse response, String accountNo, String password) {
		// ������Ϣ��ʾ��
		Tips tips=new Tips();
		tips.setFlag(true);
		tips.setMsg("��¼�ɹ�");
		// ����UserSession��
		UserSession userSession=new UserSession();
		userSession.setAccountNo(accountNo);
		userSession.setPassword(password);
		userSession.setName("�����");
		// ��ȡsession
		request.getSession().setAttribute("UserSession", userSession);
		// ���ù���ʱ��30����
		request.getSession().setMaxInactiveInterval(1000 * 60 * 30);
		
		response.setContentType("application/json; charset=UTF-8");
		objectMapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"));
		String json_str;
		try {
			json_str = objectMapper.writer().writeValueAsString(tips);
			response.getWriter().println(json_str);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	@RequestMapping("/hasKey")
	public void hasKey(HttpServletRequest request,HttpServletResponse response){
		Tips tips=new Tips();
		tips.setFlag(true);
		tips.setMsg("����redis");
		System.out.println(redisUtil.hasKey("kmglEx"));
		response.setContentType("application/json; charset=UTF-8");
		objectMapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"));
		String json_str;
		try {
			json_str = objectMapper.writer().writeValueAsString(tips);
			response.getWriter().println(json_str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
