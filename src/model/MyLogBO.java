package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

public class MyLogBO {
	private Connection connection=null;
	private PreparedStatement preparedStatement=null;
	private ResultSet resultSet=null;
	public boolean addLog(String title,String theme,String log){
		boolean b=true;
		connection=new ConnDB().getConn();
		Calendar cl=Calendar.getInstance();
		cl.setTime(new Date());
		SimpleDateFormat format=new SimpleDateFormat("y/M/d HH:mm:ss");
		String time=format.format(cl.getTime());
		String sql="insert into mylog value('"+title+"','"+theme+"','"+log+"','"+time+"')";
		try {
			preparedStatement=connection.prepareStatement(sql);
			int a=preparedStatement.executeUpdate();
			if(a!=1){
				b=false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return b;
		
	}
	public ArrayList showLog(String category){
		ArrayList al=new ArrayList();
		connection=new ConnDB().getConn();
		String sql="select * from mylog where theme='"+category+"'";
		try {
			preparedStatement=connection.prepareStatement(sql);
			resultSet=preparedStatement.executeQuery();
			while(resultSet.next()){
				MyLog log=new MyLog();
				log.setTitle(resultSet.getString(1));
				log.setTheme(resultSet.getString(2));
				log.setLog(resultSet.getString(3));
				log.setTime(resultSet.getString(4));
				al.add(log);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return al;
		
	}
	public ArrayList get(){
		ArrayList al=new ArrayList();
		connection=new ConnDB().getConn();
		String sql="select count(*) from mylog";
		int totalNum=0;
		try {
			preparedStatement=connection.prepareStatement(sql);
			resultSet=preparedStatement.executeQuery();
			while(resultSet.next()){
				totalNum=resultSet.getInt(1);
			}
			if(totalNum!=0){
				totalNum-=2;
				String sql2="select * from mylog limit "+totalNum+",2";
				preparedStatement=connection.prepareStatement(sql2);
				resultSet=preparedStatement.executeQuery();
				while(resultSet.next()){
					MyLog log=new MyLog();
					log.setTitle(resultSet.getString(1));
					log.setTheme(resultSet.getString(2));
					log.setLog(resultSet.getString(3));
					log.setTime(resultSet.getString(4));
					al.add(log);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return al;
	}
}
