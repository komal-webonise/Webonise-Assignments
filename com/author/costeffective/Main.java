package com.author.costeffective;

import java.util.*;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

public class Main {
	public static void main(String[] args) {
        
        try
        {
               
                //csv file containing data
                String strFile = "/home/webonise/workspace/ProgrammingLanguageAssignment/src/com/author/costeffective/sample_data.csv";
               
                //create BufferedReader to read csv file
                BufferedReader br = new BufferedReader( new FileReader(strFile));
                String strLine = "";
                StringTokenizer st = null;
                StringTokenizer st1 = null;
                
                List<Integer> table=new ArrayList<Integer>();
                
                List<Restaurant> restaurant_list=new ArrayList<Restaurant>();
               
               int next=0;
                //read comma separated file line by line
                while( (strLine = br.readLine()) != null)
                {
                	 FoodItem f1=new FoodItem();
                	 Restaurant o1=new Restaurant();
                        //break comma separated line using ","
                        st = new StringTokenizer(strLine, ",");
                        Integer id=Integer.parseInt(st.nextToken());
                        
                        if(table.contains(id)==false)
                        {
                        	table.add(id);
                        	o1.setId(id);
                        	System.out.println(id);
                        
                        
                       float p=Float.parseFloat(st.nextToken());
                       f1.setPrice(p);
                        
                       String s=st.nextToken();
                       f1.setItemLabel(s);
                       System.out.println(p + "   "+s);
                      o1.setFoodItem(f1);
                        }
                       //System.out.println("Printing food item"+f1.getItemLabel()+"......"+f1.getPrice());
                       restaurant_list.add(o1);
                }
                BufferedReader bufferReaderObj=new BufferedReader(new InputStreamReader( System.in));
                System.out.print("Enter the input");
                String input=bufferReaderObj.readLine();
                st1 =new StringTokenizer(input," ");
                List<String> input_item_list=new ArrayList<String>();
                while(st1.hasMoreTokens()==true)
                {
                	input_item_list.add(st1.nextToken());
                	
                }
                
                Iterator<Restaurant> restaurant_list_itr=restaurant_list.iterator(); 
                int final_sum=9999;
                int display_id=0;
                List<FoodItem> fi;
                while(restaurant_list_itr.hasNext())
                {
                	
                	Restaurant o = restaurant_list_itr.next();

                	
                	int tmp_sum=0;
                	Iterator<String> input_list_itr=input_item_list.iterator(); 
                	while(input_list_itr.hasNext())
                	{
                		String i=(String)input_list_itr.next();
                		System.out.println(i);
                		System.out.println("......");
                		fi=o.getFoodItem();
                		Iterator<FoodItem> food_item_list_itr=fi.iterator();
                		int size=0;
                		while (food_item_list_itr.hasNext()) {
                			size++;
                			FoodItem f;
							f = (FoodItem) food_item_list_itr.next();
							System.out.println(f.getItemLabel());
							/*if(i.equals(f.getItemLabel()))
							{
								System.out.println(f.getPrice());
								tmp_sum+=f.getPrice();
								break;
							}*/
							
						}
                		System.out.println("Size is "+size);
                		
                		
                	}
                	if(final_sum>tmp_sum)
                		
            		{
            			final_sum=tmp_sum;
            			display_id=o.getId();
            			
            		}
                }
                
               System.out.print(display_id+"  "+final_sum);
               
        }
        catch(Exception e)
        {
                System.out.println("Exception while reading csv file: " + e);                  
        }
}
}
