package com.author.costeffective;

import java.util.ArrayList;

public class FoodItem {
	private ArrayList<String> item_label;
	private float price;
	
 public FoodItem() {
		// TODO Auto-generated constructor stub
	}
void setItemLabel(ArrayList<String> item_label)
 {
	//this.item_label=new ArrayList<String>();
	 this.item_label=item_label;
 }
  void setPrice(float price)
 {
	 this.price=price;
 }
  ArrayList<String> getItemLabel()
 {
	  return item_label;
 }
 float getPrice()
 {
	 return price;
 }
}
