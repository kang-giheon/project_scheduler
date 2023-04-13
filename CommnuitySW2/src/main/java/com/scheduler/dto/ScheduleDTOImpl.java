package com.scheduler.dto;


public class ScheduleDTOImpl implements ScheduleDTO {
	private String subject;
	private String startDate;
	private String endDate;
	private String memo;
	public String getSubject() {
		return subject;
	}
	
	public String getStartDate() {
		return startDate;
	}
	
	public String getEndDate() {
		return endDate;
	}
	
	public String getMemo() {
		return memo;
	}
	
	public ScheduleDTOImpl(String subject, String startDate, String endDate, String memo) {
		super();
		this.subject = subject;
		this.startDate = startDate;
		this.endDate = endDate;
		this.memo = memo;
	}
	
	public ScheduleDTOImpl() {
		super();
	}
	
	@Override
	public void setSubject(String subject) {
		// TODO Auto-generated method stub
		this.subject=subject;
		
	}
	@Override
	public void setStartDate(String startdate) {
		// TODO Auto-generated method stub
		this.startDate=startdate;
		
	}
	@Override
	public void setEndDate(String enddate) {
		// TODO Auto-generated method stub
		this.endDate=enddate;
		
	}
	@Override
	public void setMemo(String memo) {
		// TODO Auto-generated method stub
		this.memo=memo;
		
	}
	
	
}
