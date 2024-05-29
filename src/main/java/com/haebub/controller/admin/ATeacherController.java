package com.haebub.controller.admin;

import com.haebub.dto.Lecutre.LectureDTO;
import com.haebub.dto.admin.TeacherDTO;
import com.haebub.service.admin.TeacherService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class ATeacherController {

    private final TeacherService teacherService;

    /** 강사 관리 */
    @GetMapping("/admin/teacher")
    public String teacher(Model model){
        List<TeacherDTO> list = teacherService.teacherList();
        model.addAttribute("list", list);
        return "admin/admin_teacher";
    }

    /** 강사 등록 */
    @GetMapping("/admin/register")
    public String register(TeacherDTO dto, Model model )
    {
        model.addAttribute("dto", dto);
        return "admin/teacher_register";
    }

    /** 등록 정보 받기 */
    @PostMapping("/admin/registerResult")
    public String teacherinsert(TeacherDTO dto, Model model, HttpServletRequest request) {
        String base="/uploadImg/teacher";
        String realpath= request.getSession().getServletContext().getRealPath(base);
        System.out.println("realpath....."+realpath);
        try {
            teacherService.teacherRegister(realpath, dto);
        }  catch (Exception e) {
            System.out.println(e);
            throw new RuntimeException(e);
        }

        model.addAttribute("dto", dto);

        return "redirect:/admin/teacher";

    }

    @GetMapping( value="/getImg/{tid}", produces = {MediaType.IMAGE_GIF_VALUE, MediaType.IMAGE_PNG_VALUE})
    public ResponseEntity<byte[]> getTeacherImage(@PathVariable String tid
            , HttpServletRequest request) {
        String path="/uploadImg/teacher";
        String realpath= request.getSession().getServletContext().getRealPath(path);

        String fname = "";
        /*if (tid.contains("_")) {
            String[] truename = tid.split("_");
            fname = URLEncoder.encode(truename[1], StandardCharsets.UTF_8).replace("+", "%20");
        } else {
            fname = URLEncoder.encode(tid, StandardCharsets.UTF_8).replace("+", "%20");
        }*/
        fname = URLEncoder.encode(tid, StandardCharsets.UTF_8).replace("+", "%20");
        InputStream in = null;
        ResponseEntity<byte[]> entity=null;
        try {
            in = new FileInputStream(realpath + "/" + fname);
            HttpHeaders headers=new HttpHeaders();

            entity=new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(in)
                    ,headers,  HttpStatus.OK);

        }catch(IOException e)
        {
            System.out.println(e);
            entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        return entity;
    }

    /** 강사 삭제 */
    @RequestMapping(value = "/admin/deleteTeacher/{tid}", method = RequestMethod.DELETE)
    @ResponseBody
    public Map<String, Boolean> deleteTeacher(@PathVariable int tid) {
        Map<String, Boolean> response = new HashMap<>();
        try {
            // 강사 삭제 로직 구현
            teacherService.deleteTeacher(tid);
            response.put("success", true);
        } catch (Exception e) {
            e.printStackTrace();
            response.put("success", false);
        }
        return response;
    }

    /** 강사 등록 id 존재 체크 */
    @GetMapping("/idcheck")
    public @ResponseBody HashMap<String,Object> checkNick(@RequestParam("id") String id){
        HashMap<String,Object> hm = new HashMap<>();
        hm.put("result",teacherService.idExist(id));
        return hm;
    }



}
