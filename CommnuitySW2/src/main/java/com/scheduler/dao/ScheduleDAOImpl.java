package com.scheduler.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.scheduler.dto.ScheduleDTOImpl;

@Repository
public class ScheduleDAOImpl implements ScheduleDAO {

	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public List<ScheduleDTOImpl> showSchedule() {
		return jdbcTemplate.query("select * from Schedule", new RowMapper<ScheduleDTOImpl>() {
			public ScheduleDTOImpl mapRow(ResultSet rs,int rowNum) throws SQLException{
				ScheduleDTOImpl scheduleDTO = new ScheduleDTOImpl();
				scheduleDTO.setSubject(rs.getString("subject"));
				scheduleDTO.setStartDate(rs.getString("startDate"));
				scheduleDTO.setEndDate(rs.getString("endDate"));
				scheduleDTO.setMemo(rs.getString("memo"));
				return scheduleDTO;
			}
		});
	}
	
	public List<ScheduleDTOImpl> showSchedulePickDate(ScheduleDTOImpl schedule) {
		return jdbcTemplate.query("select * from Schedule where startDate <= ? and endDate>= ?", new RowMapper<ScheduleDTOImpl>() {
			public ScheduleDTOImpl mapRow(ResultSet rs,int rowNum) throws SQLException{
				ScheduleDTOImpl scheduleDTO = new ScheduleDTOImpl();
				scheduleDTO.setSubject(rs.getString("subject"));
				scheduleDTO.setStartDate(rs.getString("startDate"));
				scheduleDTO.setEndDate(rs.getString("endDate"));
				scheduleDTO.setMemo(rs.getString("memo"));
				return scheduleDTO;
			}
		},schedule.getStartDate(),schedule.getEndDate());
	}
	
	public void addSchedule(ScheduleDTOImpl schedule) {
		jdbcTemplate.update("insert into Schedule(table_id,subject,startDate,endDate,memo) values (NULL,?,?,?,?)",schedule.getSubject(),
				schedule.getStartDate(),schedule.getEndDate(),schedule.getMemo());
	}
	
	public void updateSchedule() {}
	
	public void deleteSchedule() {}
}
