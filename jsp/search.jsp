<%@page import="java.util.ArrayList"%>
<%@page import="main.ListUpDTO"%>
<%@page import="main.ListUpDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    	String word = request.getParameter("word");
    	ListUpDAO dao = new ListUpDAO();
    	ListUpDTO dto = new ListUpDTO();
    	
    	ArrayList<ListUpDTO> list = dao.read(word);
    	System.out.println(list.size());
    %>
