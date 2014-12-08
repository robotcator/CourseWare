package cJava;
import java.util.*;
import java.sql.*;

public class SplitPage {
	private ResultSet rs;
	private ResultSetMetaData rsmd;
	// 对象结果集
	private int rowCount;
	private int pageCount;
	private int pageSize;
	
	public SplitPage(){
		this.rs = null;
		this.rsmd = null;
	}
	
	public void initialize(ResultSet rs, int pageSize){
		this.pageSize = pageSize;
		try {
			this.rs = rs;
			this.rsmd = this.rs.getMetaData();
			if(this.rs != null) {
				this.rs.last();
				this.rowCount = this.rs.getRow();
				this.rs.first();
				this.pageCount = (this.rowCount-1)/this.pageSize + 1;
			} else {
				this.rowCount = 0;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public Vector getAllPage(ResultSet rs){
		Vector vData = new Vector();
		try{
			this.rs = rs;
			this.rsmd = this.rs.getMetaData();
			// 学习rsmd
			if(this.rs != null) {
				this.rs.last();
				this.rowCount = this.rs.getRow();
				this.rs.first();
			} else {
				this.rowCount = 0;
			}
			
			for(int i = 0; i < this.rowCount; i ++){
				String[] sData = new String[15];
				for(int j = 0; j < this.rsmd.getColumnCount(); j ++){
					sData[j] = this.rs.getString(j+1);
				}
				if(sData == null){
					break;
				}
				vData.addElement(sData);
				this.rs.next();
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return vData;
	}
	
	
	public Vector getPage(int ipage) {
		Vector vData = new Vector();
		int n = ipage;
		int m = 0;
		m = (n-1)*this.pageSize+1;
		try{
			if(this.rs != null){
				if(n != 1){
					this.rs.absolute(m);
				}
			}
			for(int i = 0; i < this.pageSize; i ++){
				String[] sData = new String[15];
				for(int j = 0; j < this.rsmd.getColumnCount(); j ++){
					sData[j] = this.rs.getString(j+1);
				}
				if(sData == null){
					break;
				}
				vData.addElement(sData);
				this.rs.next();
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return vData;
	}
	
	public int getPageCount(){
		return this.pageCount;
	}
	
	public int getRowCount(){
		return this.rowCount;
	}
	
}
