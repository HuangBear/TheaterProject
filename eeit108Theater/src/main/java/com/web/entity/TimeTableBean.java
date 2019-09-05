package com.web.entity;

import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.NotNull;

@Entity
@Table(
		name = "Time_Table",
		uniqueConstraints = { 
				@UniqueConstraint(columnNames = { "movieName", "startTime" })
				}
		)
public class TimeTableBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "timeTable_no")
	private Integer no;
	private Boolean available;
	@NotNull
	private String movieName;
	@NotNull
	private Date startTime;
	@NotNull
	private Integer duration;
	@NotNull
	private Date endTime;
	
	@NotNull
	@ManyToOne
	@JoinColumn(name = "fk_movie_id")
	private MovieBean movie; //B, M2O
	
	@NotNull
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "fk_timeTable_id", referencedColumnName = "timeTable_no")
	private Set<SeatBean> seats; //U, O2M
	
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public MovieBean getMovie() {
		return movie;
	}
	public void setMovie(MovieBean movie) {
		this.movie = movie;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public Set<SeatBean> getSeats() {
		return seats;
	}
	public void setSeats(Set<SeatBean> seats) {
		this.seats = seats;
	}
	public Boolean getAvailable() {
		return available;
	}
	public void setAvailable(Boolean available) {
		this.available = available;
	}
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public Integer getDuration() {
		return duration;
	}
	public void setDuration(Integer duration) {
		this.duration = duration;
	}
}
