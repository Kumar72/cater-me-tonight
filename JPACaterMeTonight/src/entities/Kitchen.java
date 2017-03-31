package entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="kitchen")
public class Kitchen {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	@Column(name="description")
	private String descriptionOfKitchen;

	public int getId() {
		return id;
	}

	@Override
	public String toString() {
		return "Kitchen [name=" + name + ", descriptionOfKitchen=" + descriptionOfKitchen + "]";
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescriptionOfKitchen() {
		return descriptionOfKitchen;
	}

	public void setDescriptionOfKitchen(String descriptionOfKitchen) {
		this.descriptionOfKitchen = descriptionOfKitchen;
	}

}
