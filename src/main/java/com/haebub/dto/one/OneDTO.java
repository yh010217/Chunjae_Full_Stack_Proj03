package com.haebub.dto.one;


public class OneDTO {

    private String otitle;
    private String ocontent;
    private String regdate;
    private boolean osecret;
    private int uid;
    private int lid;

    public String getOtitle() {
        return otitle;
    }

    public void setOtitle(String otitle) {
        this.otitle = otitle;
    }

    public String getOcontent() {
        return ocontent;
    }

    public void setOcontent(String ocontent) {
        this.ocontent = ocontent;
    }

    public String getRegdate() {
        return regdate;
    }

    public void setRegdate(String regdate) {
        this.regdate = regdate;
    }

    public boolean isOsecret() {
        return osecret;
    }

    public void setOsecret(boolean osecret) {
        this.osecret = osecret;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getLid() {
        return lid;
    }

    public void setLid(int lid) {
        this.lid = lid;
    }

    public OneDTO(String otitle, String ocontent, String regdate, boolean osecret, int uid, int lid) {
        this.otitle = otitle;
        this.ocontent = ocontent;
        this.regdate = regdate;
        this.osecret = osecret;
        this.uid = uid;
        this.lid = lid;
    }

    public OneDTO() {
    }

}
