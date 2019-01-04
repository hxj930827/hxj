/**
 * FileName: BankController
 * Author:   韩旭杰
 * Date:     2018/10/26 16:08
 * Description: 银行种类管理Controller
 */
package hxj.com.controller;

import hxj.com.model.BankModel;
import hxj.com.service.BzflService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 说明：〈银行种类管理Controller〉
 *
 * @author 韩旭杰
 * @create 2018/10/26
 * @since 1.0.0
 */
@Controller
@RequestMapping("/bank")
public class BankController {

    @Autowired
    private BzflService bzflService;

    @RequestMapping("/addBank")
    public ModelAndView addBank(){
        ModelAndView model=new ModelAndView();
        // 添加银行种类管理数据
        bzflService.addBank();
        model.setViewName("/login");
        return model;
    }
}
