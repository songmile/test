package cqie.edu.NotebookSystem.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
/*
* 可视化控制器
* */
@RestController
@RequestMapping("echarts")
public class EchartsController {

    @GetMapping("main1")
    public String main1() {
        return "Hello World";
    }
}
