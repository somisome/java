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



