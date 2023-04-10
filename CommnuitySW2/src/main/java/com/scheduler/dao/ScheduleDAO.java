package com.scheduler.dao;

import java.util.List;

import com.scheduler.dto.ScheduleDTOImpl;

public interface ScheduleDAO {
	public List<ScheduleDTOImpl> showSchedule() throws Exception; 
}
