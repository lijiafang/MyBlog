package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

public class MessageBO {
	private Connection connection=null;
	private PreparedStatement preparedStatement=null;
	private ResultSet resultSet=null;
	
	public String addMessage(String who,String friendName,String message){
		String m=null;
		connection=new ConnDB().getConn();
		Calendar cl=Calendar.getInstance();
		cl.setTime(new Date());
		SimpleDateFormat format=new SimpleDateFormat("y/M/d HH:mm:ss");
		String time=format.format(cl.getTime());
		//String time="2014/08/29";
		//DateFormat dateFormat=new DateFormat();
		String sql="insert into message value('"+who+"','"+message+"','"+friendName+"','"+time+"')";
		try {
			preparedStatement=connection.prepareStatement(sql);
			int a=preparedStatement.executeUpdate();
			if(a==1){
				m+=time;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return m;
	}
	public void test(){
		
		connection=new ConnDB().getConn();
		Calendar cl=Calendar.getInstance();
		cl.setTime(new Date());
		SimpleDateFormat format=new SimpleDateFormat("y/M/d H:m:s");
		String time=format.format(cl.getTime());
		//String time="2014/08/29";
		//DateFormat dateFormat=new DateFormat();
		String sql="insert into message value('who','你好','我','"+time+"')";
		try {
			preparedStatement=connection.prepareStatement(sql);
			int a=preparedStatement.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public ArrayList showMessage(){
		ArrayList all=new ArrayList();
		connection=new ConnDB().getConn();
		String sql="select * from message";
		try {
			preparedStatement=connection.prepareStatement(sql);
			resultSet=preparedStatement.executeQuery();
			while(resultSet.next()){
				Message message=new Message();
				message.setWho(resultSet.getString(1));
				message.setMessage(resultSet.getString(2));
				message.setFriendName(resultSet.getString(3));
				message.setTime(resultSet.getString(4));
				all.add(message);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return all;
	}
}
