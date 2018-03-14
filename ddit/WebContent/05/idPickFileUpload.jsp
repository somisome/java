<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="kr.or.ddit.vo.IDPictureVO"%>
<%@page import="kr.or.ddit.service.idpic.IIDPicServiceImpl"%>
<%@page import="kr.or.ddit.service.idpic.IIDPicService"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="kr.or.ddit.utils.FileUploadRequestWrapper"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	FileUploadRequestWrapper wrapper = (FileUploadRequestWrapper)request;
	
	IIDPicService service = IIDPicServiceImpl.getInstance();
	IDPictureVO idPictureInfo = service.insertIDPicture(wrapper.getParameter("mem_id") ,wrapper.getFileItem("idPic"));
	
	ObjectMapper mapper = new ObjectMapper();
	String jsonData = mapper.writeValueAsString(idPictureInfo);
	
	out.println(jsonData);
	

%>