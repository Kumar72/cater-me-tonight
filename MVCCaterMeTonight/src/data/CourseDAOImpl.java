package data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import entities.Course;

@Transactional
@Repository
public class CourseDAOImpl implements CourseDAO{
	
	@PersistenceContext
	private EntityManager em;
	
	public List<Course> getAllTheCourse() {
		List<Course> courses = new ArrayList<>();
		String query = "SELECT c FROM Course c";
		courses = em.createQuery(query, Course.class).getResultList();
		return courses;
	}
}
