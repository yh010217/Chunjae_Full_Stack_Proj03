package com.haebub.controller.login;

import com.haebub.dto.UserDTO;
import com.haebub.service.join.JoinService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;


@Controller
public class JoinController {

    private JoinService service;

    @Autowired
    public JoinController(JoinService service) {
        this.service = service;
    }

    @GetMapping("/signup")
    public String Singup() {
        return "login/signup";
    }

    @GetMapping("/join")
    public String Join() {
        return "login/join";
    }
    //회원가입 처리
    @PostMapping (value = "/join_result")
    public String Joinresult(UserDTO dto) throws Exception{
        service.joinresult(dto);
//        int result=service.idcheck(dto);
//        try {
//            if (result==1){
//                return "/member/join";
//            }else if (result==0){
//                service.joinresult(dto);
//            }
//            //존재한다면 다시 회원가입 페이지
//            // 없다면 회원가입성공
//        }catch (Exception e){
//            throw new RuntimeException();
//        }
        return "redirect:/index";
//       return "redicrect:/";

    }


@RequestMapping("/checkId")
    //@ResponseBody ajax 값을 바로jsp 로 보내기위해 사용
    public String checkId(@RequestParam("id") String id) {
        String result="N";

        int flag =service.checkId(id);

        if(flag == 1) result ="Y";
        //아이디가 있을시 Y 없을시 N 으로jsp view 로 보냄
        return result;
    }

    @GetMapping("/checkId2")
    public @ResponseBody HashMap<String,Object> checkId2(@RequestParam("id") String id){
        HashMap<String,Object> hm = new HashMap<>();
        hm.put("result",service.checkId(id));
        return hm;
    }
    @GetMapping("/nickcheck")
    public @ResponseBody HashMap<String,Object> checkNick(@RequestParam("nickname") String nickname){
        HashMap<String,Object> hm = new HashMap<>();
        hm.put("result",service.checkNick(nickname));
        return hm;
    }
    @GetMapping("/echeck")
    public @ResponseBody HashMap<String,Object> checkEmail(@RequestParam("email") String email){
        HashMap<String,Object> hm = new HashMap<>();
        hm.put("result",service.checkEmail(email));
        return hm;
    }


}


