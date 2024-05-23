package com.haebub.dto.one;


public class OneDTO {

    private String otitle;
    private String ocontent;
    private String oregdate;
    private boolean osecret;
    private int uid;
    private int lid;

    private String oans;

    private String owriter;

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

    public String getOregdate() {
        return oregdate;
    }

    public void setOregdate(String oregdate) {
        this.oregdate = oregdate;
    }

    public String getOans() {
        return oans;
    }

    public void setOans(String oans) {
        this.oans = oans;
    }

    public OneDTO(String otitle, String ocontent, String oregdate, boolean osecret, int uid, int lid, String oans, String owriter) {
        this.otitle = otitle;
        this.ocontent = ocontent;
        this.oregdate = oregdate;
        this.osecret = osecret;
        this.uid = uid;
        this.lid = lid;
        this.oans = oans;
        this.owriter = owriter;
    }

    public String getOwriter() {
        return owriter;
    }

    public void setOwriter(String owriter) {
        this.owriter = owriter;
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


    public OneDTO() {
    }

}
