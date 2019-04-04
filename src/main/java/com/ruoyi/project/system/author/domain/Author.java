package com.ruoyi.project.system.author.domain;

import com.ruoyi.framework.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.Date;

/**
 * 作者表 tb_author
 * 
 * @author wuqichuan
 * @date 2019-04-04
 */
public class Author extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** 作者ID */
	private Integer authorId;
	/** 作者名称 */
	private String authorName;
	/** authorCreateTime */
	private String anthorSynopsis;
	/** 作者创建时间 */
	private Date authorCreateTime;

	public void setAuthorId(Integer authorId) 
	{
		this.authorId = authorId;
	}

	public Integer getAuthorId() 
	{
		return authorId;
	}
	public void setAuthorName(String authorName) 
	{
		this.authorName = authorName;
	}

	public String getAuthorName() 
	{
		return authorName;
	}
	public void setAnthorSynopsis(String anthorSynopsis) 
	{
		this.anthorSynopsis = anthorSynopsis;
	}

	public String getAnthorSynopsis() 
	{
		return anthorSynopsis;
	}
	public void setAuthorCreateTime(Date authorCreateTime) 
	{
		this.authorCreateTime = authorCreateTime;
	}

	public Date getAuthorCreateTime() 
	{
		return authorCreateTime;
	}

    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("authorId", getAuthorId())
            .append("authorName", getAuthorName())
            .append("anthorSynopsis", getAnthorSynopsis())
            .append("authorCreateTime", getAuthorCreateTime())
            .toString();
    }
}
