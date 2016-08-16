package com.author.costeffective;

public class FoodItem {
	private String item_label;
	private float price;
	public FoodItem(String item_label,float price)
	{
		this.item_label=item_label;
		this.price=price;
		
	}
 public FoodItem() {
		// TODO Auto-generated constructor stub
	}
void setItemLabel(String item_label)
 {
	 this.item_label=item_label;
 }
  void setPrice(float price)
 {
	 this.price=price;
 }
  String getItemLabel()
 {
	 return item_label;
 }
 float getPrice()
 {
	 return price;
 }
}
