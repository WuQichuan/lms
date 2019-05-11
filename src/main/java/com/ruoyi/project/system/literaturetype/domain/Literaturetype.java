package com.ruoyi.project.system.literaturetype.domain;

import com.ruoyi.framework.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.Date;

/**
 * 文献类目表 tb_literaturetype
 * 
 * @author wuqichuan
 * @date 2019-04-04
 */
public class Literaturetype extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** 文献类目ID */
	private Integer typeId;
	/** 文献类目名称 */
	private String typeName;
	/** 文献类目创建时间 */
	private Date typeCreateTime;

	public void setTypeId(Integer typeId) 
	{
		this.typeId = typeId;
	}

	public Integer getTypeId() 
	{
		return typeId;
	}
	public void setTypeName(String typeName) 
	{
		this.typeName = typeName;
	}

	public String getTypeName() 
	{
		return typeName;
	}
	public void setTypeCreateTime(Date typeCreateTime) 
	{
		this.typeCreateTime = typeCreateTime;
	}

	public Date getTypeCreateTime() 
	{
		return typeCreateTime;
	}



	public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("typeId", getTypeId())
            .append("typeName", getTypeName())
            .append("typeCreateTime", getTypeCreateTime())
            .toString();
    }
}
