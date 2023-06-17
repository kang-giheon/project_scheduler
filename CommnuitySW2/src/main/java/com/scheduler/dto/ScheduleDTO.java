package com.scheduler.dto;

public interface ScheduleDTO {
	public String getSubject();
	public String getStartDate();
	public String getEndDate();
	public String getMemo();
	public String getColor();
	public void setSubject(String subject);
	public void setStartDate(String startdate);
	public void setEndDate(String enddate);
	public void setMemo(String memo);
	public void setColor(String color);
}
