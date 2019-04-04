package com.ruoyi.project.system.literature.service;

import com.ruoyi.common.utils.text.Convert;
import com.ruoyi.project.system.literature.domain.Literature;
import com.ruoyi.project.system.literature.mapper.LiteratureMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 文献 服务层实现
 * 
 * @author wuqichuan
 * @date 2019-04-04
 */
@Service
public class LiteratureServiceImpl implements ILiteratureService
{
	@Autowired
	private LiteratureMapper literatureMapper;

	/**
     * 查询文献信息
     * 
     * @param literatureId 文献ID
     * @return 文献信息
     */
    @Override
	public Literature selectLiteratureById(Integer literatureId)
	{
	    return literatureMapper.selectLiteratureById(literatureId);
	}
	
	/**
     * 查询文献列表
     * 
     * @param literature 文献信息
     * @return 文献集合
     */
	@Override
	public List<Literature> selectLiteratureList(Literature literature)
	{
	    return literatureMapper.selectLiteratureList(literature);
	}
	
    /**
     * 新增文献
     * 
     * @param literature 文献信息
     * @return 结果
     */
	@Override
	public int insertLiterature(Literature literature)
	{
	    return literatureMapper.insertLiterature(literature);
	}
	
	/**
     * 修改文献
     * 
     * @param literature 文献信息
     * @return 结果
     */
	@Override
	public int updateLiterature(Literature literature)
	{
	    return literatureMapper.updateLiterature(literature);
	}

	/**
     * 删除文献对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteLiteratureByIds(String ids)
	{
		return literatureMapper.deleteLiteratureByIds(Convert.toStrArray(ids));
	}
	
}
