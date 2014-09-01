package model;


import java.io.*;
import java.text.*;
import java.util.*;
public class Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*File file=new File("F:/web_workspace/MyBlog/WebRoot/log/test.txt");
		
		BufferedReader reader=null;
		try{
			reader=new BufferedReader(new FileReader(file));
			String tempString=null;
			int line=1;
			while((tempString=reader.readLine())!=null){
				System.out.println("line"+line+":"+tempString);
				line++;
			}
			reader.close();
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			if(reader!=null){
				try{
					reader.close();
				}catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
			}
		}*/

     	SimpleDateFormat format=new SimpleDateFormat("y/M/d HH:mm:ss");
     	try {
			Date date=format.parse("2014/8/30 10:29:40");
			Calendar cl=Calendar.getInstance();
			cl.setTime(date);
			
			
			System.out.println(cl.get(Calendar.MONTH)+1);
			System.out.println(cl.get(Calendar.DAY_OF_MONTH));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
