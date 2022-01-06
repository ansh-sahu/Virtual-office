package com.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dto.FetchTodoDto;
import com.utility.DatabaseUtility;

public class FetchTodoService {

	
	private static final String QUERY_FOR_FETCH_TODO_LIST = "select * from todos where username=?";
	private static final String QUERY_FOR_FETCH_TODO = "select * from todos where t_id=?";
	
	
	public static List<FetchTodoDto> getBuyerCart(String email)
			throws Exception, ClassNotFoundException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		FetchTodoDto fetchTodoDto = null;
		List<FetchTodoDto> fetchTodoDtoList = null;
		
		try {
			

			conn = DatabaseUtility.getConnection();
			pstmt = conn.prepareStatement(QUERY_FOR_FETCH_TODO_LIST);

			pstmt.setString(1, email);
			fetchTodoDtoList = new ArrayList<>();
			rs = pstmt.executeQuery();
			while (rs.next()) {
				fetchTodoDto = new FetchTodoDto();
				fetchTodoDto.setId(rs.getInt("t_id"));
				fetchTodoDto.setDescription(rs.getString("description"));
				fetchTodoDto.setIsDone(rs.getString("is_done"));
				fetchTodoDto.setTargetDate(rs.getDate("target_date"));
				fetchTodoDto.setTiltle(rs.getString("title"));

				System.out.println("Todo List");
				fetchTodoDtoList.add(fetchTodoDto);
			}
		} catch (Exception e) {
			throw e;
		} finally {

			DatabaseUtility.close(pstmt, conn);
			DatabaseUtility.close(rs);
		}
		return fetchTodoDtoList;

	}
	
	
	public static FetchTodoDto getTodo(int id)
			throws Exception, ClassNotFoundException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		FetchTodoDto fetchTodoDto = null;
		
		
		try {
			

			conn = DatabaseUtility.getConnection();
			pstmt = conn.prepareStatement(QUERY_FOR_FETCH_TODO);

			pstmt.setInt(1, id);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				fetchTodoDto = new FetchTodoDto();
				fetchTodoDto.setId(rs.getInt("t_id"));
				fetchTodoDto.setDescription(rs.getString("description"));
				fetchTodoDto.setIsDone(rs.getString("is_done"));
				fetchTodoDto.setTargetDate(rs.getDate("target_date"));
				fetchTodoDto.setTiltle(rs.getString("title"));

				System.out.println("Todo List");
				
			}
		} catch (Exception e) {
			throw e;
		} finally {

			DatabaseUtility.close(pstmt, conn);
			DatabaseUtility.close(rs);
		}
		return fetchTodoDto;

	}
}
