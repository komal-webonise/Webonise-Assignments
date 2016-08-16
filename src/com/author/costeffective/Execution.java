package com.author.costeffective;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;

import java.util.Map;
import java.util.StringTokenizer;

public class Execution {
public static void main(String[] args) {
        
        try
        {
               
                
                String strFile = "/home/webonise/Downloads/Programming Assignments/src/com/author/costeffective/sample_data.csv";
               
                
                BufferedReader br = new BufferedReader( new FileReader(strFile));
                String strLine = "";
                StringTokenizer st = null;
                StringTokenizer st1 = null;
                
                
                
                HashMap<Integer,ArrayList<FoodItem>> hm=new HashMap<Integer,ArrayList<FoodItem>>();
              
               
               
                
                while( (strLine = br.readLine()) != null)
                {
                	 FoodItem f1=new FoodItem();
                	 
                        st = new StringTokenizer(strLine, ",");
                        Integer id=Integer.parseInt(st.nextToken());
                        float p=Float.parseFloat(st.nextToken());
                        f1.setPrice(p);
                         
                        
                        ArrayList<String> combo_list=new ArrayList<String>();
                        while(st.hasMoreTokens())
                        {
                        	String i=st.nextToken();
                        	
                        	combo_list.add(i);
                        }
                        
                        f1.setItemLabel(combo_list);
                        ArrayList<FoodItem> l=hm.get(id);
                        if(l==null)
                        {
                        	hm.put(id, l=new ArrayList<FoodItem>());
                        }
                        l.add(f1);
                        
                        
                }
                for(Map.Entry m:hm.entrySet()){  
                	    
                	   
                	   ArrayList<FoodItem> food_list=(ArrayList<FoodItem>)m.getValue();
                	   for(FoodItem obj:food_list) { 
                		   
                		   ArrayList<String> combo= obj.getItemLabel();
                		  
                		 }  
                	   
                	  }  
                System.out.print("Enter your order");
                BufferedReader buf=new BufferedReader(new InputStreamReader(System.in));
                String input=buf.readLine();
                st1 = new StringTokenizer(input, " ");
                ArrayList<String> input_array=new ArrayList<String>();
                while(st1.hasMoreTokens())
                {
                	
                	input_array.add(" "+st1.nextToken());
                }
                
              
                float final_price=9999f;
                int final_id=0,id=0,flag=0;
                for(Map.Entry m:hm.entrySet())
                {
                	ArrayList<FoodItem> menu_list_with_price=(ArrayList<FoodItem>)m.getValue();
                	id=(Integer)m.getKey();
                	
                	
                	ArrayList<ArrayList<String>> listOfMenu = new ArrayList<ArrayList<String>>();
                	ArrayList<Float> price_list=new ArrayList<Float>();
                	ArrayList<Integer> index=new ArrayList<Integer>();
                	
                	for(FoodItem item:menu_list_with_price)
                	{
                		ArrayList<String> menu=item.getItemLabel();
                		ArrayList<String> meal=new ArrayList<String>();
                		meal.addAll(menu);
                		listOfMenu.add(meal);
                		price_list.add(item.getPrice());
                	}
                	int size=listOfMenu.size();
                	
                	for(int i=0;i<size;i++)
                	{
                		
                		index.add(i);
                	}
                	ArrayList<ArrayList<Integer>> combination_generate=generateCombinationOf(index);
                	
                
                    int combination_size=combination_generate.size();
                    
                    
                    
                    for(int k=0;k<combination_size;k++)
                    {
                    	ArrayList<Integer> one_combination=combination_generate.get(k);
                    	ArrayList<ArrayList<String>> mergedMenu = new ArrayList<ArrayList<String>>();
                    	float price=0f;
                    	for(int z:one_combination)
                    	{
                    		mergedMenu.add(listOfMenu.get(z));
                    		price+=price_list.get(z);
                    	}
                    	
                    	
                    	ArrayList<String> a=new ArrayList<String>();
                    	for(ArrayList<String> l: mergedMenu)
                    	{
                    		for(String l1:l)
                    		{
                    			a.add(l1);
                    		}
                    	}
                    	if(a.containsAll(input_array))
                    	{
                    		
                    	 if(final_price>price && price>0)
                    	 {flag=1;
                    		 final_price=price;
                    		final_id=id;
                    	 }
                    	}
                    	
                    }
                }
                if(flag==1)
                {
              System.out.print(final_id+","+final_price);  
                }
                else
                {
                	System.out.println("Nil");
                }
                
        }
        catch(Exception e)
        {
                System.out.println("Exception while reading csv file: " + e);                  
        }
}
static ArrayList<ArrayList<Integer>> generateCombinationOf(ArrayList<Integer> list) {
	ArrayList<ArrayList<Integer>> result = new ArrayList<>();
    for (int i = 0, max = 1 << list.size(); i < max; ++i) {
    	ArrayList<Integer> comb = new ArrayList<>();
        for (int j = 0, k = i; k > 0; ++j, k >>= 1)
            if ((k & 1) == 1)
                comb.add(list.get(j));
        result.add(comb);
    }
    return result;
}


}

