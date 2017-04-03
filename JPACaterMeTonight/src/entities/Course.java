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
	//Total Fields:2 

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="name")
	private String course;

//	@OneToMany(mappedBy="course")		//
//	private List<MenuItem> courseMenuItems;
	
	public int getId() {
		return id;
	}

	public String getNameOfCourse() {
		return course;
	}

	public void setNameOfCourse(String nameOfCourse) {
		this.course = nameOfCourse;
	}
	@Override
	public String toString() {
		return "Course [nameOfCourse=" + course + "]";
	}
}
