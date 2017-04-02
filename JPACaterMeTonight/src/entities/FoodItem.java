package entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="menu")
public class FoodItem {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	@Column(name="kitchen_id")
	private int kitchenId;
	
	@Column(name="course_id")
	private int courseId;
	
	private double price;
	
	@Column(name="quantity")
	private int quantityOfFoodItem;
	
	@Column(name="description")
	private String descriptionOfFoodItem;
	
	public int getQuantityOfFoodItem() {
		return quantityOfFoodItem;
	}

	public void setQuantityOfFoodItem(int quantityOfFoodItem) {
		this.quantityOfFoodItem = quantityOfFoodItem;
	}


	public int getId() {
		return id;
	}

	@Override
	public String toString() {
		return "FoodItem [name=" + name + ", kitchenId=" + kitchenId + ", courseId=" + courseId + ", price=" + price
				+ ", quantityOfFoodItem=" + quantityOfFoodItem + ", descriptionOfFoodItem=" + descriptionOfFoodItem
				+ "]";
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getKitchenId() {
		return kitchenId;
	}

	public void setKitchenId(int kitchenId) {
		this.kitchenId = kitchenId;
	}

	public int getCourseId() {
		return courseId;
	}

	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getDescriptionOfFoodItem() {
		return descriptionOfFoodItem;
	}

	public void setDescriptionOfFoodItem(String descriptionOfFoodItem) {
		this.descriptionOfFoodItem = descriptionOfFoodItem;
	}
}
	
	