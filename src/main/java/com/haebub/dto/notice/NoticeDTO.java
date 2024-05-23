package com.haebub.dto.notice;


public class NoticeDTO {

    private String ntitle;
    private String ncontent;
    private String ndate;

    private int nno;

    public int getNno() {
        return nno;
    }

    public void setNno(int nno) {
        this.nno = nno;
    }

    public NoticeDTO() {
    }

    public NoticeDTO(String ntitle, String ncontent, String ndate) {
        this.ntitle = ntitle;
        this.ncontent = ncontent;
        this.ndate = ndate;
    }

    public String getNtitle() {
        return ntitle;
    }

    public void setNtitle(String ntitle) {
        this.ntitle = ntitle;
    }

    public String getNcontent() {
        return ncontent;
    }

    public void setNcontent(String ncontent) {
        this.ncontent = ncontent;
    }

    public String getNdate() {
        return ndate;
    }

    public void setNdate(String ndate) {
        this.ndate = ndate;
    }
}
