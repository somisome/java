/**
 * 입력값 검증
 * 버전 : 1.0
 * << 개정이력(Modification Information) >>
 * 수정일       수정자          수정내용   
 * =======      =======     ===================== 
 * 2018.02.19.  윤소미       최초작성   
 * Copyright (c) 2018 by DDIT  All right reserved  
 */
 
//"a001".validationID();
String.prototype.validationID = function(){
	//"a001" 전달 == this
	return /^[a-z][0-9]{3}$/.test(this);
};
//"asdfasdf".validationPWD();
String.prototype.validationPWD=function(){
	return /^[0-9a-z]{4,10}$/.test(this);
};
//"정희수".validationNM();
String.prototype.validationNM=function(){
	return /^[가-힣]{2,4}$/.test(this);
};
//"123456-1234567".validationREGNO()
//$('input[name=mem_regno1]').val()+'-'+$('input[name=mem_regno2]').val()
String.prototype.validationREGNO=function(){
	/*
	1 2 3 4 5 6 - 1 2 3 4 5 6     7(매직넘버)
	* * * * * *   * * * * * *  
	2+3+4+5+6+7 + 8+9+2+3+4+5  = 값1
	(11-(값1%11))%10=값2
	if(값2==매직넘버) 유효 else 무효
	*/
	var moto = this.replace('-','');
	var magicNum=this.substr(12,1);
	var checkSum='234567892345';
	var sum=0;
	for(var i =0; i<12; i++){
		sum+= moto.charAt(i)*checkSum.charAt(i);
	}
	var finalVal = (11-(sum%11))%10;
	if(finalVal == parseInt(magicNum)){
		return true;
	}else{
		return false;
	}
};

//"111-111".validationZIPCODE()
String.prototype.validationZIPCODE=function(){
	return /^\d{3}-\d{3}$/.test(this);
};

//"02-111-1111" or "042-1111-1111"
String.prototype.validationHOMETEL=function(){
	return /^0\d{1,2}-\d{3,4}-\d{4}$/.test(this);
};

//"test@naver.com" or "test@yahoo.co.kr"
String.prototype.validationMAIL=function(){
	// \w : [0-9a-z]
	// . : 키보드로 입력가능한 모든 캐릭터셋 중에 한글자(를 의미)
	// \ : 정규식 패턴 의미있느 기호를 일반기호로 제외
	return /^\w+@[a-z]+(\.[a-z]+){1,2}$/.test(this);
};
//"02-111-1111" or "042-1111-1111"
String.prototype.validationCOMTEL=function(){
	return /^0\d{1,2}-\d{3,4}-\d{4}$/.test(this);
};
//   //or 는 | :
// '010'|'011'|'016'|'017'|'018'|'019' + '-1111-1111' or '-111-1111' 
String.prototype.validationHP=function(){
	return /^01(0|1|6|7|8|9)-\d{3,4}-\d{4}$/.test(this);
};

//"P123456789".validationProdId
String.prototype.validationProdId=function(){
	return /^P\d{9}$/.test(this);
};


String.prototype.validationProdBuyer= function(){
	return /^P\d{5}$/.test(this);
};

String.prototype.validationProdLgu= function(){
	return /^P\d{3}$/.test(this);
};

String.prototype.validationTITLE = function(){
	return /^[0-9a-z가-힣]+$/.test(this);
};

String.prototype.validationNICKNAME = function(){
	return /^[가-힣]{1,4}$/.test(this);
};


//String.prototype.validationProdLgu=function(){
//	return /^P\d{3}$/.test(this);
//};


/*
 
 var sum = parseInt(this.substring(0,1))*2+
	parseInt(this.substring(1,2))*3+
	parseInt(this.substring(2,3))*4+
	parseInt(this.substring(3,4))*5+
	parseInt(this.substring(4,5))*6+
	parseInt(this.substring(5,6))*7+
	parseInt(this.substring(7,8))*8+
	parseInt(this.substring(8,9))*9+
	parseInt(this.substring(9,10))*2+
	parseInt(this.substring(10,11))*3+
	parseInt(this.substring(11,12))*4+
	parseInt(this.substring(12,13))*5;
	
	var num = (11-(sum%11))%10;
	
	if(num==parseInt(this.substring(this.length-1,this.length))){
		return true;
	}else{
		return false;
	} 
  
  */


//validationProdId
//validationProdLgu
//validationProdBuyer