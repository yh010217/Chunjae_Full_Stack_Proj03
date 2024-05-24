package com.haebub.controller.admin;

import com.haebub.dto.User.UserDTO;
import com.haebub.service.admin.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class AdminUserController {

    private final UserService userService;


    @GetMapping(value = {"/admin/user/{page}","/admin/user"})
    public String adminUser(@PathVariable(required = false)
                            String page
                            ,@RequestParam(required = false, defaultValue = "") String search
                            ,@RequestParam(required = false,defaultValue = "") String searchtxt
                            ,Model model) {
        int currpage=1;
        if(page!=null)
            currpage=Integer.parseInt(page);

        int pagesize=10;
        int pageblock=5;
        int startrow=(currpage-1)*pagesize;

        int totalCount=userService.totalCount(search, searchtxt);
        int totalpage=(int)Math.ceil(totalCount/(float)pagesize);

        int startblock=((currpage-1)/pageblock)*pageblock+1;
        int endblock=startblock+pageblock-1;
        if (totalpage < endblock)
            endblock=totalpage;
        List<UserDTO> userDTOList=userService.userDTOList(startrow,pagesize,search,searchtxt);
        model.addAttribute("userDTOList",userDTOList);
        model.addAttribute("currpage",currpage);
        model.addAttribute("search",search);
        model.addAttribute("searchtxt",searchtxt);
        model.addAttribute("startblock",startblock);
        model.addAttribute("endblock",endblock);
        model.addAttribute("totalpage",totalpage);
        return "admin/admin_user";
    }

    @GetMapping("/admin/user/modify/{uid}")
    public String adminmodify(@PathVariable int uid,Model model){
        UserDTO dto=userService.adminmodify(uid);
        model.addAttribute("dto",dto);
       return "admin/admin_usermodify";
    }

    @PostMapping("/modify_result")
    public String adminmodifyresult(@ModelAttribute UserDTO dto){
        userService.adminmodifyresult(dto);
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/delete/{uid}")
    public String delete(@PathVariable int uid){
        userService.deleteUser(uid);
        return "redirect:/admin/user";
    }





}
