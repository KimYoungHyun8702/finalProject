package com.mugs.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mugs.service.admin.BuildingService;
import com.mugs.vo.Building;
import com.mugs.vo.Room;

@Controller
@RequestMapping("/admin/")
public class BuildingController {
	
	@Autowired
	private BuildingService buildingService;
	
	@RequestMapping("/selectBuildingListController")
	@ResponseBody
	public ModelAndView selectBuildingList(){
		List<Building> list = buildingService.selectBuildingList();
		return new ModelAndView("contents/admin/building/select_building","list",list);
	}
	
	@RequestMapping("/selectBuildingByIdController")
	public ModelAndView selectBuildingById(int buildingId){
		Building building = buildingService.selectBuildingById(buildingId);
		return new ModelAndView("contents/admin/building/select_building_info","building",building);
	}
	
	@RequestMapping("/selectBuildingNameController")
	public ModelAndView selectBuildingNameController(){
		List<Building> list = buildingService.selectBuildingList();
		return new ModelAndView("contents/admin/room/insert_room","list",list);
	}
	
	@RequestMapping("/selectBuildingNameForUpdateController")
	public ModelAndView selectBuildingNameForUpdateController(){
		List<Building> list = buildingService.selectBuildingList();
		return new ModelAndView("contents/admin/room/update_room","list",list);
	}
	
	@RequestMapping("/insertBuildingController")
	public String insertBuilding(Building building){
		buildingService.insertBuilding(building);
		return "redirect:/admin/selectBuildingListController.do";
	}
	
	@RequestMapping("/updateBuildingController")
	public String updateBuilding(Building building){
		buildingService.updateBuildingById(building);
		return "redirect:/admin/selectBuildingListController.do";
	}
	
	@RequestMapping("/deleteBuildingController")
	public String deleteBuilding(int buildingId){
		buildingService.deleteBuilding(buildingId);
		return "redirect:/admin/selectBuildingListController.do";
	}
	
	@RequestMapping("/insertRoomController")
	public ModelAndView insertRoom(Room room){
		int buildingId = buildingService.insertRoom(room);
		return new ModelAndView ("redirect:/admin/selectBuildingByIdController.do","buildingId",buildingId);
	}
	
	@RequestMapping("/selectRoomByReferenceController")
	@ResponseBody
	public List<Room> selectRoomByReference(int buildingId){
		List<Room> list = buildingService.selectRoomByReference(buildingId);
		return list;
	}
	
	@RequestMapping("/selectRoomForProfessorController")
	@ResponseBody
	public List<Room> selectRoomForProfessor(int office){
		List<Room> list = buildingService.selectRoomByReference(office);
		return list;
	}
	
	@RequestMapping("/updateRoomController")
	public ModelAndView updateRoom(Room room){
		int buildingId = buildingService.updateRoom(room);
		return new ModelAndView ("redirect:/admin/selectBuildingByIdController.do","buildingId",buildingId);
	}
	
	@RequestMapping("/deleteRoomController")
	public ModelAndView deleteRoom(int roomId){
		int buildingId = buildingService.deleteRoom(roomId);
		return new ModelAndView ("redirect:/admin/selectBuildingByIdController.do","buildingId",buildingId);
	}
}
