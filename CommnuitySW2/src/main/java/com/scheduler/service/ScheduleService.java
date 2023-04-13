package com.scheduler.service;

import java.util.List;

import com.scheduler.dto.ScheduleDTOImpl;

public interface ScheduleService {
	List<ScheduleDTOImpl> showSchedule() throws Exception;
}
