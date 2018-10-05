package com.forest.wu.utils;

/**
 * 分页工具类
 *
 * @author 李普强
 * @create 2018-09-29 14:38
 **/
public class Page {
    private int pageNo=1;//当前页
    private int pageSize=5;//页大小
    private int count=1;//总记录数
    private int pageCount=1;//总页数

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        if(pageNo>0){
            this.pageNo = pageNo;
        }

    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        if(pageSize>0){
            this.pageSize = pageSize;
        }

    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        if(count>0){
            this.count = count;
            this.getByet();
        }

    }

    public int getPageCount() {
        return pageCount;
    }

    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }

    public void getByet(){
        if(this.count%this.pageSize==0){
            this.pageCount=this.pageCount/this.pageSize;
        }else if(this.count%this.pageSize>0){
            this.pageCount=this.count/this.pageSize+1;
        }else{
            this.pageCount=0;
        }
    }
}
