package com.author.costeffective;
import java.util.*;

public class Restaurant {
	private int id;
	List<FoodItem> l;
	public Restaurant()
	{
		l=new ArrayList<FoodItem>();
	}
	void setId(int id)
	 {
		 this.id=id;
	 }
	void setFoodItem(FoodItem f)
	{
		l.add(f);
	}
	int getId()
	 {
		 return id;
	 }
	List<FoodItem> getFoodItem()
	{
		return l;
	}
}
