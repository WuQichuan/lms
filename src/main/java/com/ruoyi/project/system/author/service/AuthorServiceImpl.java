package com.ruoyi.project.system.author.service;

import com.ruoyi.common.utils.text.Convert;
import com.ruoyi.project.system.author.domain.Author;
import com.ruoyi.project.system.author.mapper.AuthorMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 作者 服务层实现
 * 
 * @author wuqichuan
 * @date 2019-04-04
 */
@Service
public class AuthorServiceImpl implements IAuthorService
{
	@Autowired
	private AuthorMapper authorMapper;

	/**
     * 查询作者信息
     * 
     * @param authorId 作者ID
     * @return 作者信息
     */
    @Override
	public Author selectAuthorById(Integer authorId)
	{
	    return authorMapper.selectAuthorById(authorId);
	}
	
	/**
     * 查询作者列表
     * 
     * @param author 作者信息
     * @return 作者集合
     */
	@Override
	public List<Author> selectAuthorList(Author author)
	{
	    return authorMapper.selectAuthorList(author);
	}
	
    /**
     * 新增作者
     * 
     * @param author 作者信息
     * @return 结果
     */
	@Override
	public int insertAuthor(Author author)
	{
	    return authorMapper.insertAuthor(author);
	}
	
	/**
     * 修改作者
     * 
     * @param author 作者信息
     * @return 结果
     */
	@Override
	public int updateAuthor(Author author)
	{
	    return authorMapper.updateAuthor(author);
	}

	/**
     * 删除作者对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteAuthorByIds(String ids)
	{
		return authorMapper.deleteAuthorByIds(Convert.toStrArray(ids));
	}
	
}
