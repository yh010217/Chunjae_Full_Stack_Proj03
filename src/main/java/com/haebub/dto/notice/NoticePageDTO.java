package com.haebub.dto.notice;

public class NoticePageDTO {
    private  int currPage;
    private int totalCount;
    private int pageSize;
    private int blockSize;
    private int startRoW;
    private int startBlock;
    private int endBlock;
    private boolean prev;
    private boolean next;

    public NoticePageDTO(int currPage, int totalCount, int pageSize, int blockSize) {
        this.currPage = currPage;
        this.totalCount = totalCount;
        this.pageSize = pageSize;
        this.blockSize = blockSize;
    }

}
