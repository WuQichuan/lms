package com.ruoyi.project.system.literature.controller;

import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.system.author.domain.Author;
import com.ruoyi.project.system.author.service.IAuthorService;
import com.ruoyi.project.system.literature.domain.Literature;
import com.ruoyi.project.system.literature.service.ILiteratureService;
import com.ruoyi.project.system.literaturetype.domain.Literaturetype;
import com.ruoyi.project.system.literaturetype.service.ILiteraturetypeService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 文献信息操作处理
 * 
 * @author wuqichuan
 * @date 2019-04-04
 */
@Controller
@RequestMapping("/lms/literature")
public class LiteratureController extends BaseController
{
    private String prefix = "lms/literature";
	
	@Autowired
	private ILiteratureService literatureService;
	@Autowired
	private ILiteraturetypeService literaturetypeService;
	@Autowired
	private IAuthorService authorService;
	
	@RequiresPermissions("lms:literature:view")
	@GetMapping()
	public String literature(ModelMap mmap)
	{
		mmap.put("literaturetype", literaturetypeService.selectLiteraturetypeList(new Literaturetype()));
		mmap.put("author", authorService.selectAuthorList(new Author()));
		return prefix + "/literature";
	}
	
	/**
	 * 查询文献列表
	 */
	@RequiresPermissions("lms:literature:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(Literature literature)
	{
		startPage();
        List<Literature> list = literatureService.selectLiteratureList(literature);
		return getDataTable(list);
	}
	
	
	/**
	 * 导出文献列表
	 */
	@RequiresPermissions("lms:literature:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Literature literature)
    {
    	List<Literature> list = literatureService.selectLiteratureList(literature);
        ExcelUtil<Literature> util = new ExcelUtil<Literature>(Literature.class);
        return util.exportExcel(list, "literature");
    }
	
	/**
	 * 新增文献
	 */
	@GetMapping("/add")
	public String add(ModelMap mmap)
	{
		mmap.put("literaturetype", literaturetypeService.selectLiteraturetypeList(new Literaturetype()));
		mmap.put("author", authorService.selectAuthorList(new Author()));
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存文献
	 */
	@RequiresPermissions("lms:literature:add")
	@Log(title = "文献", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(Literature literature)
	{		
		return toAjax(literatureService.insertLiterature(literature));
	}

	/**
	 * 修改文献
	 */
	@GetMapping("/edit/{literatureId}")
	public String edit(@PathVariable("literatureId") Integer literatureId, ModelMap mmap)
	{
		Literature literature = literatureService.selectLiteratureById(literatureId);
		mmap.put("literaturetype", literaturetypeService.selectLiteraturetypeList(new Literaturetype()));
		mmap.put("author", authorService.selectAuthorList(new Author()));
		mmap.put("literature", literature);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存文献
	 */
	@RequiresPermissions("lms:literature:edit")
	@Log(title = "文献", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(Literature literature)
	{		
		return toAjax(literatureService.updateLiterature(literature));
	}
	
	/**
	 * 删除文献
	 */
	@RequiresPermissions("lms:literature:remove")
	@Log(title = "文献", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(literatureService.deleteLiteratureByIds(ids));
	}
	
}
