package com.mugs.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mugs.service.admin.BuildingService;
import com.mugs.vo.Building;

@Controller
@RequestMapping("/admin/")
public class BuildingController {
	
	@Autowired
	private BuildingService service;
	
	@RequestMapping("/selectBuildingListController")
	public ModelAndView selectBuildingList(){
		List<Building> list = service.selectBuildingList();
		return new ModelAndView("contents/admin/building/selectBuilding","list",list);
	}
	
	@RequestMapping("/selectBuildingByIdController")
	public ModelAndView selectBuildingById(int buildingId){
		Building building = service.selectBuildingByIdJoin(buildingId);
		if(building == null){
			building = service.selectBuildingById(buildingId);
		}
		return new ModelAndView("contents/admin/building/selectBuildingInfo","building",building);
	}
	
	@RequestMapping("/insertBuildingController")
	public String insertBuilding(Building building){
		service.insertBuilding(building);
		return "redirect:/admin/selectBuildingListController.do";
	}
	
	@RequestMapping("/updateBuildingController")
	public String updateBuilding(Building building){
		service.updateBuildingById(building);
		return "redirect:/admin/selectBuildingListController.do";
	}
	
	@RequestMapping("/deleteBuildingController")
	public String deleteBuilding(int buildingId){
		service.deleteBuilding(buildingId);
		return "redirect:/admin/selectBuildingListController.do";
	}
}
