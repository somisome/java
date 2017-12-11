# Variable Basic

>### 주석

1. DOC 주석<br>
/**<br>
*<br>
*/<br>
2. 한줄 주석<br>
//<br>
3. 여러줄 주석<br>
/*<br>
*/<br>


>### 변수
>#### 단 하나의 값을 저장할 수 있는 공간
1. 변수의 선언<br>
[변수타입][변수명]<br>
한 영역에서 같은 변수를 두번 선언 할 수 없음.<br>
ex) int num;
2. 변수의 초기화<br>
값을 넣어주는 것을 변수의 초기화라고 함.<br>
ex) num = 10;
3. 변수의 선언 및 초기화<br>
 변수의 선언과 동시에 값을 넣을 수 있음<br>
ex) int num2 = 100;

>### 명명규칙
>#### 4가지 규칙과 암묵적인 룰 3가지 : 변수명칭, 클래스명칭, 메서드 명칭등을 지을 때 지킬 것!
1. 대소문자가 구분되며 길이의 제한이 없다. (num, num2, nUm은 다른것으로 인식)<br>
ex) int num3 = 0;(o)<br>
    int nUm3 = 10;(o)
2. 예약어(keyword, reserved word)는 사용할 수 없다. <br>
입력시 컬러가 다른(예:자주색)것은 예약어라고 생각하면 됨.<br>
ex) int true = 10;(x) //true는 예약어지만 True는 아님.<br>
    int True = 10;(o)
3. 숫자로 시작해서는 안된다.<br>
ex) int top10 = 100;(o)<br>
    int 10top = 200;(x)
4. 특수문자 '_', '$' 만 사용 가능하다.<br>
ex) int $harp = 100; (o)<br>
    int s#arp = 200;  (x)
		
이하, 필수는 아니지만 자바프로그래머들의 암묵적인 약속들
1. 클래스명의 첫글자는 항상 대문자 이어야 한다. 변수와 메서드의 명은 첫글자가 소문자.
2. 여러단어로 이루어진 경우에는 두번째 이상의 단어의 첫번째 글자는 대문자로 쓴다.<br>
ex) lastIndexOf
3. 상수의 명칭은 대문자로 써야한다. 여러단어로 이루어진 경우에는 단어들을 '_' 언더바로 연결해준다.<br>
ex) int MAX_VALUE = 100;<br>

참고사항: 한글로 쓸 수도 있지만 쓰지않는것이 룰.
		
>### 변수의 타입
>#### 기본형 타입(primitive type)  : 하나의 값을 저장. boolean, char(캐릭터), byte, short, int, long, float, double
>#### 참조형 타입(reference type)  : 주소를 저장한다. 기본형타입 8가지를 제외한 모든타입.

1. 종류<br>
		  - 논리형: true, false 중 하나의 값을 가지며, 조건식과 논리적 계산에 사용된다. ex) boolean 뿐<br>
		  - 문자형: 문자를 저장하는데 사용한다. 단 한문자를 저장한다. (숫자도 하나만. 11안됨. 1됨. 알파벳이라도 하나.) ex) char 뿐<br>
		  - 정수형: 정수값을 저장하는 데 사용한다. ex) byte, short, int, long 네가지인데 int(인트, 인티저 라고 부름) 많이 씀.<br>
		  - 실수형: 실수값을 저장하는 데 사용한다. ex) float, double 두가지 인데 double이 대표적.<br>
		
2. 기본형 변수의 크기(1byte = 8bit)<br>
		  - 1byte: boolean, byte<br>
		  - 2byte: char, short<br>
		  - 4byte: int, float<br>
		  - 8byte: long, double<br>
3. 논리형: boolean(기본값 false)<br>
		  - 논리형에는 'boolean' 한가지 밖에 없다.<br>
		  - boolean형 변수에는 true, false중 하나의 값을 저장한다.<br>
		  - 대답(yes, no), 스위치(ON/OFF)논리 구현에 주로사용된다.<br>
		  - 데이터를 다루는 최소단위가 1byte이므로 1byte를 가지게 된다.	<br>
4. 문자형: char<br>
		  - 문자형에는 'char'한가지 밖에 없다.<br>
		  - java는 Unicode 문자 체계를 가지고 있다. 2byte로
		   '\u0041' 십진수 65, A표현.  는 유니코드라는 것을 알려주는 것.
		  - 문자형은 ''싱글쿼테이션 사이에 써 줘야 된다. <br>
5. 정수형: byte, short, int, long <br>
		  - 기본자료형은 int <br>
		  - 변수에 저장하려는 정수값의 범위에 따라 4가지 정수형중에 하나를 선택하면 된다.<br>
		  - byte, short의 경우 크기가 작아서 잘못된 결과를 얻기가 쉽다.
		    int형을 사용하는 것이 좋다.
		  - JVM의 피연산자 스택이 피연산자를 4byte단위로 저장을 하고
		    4byte보다 작은 자료형의 값을 계산시 4byte로 변형하여 수행되기 때문에 
		    int형을 사용하는 것이 더 좋다.<br>
		  - 오버플로우(overflow):
		    변수자신이 저장할 수 있는 범위를 초과하였을 때, 가장 작은 범위부터 다시 시작하는 현상		
6. 실수형 <br>
		- 실수형에는 float, double 두가지가 있다. <br>
		- 기본형은 double 이다. <br>
		- float : 1+8+23 , 소수점 7자리까지만 표현 <br>
		- double : 1+11+52 <br>
		- 실수형이 사용될 자료형을 선택시 값의 범위뿐 만 아니라 정밀도도 중요한 요소가 된다. <br>
7. String <br>
		 - 문자열을 다루기 위한 클래스<br>
		 - ""=>문자열에 문자가 존재하지 않아도 된다.<br>
		 - 기본값이 null 이다.<br>
8. 형변환(casting) <br>
		 - 변수 또는 리터럴의 타입을 다른 타입으로 변환한다.<br>
ex) byte b3 = 127;<br>
		short s3 = b3; (캐스트연산자 불필요 short s3 = (short)b3; 에서 (short)라는 캐스트연산자가 생략 된 형태)<br>
		byte b4 = (byte)s3; (중괄호 안에 타입이 들어가는 캐스트연산자 필요)<br>
