package com.ccjt.ejy.web.commons;

/**
 * 分页工具类
 * @author rocky(huangchunjie0513@163.com)
 *
 */
public class PageUtil {

    /**
     * 获取起始索引（索引从0开始）
     * @param page
     * @param pageSize
     * @return
     */
    public static int getStart(int page, int pageSize){
        page = page <= 0 ? 1 : page;
        int start = (page - 1) * pageSize;
        return start;
    }
    
    /**
     * 获取总页数
     * @param count
     * @param pageSize
     * @return
     */
    public static int getTotalPage(int count, int pageSize) {
        if (count < pageSize || pageSize ==0) { return 1; }
        return count % pageSize == 0 ? count / pageSize : count / pageSize + 1;
    }
    
}
