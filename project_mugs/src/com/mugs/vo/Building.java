package com.mugs.vo;

import java.io.Serializable;
import java.util.List;

public class Building implements Serializable {

   private int buildingId;
   private String buildingName;
   private String buildingImg;
   private double buildingX;
   private double buildingY;
   private String buildingPhoneNum;
   private String buildingAddr;

   private List<Room> roomList;

   public Building() {
   }

   public Building(int buildingId, String buildingName, String buildingImg, double buildingX, double buildingY,
         String buildingPhoneNum, String buildingAddr) {
      this.buildingId = buildingId;
      this.buildingName = buildingName;
      this.buildingImg = buildingImg;
      this.buildingX = buildingX;
      this.buildingY = buildingY;
      this.buildingPhoneNum = buildingPhoneNum;
      this.buildingAddr = buildingAddr;
   }

   public Building(int buildingId, String buildingName, String buildingImg, double buildingX, double buildingY,
         String buildingPhoneNum, String buildingAddr, List<Room> roomList) {
      this.buildingId = buildingId;
      this.buildingName = buildingName;
      this.buildingImg = buildingImg;
      this.buildingX = buildingX;
      this.buildingY = buildingY;
      this.buildingPhoneNum = buildingPhoneNum;
      this.buildingAddr = buildingAddr;
      this.roomList = roomList;
   }

   public int getBuildingId() {
      return buildingId;
   }

   public void setBuildingId(int buildingId) {
      this.buildingId = buildingId;
   }

   public String getBuildingName() {
      return buildingName;
   }

   public void setBuildingName(String buildingName) {
      this.buildingName = buildingName;
   }

   public String getBuildingImg() {
      return buildingImg;
   }

   public void setBuildingImg(String buildingImg) {
      this.buildingImg = buildingImg;
   }

   public double getBuildingX() {
      return buildingX;
   }

   public void setBuildingX(double buildingX) {
      this.buildingX = buildingX;
   }

   public double getBuildingY() {
      return buildingY;
   }

   public void setBuildingY(double buildingY) {
      this.buildingY = buildingY;
   }

   public String getBuildingPhoneNum() {
      return buildingPhoneNum;
   }

   public void setBuildingPhoneNum(String buildingPhoneNum) {
      this.buildingPhoneNum = buildingPhoneNum;
   }

   public String getBuildingAddr() {
      return buildingAddr;
   }

   public void setBuildingAddr(String buildingAddr) {
      this.buildingAddr = buildingAddr;
   }

   public List<Room> getRoomList() {
      return roomList;
   }

   public void setRoomList(List<Room> roomList) {
      this.roomList = roomList;
   }

   @Override
   public int hashCode() {
      final int prime = 31;
      int result = 1;
      result = prime * result + ((buildingAddr == null) ? 0 : buildingAddr.hashCode());
      result = prime * result + buildingId;
      result = prime * result + ((buildingImg == null) ? 0 : buildingImg.hashCode());
      result = prime * result + ((buildingName == null) ? 0 : buildingName.hashCode());
      result = prime * result + ((buildingPhoneNum == null) ? 0 : buildingPhoneNum.hashCode());
      long temp;
      temp = Double.doubleToLongBits(buildingX);
      result = prime * result + (int) (temp ^ (temp >>> 32));
      temp = Double.doubleToLongBits(buildingY);
      result = prime * result + (int) (temp ^ (temp >>> 32));
      result = prime * result + ((roomList == null) ? 0 : roomList.hashCode());
      return result;
   }

   @Override
   public boolean equals(Object obj) {
      if (this == obj)
         return true;
      if (obj == null)
         return false;
      if (getClass() != obj.getClass())
         return false;
      Building other = (Building) obj;
      if (buildingAddr == null) {
         if (other.buildingAddr != null)
            return false;
      } else if (!buildingAddr.equals(other.buildingAddr))
         return false;
      if (buildingId != other.buildingId)
         return false;
      if (buildingImg == null) {
         if (other.buildingImg != null)
            return false;
      } else if (!buildingImg.equals(other.buildingImg))
         return false;
      if (buildingName == null) {
         if (other.buildingName != null)
            return false;
      } else if (!buildingName.equals(other.buildingName))
         return false;
      if (buildingPhoneNum == null) {
         if (other.buildingPhoneNum != null)
            return false;
      } else if (!buildingPhoneNum.equals(other.buildingPhoneNum))
         return false;
      if (Double.doubleToLongBits(buildingX) != Double.doubleToLongBits(other.buildingX))
         return false;
      if (Double.doubleToLongBits(buildingY) != Double.doubleToLongBits(other.buildingY))
         return false;
      if (roomList == null) {
         if (other.roomList != null)
            return false;
      } else if (!roomList.equals(other.roomList))
         return false;
      return true;
   }

   @Override
   public String toString() {
      return "Building [buildingId=" + buildingId + ", buildingName=" + buildingName + ", buildingImg=" + buildingImg
            + ", buildingX=" + buildingX + ", buildingY=" + buildingY + ", buildingPhoneNum=" + buildingPhoneNum
            + ", buildingAddr=" + buildingAddr + ", roomList=" + roomList + "]";
   }

}