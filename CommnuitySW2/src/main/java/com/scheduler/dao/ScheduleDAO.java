package com.scheduler.dao;

import java.util.List;

import com.scheduler.dto.ScheduleDTOImpl;

public interface ScheduleDAO {
	public List<ScheduleDTOImpl> showSchedule();
	public List<ScheduleDTOImpl> showSchedulePickDate(ScheduleDTOImpl schedule);
	public void addSchedule(ScheduleDTOImpl schedule);
	public void updateSchedule();
	public void deleteSchedule();
}
