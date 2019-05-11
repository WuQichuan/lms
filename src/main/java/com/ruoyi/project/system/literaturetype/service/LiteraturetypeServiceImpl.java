package com.ruoyi.project.system.literaturetype.service;

import com.ruoyi.common.utils.text.Convert;
import com.ruoyi.project.system.literature.mapper.LiteratureMapper;
import com.ruoyi.project.system.literaturetype.domain.Literaturetype;
import com.ruoyi.project.system.literaturetype.mapper.LiteraturetypeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 文献类目 服务层实现
 * 
 * @author wuqichuan
 * @date 2019-04-04
 */
@Service
public class LiteraturetypeServiceImpl implements ILiteraturetypeService
{
	@Autowired
	private LiteraturetypeMapper literaturetypeMapper;

	@Autowired
	private LiteratureMapper literatureMapper;

	/**
     * 查询文献类目信息
     * 
     * @param typeId 文献类目ID
     * @return 文献类目信息
     */
    @Override
	public Literaturetype selectLiteraturetypeById(Integer typeId)
	{
	    return literaturetypeMapper.selectLiteraturetypeById(typeId);
	}
	
	/**
     * 查询文献类目列表
     * 
     * @param literaturetype 文献类目信息
     * @return 文献类目集合
     */
	@Override
	public List<Literaturetype> selectLiteraturetypeList(Literaturetype literaturetype)
	{
	    return literaturetypeMapper.selectLiteraturetypeList(literaturetype);
	}
	
    /**
     * 新增文献类目
     * 
     * @param literaturetype 文献类目信息
     * @return 结果
     */
	@Override
	public int insertLiteraturetype(Literaturetype literaturetype)
	{
	    return literaturetypeMapper.insertLiteraturetype(literaturetype);
	}
	
	/**
     * 修改文献类目
     * 
     * @param literaturetype 文献类目信息
     * @return 结果
     */
	@Override
	public int updateLiteraturetype(Literaturetype literaturetype)
	{
	    return literaturetypeMapper.updateLiteraturetype(literaturetype);
	}

	/**
     * 删除文献类目对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteLiteraturetypeByIds(String ids)
	{
		return literaturetypeMapper.deleteLiteraturetypeByIds(Convert.toStrArray(ids));
	}

	/**
	 * 检查是否可以删除
	 *
	 * @param literatureTypeId 文献类目ID
	 * @return 结果
	 */
	@Override
	public Boolean checkDelete(Integer literatureTypeId) {
		if(literatureMapper.checkDeleteType(literatureTypeId) > 0){
			return false;
		}else {
			return true;
		}
	}

}
