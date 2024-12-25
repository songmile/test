package cqie.edu.NotebookSystem.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
    //默认首页:打开登录页面
    @GetMapping("/")
    public String login() {
        return "user/login";
    }

    //打开首页页面
    @GetMapping("/home/index")
    public String index() {
        return "home/index";
    }
    //打开关于系统页面
    @GetMapping("/home/about")
    public String about() {
        return "home/about";
    }
}
