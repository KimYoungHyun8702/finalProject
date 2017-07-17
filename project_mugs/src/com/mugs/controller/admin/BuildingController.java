package com.mugs.controller.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

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
		return new ModelAndView("admin/building/select_building.tiles","list",list);
	}
	
	@RequestMapping("/selectBuildingByIdController")
	public ModelAndView selectBuildingById(int buildingId){
		Building building = buildingService.selectBuildingById(buildingId);
		return new ModelAndView("admin/building/select_building_info.tiles","building",building);
	}
	
	@RequestMapping("/selectBuildingNameController")
	public ModelAndView selectBuildingNameController(){
		List<Building> list = buildingService.selectBuildingList();
		return new ModelAndView("admin/room/insert_room.tiles","list",list);
	}
	
	@RequestMapping("/selectBuildingNameForUpdateController")
	public ModelAndView selectBuildingNameForUpdateController(){
		List<Building> list = buildingService.selectBuildingList();
		return new ModelAndView("admin/room/update_room.tiles","list",list);
	}
	
	@RequestMapping("/insertBuildingController")
	public ModelAndView insertBuilding(Building building, HttpSession session){
		session.setAttribute("buiinsertMessage", "1");
		int buildingId = buildingService.insertBuilding(building);
		return new ModelAndView("redirect:/admin/selectBuildingByIdController.do","buildingId",buildingId);
	}
	
	@RequestMapping("/updateBuildingController")
	public ModelAndView updateBuilding(Building building, HttpSession session){
		session.setAttribute("buiupdateMessage", "1");
		int buildingId = buildingService.updateBuildingById(building);
		return new ModelAndView("redirect:/admin/selectBuildingByIdController.do","buildingId",buildingId);
	}
	
	@RequestMapping("/deleteBuildingController")
	public String deleteBuilding(int buildingId, HttpSession session){
		session.setAttribute("buideleteMessage", "1");
		buildingService.deleteBuilding(buildingId);
		return "redirect:/admin/selectBuildingListController.do";
	}
	
	@RequestMapping("/insertRoomController")
	public ModelAndView insertRoom(Room room, HttpSession session){
		session.setAttribute("roominsertMessage", "1");
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
	public ModelAndView updateRoom(Room room, HttpSession session){
		session.setAttribute("roomupdateMessage", "1");
		int buildingId = buildingService.updateRoom(room);
		return new ModelAndView ("redirect:/admin/selectBuildingByIdController.do","buildingId",buildingId);
	}
	
	@RequestMapping("/deleteRoomController")
	public ModelAndView deleteRoom(int roomId, HttpSession session){
		session.setAttribute("roomdeleteMessage", "1");
		int buildingId = buildingService.deleteRoom(roomId);
		return new ModelAndView ("redirect:/admin/selectBuildingByIdController.do","buildingId",buildingId);
	}
}
