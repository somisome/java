<%@page import="java.io.IOException"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.lang.reflect.Method"%>
<%@page import="java.lang.reflect.Constructor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//사용자 정의 태그 파일(*.tld) 대상 클래스
	//클래스(*.java) => 클래스 로더(로딩) =>인스턴스화(new 활용)
	//클래스 로더(로딩) : 해당 패키지 내 선언된 클래스 존재 여부 검증
	//					해당 클래스 정보(전역변수 정보, 생성자정보, 메서드) 수집 메모리에 저장.
	//					정적인 자원의 메모리 저장
	
	//클래스 로더
	//						ExtClassLoaer		extends		AppClazzloader 		extends	subAppClassLoader extends ServeletContainerClassLoader
	//Standalone			JAVA_HOME/jre/lib/rt.jar		클래스패스(src) 모든			import선언 팩키지 내			서블릿 클래스 대항 실행(해당없음)
	//						JAVA_HOME/jre/ext/*.jar			패키지 내 *.class				특정 class
	//Web App.					동일								동일						 	동일							(web 에서만) 해당(톰캣-서블릿컨테이너)
	Class targetClazz =Class.forName("kr.or.ddit.custom.tag.TargetClazz");
	
	//default 생성자 취득
	Constructor constructor = targetClazz.getConstructor();
	//해당 클래스의 객체화 실행ㅕ
	Object instanceClazz = constructor.newInstance();
	//"kr.or.ddit.custom.tag.TargetClazz"
	//getName() => 패키지.클래스명
	String clazzName = targetClazz.getName().substring(targetClazz.getName().lastIndexOf(".")+1);
	
	String declareStart = "<?xml version=\"1.0\" encoding=\"UTF-8\" ?> \n" +
			            "<taglib xmlns=\"http://java.sun.com/xml/ns/j2ee\" \n" + 
			              "\t\txmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" \n" +
			              "\t\txsi:schemaLocation=\"http://java.sun.com/xml/ns/j2ee \n" +
			              "\t\thttp://java.sun.com/xml/ns/j2ee/web-jsptaglibrary_2_0.xsd\" \n" +
			              "\t\tversion=\"2.0\"> \n" +
			              "\t<tlib-version>1.0</tlib-version>\n" +
			              "\t<short-name>" + clazzName.toLowerCase() + "</short-name>\n" +
			              "\t<uri>http://ddit.com/taglib/" + clazzName + "-taglib</uri>\n";
	
    String declareContent = "";
    String declareEnd="</taglib>";
    //TargetClazz 내 존재하는 모든 메서드 정보 취득
    Method[] methods =  targetClazz.getMethods();
    
	String temp ="";
	// TargetClazz가 부모인 Object 로부터 상속받은 메서드 명 열거.
	String extendsObjectMethods="clone equals finalize getClass hashCode" + 
								"notify notifyAll toString wait"	;
	for(Method method : methods){
		if(!extendsObjectMethods.contains(method.getName())){
// 			public static Integer plus(Integer i, Integer j){
// 				return i+j;
// 			}
			//파라메터
			//params[0] = Integer
			//params[1] = Integer
			Class[] params =  method.getParameterTypes();
			//반환값
			Class returnValue =  method.getReturnType();
			//java.lang.Integer plus(java.lang.Integer, java.lang.Integer)
			String methodSignature = returnValue.getName() + " " + 
										method.getName() + "(";
										
			int paramCnt= 1;
			for(Class param : params){
				//java.lang.Integer plus(java.lang.Integer
				methodSignature += param.getName();
				
				//java.lang.Integer plus(java.lang.Integer,java.lang.Integer
				if(paramCnt++ <params.length){
					methodSignature +=",";
				}
			}
			//java.lang.Integer plus(java.lang.Integer,java.lang.Integer)
			methodSignature +=")";
	//		public static Integer plus(Integer i, Integer j){ return i+j; }
	// =>  <function/> 설정
			declareContent += "\t<function>\n" +
									"\t\t<description>"+method.getName()+"의 활용</description>\n"+
									"\t\t<name>"+method.getName()+"</name>\n"+
									"\t\t<function-class>"+targetClazz.getName()+"</function-class>\n"+
									"\t\t<function-signature>"+methodSignature+"</function-signature>\n"+
									"\t\t<example>\n"+
										"\t\t\t<![CDATA[\n"+
											"\t\t\t\t${"+
												clazzName.toLowerCase()+":"+methodSignature.substring(methodSignature.indexOf(" ")+1)+
											"\t\t\t\t}\n"+
										"\t\t\t]]>\n"+
									"\t\t</example>\n"+
								"\t</function>\n";
		}
	}

	BufferedWriter writer = null;
	try{
		
		writer = new BufferedWriter(new FileWriter(
				new File("D:\\temp\\"+clazzName.toLowerCase()+".tld")
				));
		writer.write(declareStart+declareContent+declareEnd);
	}catch(IOException e1){
		e1.printStackTrace();
	}finally{
		writer.close();
	}
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	사용자 정의 태그의 동적인 작성 처리가 완료되었습니다.
</body>
</html>