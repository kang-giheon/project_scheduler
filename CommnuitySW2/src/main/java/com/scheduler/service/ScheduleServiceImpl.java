package com.scheduler.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scheduler.dao.ScheduleDAO;
import com.scheduler.dto.ScheduleDTOImpl;

@Service
public class ScheduleServiceImpl implements ScheduleService{
	
	@Autowired
	ScheduleDAO dao;

	@Override
	public List<ScheduleDTOImpl> showSchedule() throws Exception {
		return dao.showSchedule();
	}
	
	@Override
	public List<ScheduleDTOImpl> showSchedulePickDate(ScheduleDTOImpl schedule) throws Exception {
		return dao.showSchedulePickDate(schedule);
	}

	@Override
	public void addSchedule(ScheduleDTOImpl schedule) {
		dao.addSchedule(schedule);
	}

}
