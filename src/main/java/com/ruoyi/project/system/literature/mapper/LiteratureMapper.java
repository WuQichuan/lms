package com.ruoyi.project.system.literature.mapper;

import com.ruoyi.project.system.literature.domain.Literature;

import java.util.List;

/**
 * 文献 数据层
 * 
 * @author wuqichuan
 * @date 2019-04-04
 */
public interface LiteratureMapper 
{
	/**
     * 查询文献信息
     * 
     * @param literatureId 文献ID
     * @return 文献信息
     */
	public Literature selectLiteratureById(Integer literatureId);
	
	/**
     * 查询文献列表
     * 
     * @param literature 文献信息
     * @return 文献集合
     */
	public List<Literature> selectLiteratureList(Literature literature);
	
	/**
     * 新增文献
     * 
     * @param literature 文献信息
     * @return 结果
     */
	public int insertLiterature(Literature literature);
	
	/**
     * 修改文献
     * 
     * @param literature 文献信息
     * @return 结果
     */
	public int updateLiterature(Literature literature);
	
	/**
     * 删除文献
     * 
     * @param literatureId 文献ID
     * @return 结果
     */
	public int deleteLiteratureById(Integer literatureId);
	
	/**
     * 批量删除文献
     * 
     * @param literatureIds 需要删除的数据ID
     * @return 结果
     */
	public int deleteLiteratureByIds(String[] literatureIds);
	
}