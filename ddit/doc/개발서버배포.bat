@echo off

:: 변수 설정 시작

set temp_build_dir=c:\tmp2\

:: SVN 에 등록된 프로젝트 이름
set project_name=MyProject

:: SVN 정보 설정
set svn_repository=https://xxx.xxx.xxx.xxx/svn/%project_name%
set svn_user=xxxxx
set svn_passowrd=xxxxxx

:: Maven에서 빌드후 생성해주는 war 파일
set to_gen_war=xxxxxxx.war

:: 빌드후 생성된 war 파일을 복사할 대상 war 파일, 톰캣에서 바라보는 webapps 디렉토리
set target_webapp_dir=C:\webapps\xxxx\

:: 프로젝트의 컨텍스트 패스, / 면 ROOT 라고 적어주면 됨
set target_webapp_war_name=ROOT


:: service 에 등록된 톰캣 서비스이름으로 바꿔주셈~
set tomcat_service_name=tomcat6


:: 변수 설정 끝




:: 배포시작
:: 톰캣 정지
net stop %tomcat_service_name%


:: 기존 배포된 디렉토리 지우기
rd /s /q %target_webapp_dir%%target_webapp_war_name%


::체크아웃 받을 디렉토리가 존재하지 않으면 맨듬
IF NOT EXIST %temp_build_dir% (
	mkdir %temp_build_dir%
)

cd %temp_build_dir%

:: svn 에서 프로젝트를 CHECKOUT 받는다.
svn co %svn_repository% --username %svn_user% --password %svn_passowrd%

cd %project_name%

:: maven 으로 war 파일 생성될때까지 기다림
start /wait cmd /c mvn clean package

cd target

:: war 파일을 개발서버 톰캣 webapps 폴더로 복사
copy %to_gen_war% %target_webapp_dir%%target_webapp_war_name%.war /y

:: 톰캣 시작
net start %tomcat_service_name%