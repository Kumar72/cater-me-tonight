package entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="course")
public class Course {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="name")
	private String nameOfCourse;

	public int getId() {
		return id;
	}

	public String getNameOfCourse() {
		return nameOfCourse;
	}

	public void setNameOfCourse(String nameOfCourse) {
		this.nameOfCourse = nameOfCourse;
	}
	@Override
	public String toString() {
		return "Course [nameOfCourse=" + nameOfCourse + "]";
	}
}
