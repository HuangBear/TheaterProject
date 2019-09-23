package com.web.entity;

import java.io.Serializable;
import java.sql.Blob;
//import java.sql.Date;
import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "Movie")
public class MovieBean implements Serializable{

	private static final long serialVersionUID = 8108696626426463640L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "movie_no")
	private Integer no;
	private Boolean available;
	@NotNull
	private String movieName;
	private String directors;
	private String casts;
	@Column(columnDefinition = "VARCHAR(max)")
	private String introduction;
	private String company;
	private String[] trailerLink;
	private Integer duration;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date openingDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endingDate;
	private String languages;
	private String genres;
	private Blob movieImage;
	@Transient
	private String fileName;
	
	@Transient
	private MultipartFile uploadImage;
	private String engMovieName;
	private String rating;
	
	public String getEngMovieName() {
		return engMovieName;
	}

	public void setEngMovieName(String engMovieName) {
		this.engMovieName = engMovieName;
	}

	public String getRating() {
		return rating;
	}

	public void setRating(String rating) {
		this.rating = rating;
	}
	
	public MultipartFile getUploadImage() {
		return uploadImage;
	}
	
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public void setUploadImage(MultipartFile uploadImage) {
		this.uploadImage = uploadImage;
	}
	public MovieBean() {
		super();
	}
	public MovieBean(Integer no) {
		super();
		this.no = no;
	}
	
	@OneToMany(mappedBy = "movie")
	private Set<TimeTableBean> times;// B, O2M

	@OneToMany(mappedBy = "movie")
	private Set<ArticleBean> articles;// B, O2M

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}

	public String getMovieName() {
		return movieName;
	}

	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}

	public String[] getDirectorsAsArray() {
		String[] strings = this.directors.split(",");
		return strings;
	}

	public void setDirectorsAsArray(String[] directors) {
		String director = "";
		director += directors[0];
		for (int i = 1; i < directors.length; i++)
			director += ("," + directors[i]);
		this.directors = director;
	}

	public String[] getCastsAsArray() {
		String[] strings = this.casts.split(",");
		return strings;
	}

	public void setCastsAsArray(String[] casts) {
		String cast = "";
		cast += casts[0];
		for (int i = 1; i < casts.length; i++)
			cast += ("," + casts[i]);
		this.casts = cast;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String[] getTrailerLink() {
		return trailerLink;
	}

	public void setTrailerLink(String[] trailerLink) {
		this.trailerLink = trailerLink;
	}

	public Integer getDuration() {
		return duration;
	}

	public void setDuration(Integer duration) {
		this.duration = duration;
	}

	public Date getOpeningDate() {
		return openingDate;
	}

	public void setOpeningDate(Date openingDate) {
		this.openingDate = openingDate;
	}

	public String[] getLanguagesAsArray() {
		String[] strings = this.languages.split(",");
		return strings;
	}

	public void setLanguagesAsArray(String[] languages) {
		String language = "";
		language += languages[0];
		for (int i = 1; i < languages.length; i++)
			language += ("," + languages[i]);
		this.languages = language;

	}

	public String[] getGenresAsArray() {
		String[] strings = this.genres.split(",");
		return strings;
	}

	public void setGenresAsArray(String[] genres) {
		String genre = "";
		genre += genres[0];
		for (int i = 1; i < genres.length; i++)
			genre += ("," + genres[i]);
		this.genres = genre;
	}

	public Set<TimeTableBean> getTimes() {
		return times;
	}

	public void setTimes(Set<TimeTableBean> times) {
		this.times = times;
	}

	public Set<ArticleBean> getArticles() {
		return articles;
	}

	public void setArticles(Set<ArticleBean> articles) {
		this.articles = articles;
	}

	public Date getEndingDate() {
		return endingDate;
	}

	public void setEndingDate(Date endingDate) {
		this.endingDate = endingDate;
	}

	public Blob getMovieImage() {
		return movieImage;
	}

	public void setMovieImage(Blob movieImage) {
		this.movieImage = movieImage;
	}

	public String getDirectors() {
		return directors;
	}

	public void setDirectors(String directors) {
		this.directors = directors;
	}

	public String getCasts() {
		return casts;
	}

	public void setCasts(String casts) {
		this.casts = casts;
	}

	public String getLanguages() {
		return languages;
	}

	public void setLanguages(String languages) {
		this.languages = languages;
	}

	public String getGenres() {
		return genres;
	}

	public void setGenres(String genres) {
		this.genres = genres;
	}
	public Boolean getAvailable() {
		return available;
	}
	public void setAvailable(Boolean available) {
		this.available = available;
	}
}
