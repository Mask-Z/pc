package com.ccjt.ejy.web.enums;

public enum DataType {

	GZJGJG("国资监管机构"),
	GZJGJGFYQ("国资监管机构（非央企）"),
	ZYQTBWJG("中央其他部委监管"),
	GMQYJJHYFL("国民经济行业分类"),
	GQZRFJJLX("股权转让方经济类型"),
	ZRFJJXZ("转让方经济性质"),
	BDQYJCWJLX("转让方/标的企业决策文件类型"),
	JYGM("经营规模"),
	PZWJLX("批准文件类型及文号");
	//	批准文件类型  authorizeFileType  A07001
	//增资企业经营规模 managerScale  A04001
	//增资企业所在地区 zone  110000

	;
	private String type;
	private DataType(String type){
		this.type = type;
	}
	public String getType() {
		return type;
	}
	public String toString(){
		return getType();

	}

}