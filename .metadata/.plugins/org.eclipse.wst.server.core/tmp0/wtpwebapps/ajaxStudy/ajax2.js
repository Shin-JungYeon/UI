//WebContent/ajax2.js
//ajax.js 를 객체화 시킨 것. 이전에는 ajax이라는 변수 사용하려면 script에 src로 주소 지정 필요.
var ajax = {}  //빈껍데기 객체.
ajax.xhr = {}  //객체. 자바의 패키지 정보와 비슷.
ajax.xhr.Request = function(url, params, callback, method) {  //이 부분이 생성자의 역할을 함. ajax의 xhr이라는 패키지의 Request 라는 클래스라고 이해하면 됨.
	this.url = url;  //멤버 변수. 모든 멤버는 this. 으로 시작.
	this.params = params;
	this.callback = callback;
	this.method = method;
	this.send();  //멤버 메서드
}
ajax.xhr.Request.prototype = {  //ajax.xhr.Request 객체의 멤버 메서드들을 정의. 현재 3개의 멤버 메서드 존재.
		getXmlHttpRequest : function() {  //key(getXmlHttpRequest) : value(function() {})  //ajax 객체를 만들어서 전달해주는 메서드.
			if(window.ActiveXObject) {
				try {
					return new ActiveObject("Msxml2.XMLHTTP");
				} catch(e) {
					try {
						return new ActiveXObject("Microsoft.XMLHTTP");
					} catch(e2) {
						return null;
					}
				} 
			} else if(window.XMLHttpRequest) {
				return new XMLHttpRequest();
			} else {
				return null;
			}
		},  //, 객체와 객체를 구분. 반드시 써줘야 함.
		
		send : function() {  //this.send() 를 할 때 호출 되는 메서드.
			this.req = this.getXmlHttpRequest();  //this.req : ajax 객체를 저장하고 있음. XMLHttpRequest 객체를 저장.  //this : ajax.xhr.Request 객체를 의미.
			var httpMethod = this.method?this.method:"GET";
			if(httpMethod != "GET" && httpMethod != "POST") {
				httpMethod = "GET";
			}
			var httpParams = (this.params == null || this.params == '')?null:this.params;
			var httpUrl = this.url;
			if(httpMethod == 'GET' && httpParams != null) {
				httpUrl = httpUrl + "?" + httpParams;
			}
			this.req.open(httpMethod, httpUrl, true);  //ajax 객체 준비. 준비 완료되면 StateChange = 1
			this.req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			var request = this;  //this : ajax.xhr.Request 객체.
			this.req.onreadystatechange = function() {  //this.req.onreadystatechange : 콜백함수 등록. StateChange = 0일 때는 호출되지 않음.
				request.onStateChange.call(request);  //내 안에 있는 함수 강제로 호출. this.onState- 로는 사용 불가.
			}
			this.req.send(httpMethod=="POST"?httpParams:null);  //send 되면 StateChange = 2, ...
		},
		
		onStateChange : function() {  //콜백함수.
			this.callback(this.req);  //내 안에 있는 ajax 객체 전달. 콜백 함수의 매개변수 형태로 전달. 객체 자체를 전달 해줌.
		}
}