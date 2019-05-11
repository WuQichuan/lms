package com.ruoyi.project.system.literaturetype.controller;

import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.system.literaturetype.domain.Literaturetype;
import com.ruoyi.project.system.literaturetype.service.ILiteraturetypeService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 文献类目信息操作处理
 * 
 * @author wuqichuan
 * @date 2019-04-04
 */
@Controller
@RequestMapping("/lms/literaturetype")
public class LiteraturetypeController extends BaseController
{
    private String prefix = "lms/literaturetype";
	
	@Autowired
	private ILiteraturetypeService literaturetypeService;
	

	@GetMapping()
	public String literaturetype()
	{
	    return prefix + "/literaturetype";
	}
	
	/**
	 * 查询文献类目列表
	 */

	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(Literaturetype literaturetype)
	{
		startPage();
        List<Literaturetype> list = literaturetypeService.selectLiteraturetypeList(literaturetype);
		return getDataTable(list);
	}
	
	
	/**
	 * 导出文献类目列表
	 */

    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Literaturetype literaturetype)
    {
    	List<Literaturetype> list = literaturetypeService.selectLiteraturetypeList(literaturetype);
        ExcelUtil<Literaturetype> util = new ExcelUtil<Literaturetype>(Literaturetype.class);
        return util.exportExcel(list, "literaturetype");
    }
	
	/**
	 * 新增文献类目
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存文献类目
	 */

	@Log(title = "文献类目", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(Literaturetype literaturetype)
	{		
		return toAjax(literaturetypeService.insertLiteraturetype(literaturetype));
	}

	/**
	 * 修改文献类目
	 */
	@GetMapping("/edit/{typeId}")
	public String edit(@PathVariable("typeId") Integer typeId, ModelMap mmap)
	{
		Literaturetype literaturetype = literaturetypeService.selectLiteraturetypeById(typeId);
		mmap.put("literaturetype", literaturetype);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存文献类目
	 */

	@Log(title = "文献类目", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(Literaturetype literaturetype)
	{		
		return toAjax(literaturetypeService.updateLiteraturetype(literaturetype));
	}
	
	/**
	 * 删除文献类目
	 */

	@Log(title = "文献类目", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		if(literaturetypeService.checkDelete(Integer.parseInt(ids))){
			return toAjax(literaturetypeService.deleteLiteraturetypeByIds(ids));
		}else{
			return AjaxResult.warn("该文献类目下存才文献，不允许删除");
		}

	}
	
}
