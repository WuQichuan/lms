package com.ruoyi.project.system.author.controller;

import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.system.author.domain.Author;
import com.ruoyi.project.system.author.service.IAuthorService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 作者信息操作处理
 * 
 * @author wuqichuan
 * @date 2019-04-04
 */
@Controller
@RequestMapping("/lms/author")
public class AuthorController extends BaseController
{
    private String prefix = "lms/author";
	
	@Autowired
	private IAuthorService authorService;
	
	@RequiresPermissions("lms:author:view")
	@GetMapping()
	public String author()
	{
	    return prefix + "/author";
	}
	
	/**
	 * 查询作者列表
	 */
	@RequiresPermissions("lms:author:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(Author author)
	{
		startPage();
        List<Author> list = authorService.selectAuthorList(author);
		return getDataTable(list);
	}
	
	
	/**
	 * 导出作者列表
	 */
	@RequiresPermissions("lms:author:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Author author)
    {
    	List<Author> list = authorService.selectAuthorList(author);
        ExcelUtil<Author> util = new ExcelUtil<Author>(Author.class);
        return util.exportExcel(list, "author");
    }
	
	/**
	 * 新增作者
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存作者
	 */
	@RequiresPermissions("lms:author:add")
	@Log(title = "作者", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(Author author)
	{		
		return toAjax(authorService.insertAuthor(author));
	}

	/**
	 * 修改作者
	 */
	@GetMapping("/edit/{authorId}")
	public String edit(@PathVariable("authorId") Integer authorId, ModelMap mmap)
	{
		Author author = authorService.selectAuthorById(authorId);
		mmap.put("author", author);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存作者
	 */
	@RequiresPermissions("lms:author:edit")
	@Log(title = "作者", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(Author author)
	{		
		return toAjax(authorService.updateAuthor(author));
	}
	
	/**
	 * 删除作者
	 */
	@RequiresPermissions("lms:author:remove")
	@Log(title = "作者", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(authorService.deleteAuthorByIds(ids));
	}
	
}
