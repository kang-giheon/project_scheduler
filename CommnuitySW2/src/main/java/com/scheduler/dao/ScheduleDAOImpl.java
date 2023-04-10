package com.scheduler.dao;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scheduler.dto.ScheduleDTOImpl;

@Repository
public class ScheduleDAOImpl implements ScheduleDAO {

	
	public List<ScheduleDTOImpl> showSchedule() throws Exception{
		List<ScheduleDTOImpl> list = new ArrayList<ScheduleDTOImpl>();
		ScheduleDTOImpl dto = new ScheduleDTOImpl("테스트","2023-04-06","2023-04-07","테스트입니다.");
		list.add(dto);
		return list;
	}
}
