package com.ruoyi.project.system.literature.domain;

import com.ruoyi.framework.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.beans.Transient;
import java.util.Date;

/**
 * 文献表 tb_literature
 * 
 * @author wuqichuan
 * @date 2019-04-04
 */
public class Literature extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** 文献ID */
	private Integer literatureId;
	/** 文献标题 */
	private String literatureTitle;
	/** 文献类目id */
	private Integer literatureTypeId;
	/** 文献作者ID */
	private Integer literatureAuthorId;
	/** 文献内容 */
	private String literatureContent;
	/** 文献创建时间 */
	private Date literatureCreateTime;
	/** 文献状态 */
	private Integer literatureStatus;

	//以下为查询使用的冗余字段
	/** 文献类目名称 */
	private String typeName;
	/** 作者名称 */
	private String authorName;


	public void setLiteratureId(Integer literatureId) 
	{
		this.literatureId = literatureId;
	}

	public Integer getLiteratureId() 
	{
		return literatureId;
	}
	public void setLiteratureTitle(String literatureTitle) 
	{
		this.literatureTitle = literatureTitle;
	}

	public String getLiteratureTitle() 
	{
		return literatureTitle;
	}
	public void setLiteratureTypeId(Integer literatureTypeId) 
	{
		this.literatureTypeId = literatureTypeId;
	}

	public Integer getLiteratureTypeId() 
	{
		return literatureTypeId;
	}
	public void setLiteratureAuthorId(Integer literatureAuthorId) 
	{
		this.literatureAuthorId = literatureAuthorId;
	}

	public Integer getLiteratureAuthorId() 
	{
		return literatureAuthorId;
	}
	public void setLiteratureContent(String literatureContent) 
	{
		this.literatureContent = literatureContent;
	}

	public String getLiteratureContent() 
	{
		return literatureContent;
	}
	public void setLiteratureCreateTime(Date literatureCreateTime) 
	{
		this.literatureCreateTime = literatureCreateTime;
	}

	public Date getLiteratureCreateTime() 
	{
		return literatureCreateTime;
	}
	public void setLiteratureStatus(Integer literatureStatus) 
	{
		this.literatureStatus = literatureStatus;
	}

	public Integer getLiteratureStatus() 
	{
		return literatureStatus;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getAuthorName() {
		return authorName;
	}

	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}

	public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("literatureId", getLiteratureId())
            .append("literatureTitle", getLiteratureTitle())
            .append("literatureTypeId", getLiteratureTypeId())
            .append("literatureAuthorId", getLiteratureAuthorId())
            .append("literatureContent", getLiteratureContent())
            .append("literatureCreateTime", getLiteratureCreateTime())
            .append("literatureStatus", getLiteratureStatus())
            .toString();
    }
}
