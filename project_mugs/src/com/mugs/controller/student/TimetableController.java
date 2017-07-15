package com.mugs.controller.student;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mugs.service.student.TimetableManagementService;
import com.mugs.vo.Users;

@Controller
@RequestMapping("/student/")
public class TimetableController {
   
   @Autowired
   private TimetableManagementService timeTableManagementServiceImpl;
   
   @RequestMapping("getMyTimeTable")
   public ModelAndView getMyTimeTable(){
      
      ModelAndView model = new ModelAndView();
      
      Users users = (Users)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
      String loginId = users.getUsersId();
      
      HashMap<String, Object> map = timeTableManagementServiceImpl.findMyTimeTableByJoin(loginId);
      
      Iterator iterator = map.entrySet().iterator();
      
      // map의 다음 키값이 있는지 없는지 확인하면서 작업 진행
      while (iterator.hasNext()) {
         Entry entry = (Entry)iterator.next();
         if(entry.getKey().toString() == "stuRegisterTimeTable") {
            if(entry.getValue().equals("휴학") || entry.getValue().equals("군휴학")) {
               model.setViewName("index.tiles");   
               model.addObject(entry.getKey().toString(), entry.getValue());   // 현재 휴학상태를 model에 담고 리턴
               return model;
            }
         } else if(entry.getKey().toString() == "message" && !entry.getValue().equals("")) {
            model.setViewName("index.tiles");
            model.addObject(entry.getKey().toString(), entry.getValue()); // 지금 수강하고있는 과목이 없다는 메세지 담아서 리턴
            return model;
         }
         model.addObject(entry.getKey().toString(), entry.getValue());   // 재적상태도 정상이고 지금 현재 수강하고 있는 과목이 있으면 수강과목 리스트를 담는다.
      }
      model.setViewName("student/timeTable/myTimeTableView.tiles"); // 재적상태도 정상이고 지금 현재수강하고 있는 과목이 있으면 수강과목 리스트 갖고 시간표페이지로 이동
      return model;
   }
   
	@RequestMapping("getMapByBuildingName")
	public ModelAndView getMapByBuildingName(String subjectName, String buildingName, String roomName){
		Map<String , Object> map = new HashMap<>();
		map.put("building", timeTableManagementServiceImpl.findBuildingByBuildingName(buildingName));
		map.put("subjectName", subjectName);
		map.put("roomName", roomName);
		
		return new ModelAndView("view/contents/student/timeTable/buildingMap", "map", map);
	}
}