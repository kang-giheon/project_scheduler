package com.scheduler.service;

import java.util.List;

import com.scheduler.dto.ScheduleDTOImpl;

public interface ScheduleService {
	List<ScheduleDTOImpl> showSchedule() throws Exception;
	List<ScheduleDTOImpl> showSchedulePickDate(ScheduleDTOImpl schedule) throws Exception;
	void addSchedule(ScheduleDTOImpl schedule);
}
