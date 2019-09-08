//ajaxStudy/WebContent/ajax.js
var ajax = null;  //전역변수

function getAjaxObject() {
	if(window.ActiveXObject) {  //현재 사용하고 있는 브라우저가 익스플로러?
		try {
			return new ActiveXObject("Msxml2.XMLHTTP");
		} catch(e) {
			try {
				return new ActiveXObject("Microsoft.XMLHTTP");
			} catch(e2) {
				return null;
			}
		}
	} else if(window.XMLHttpRequest) {  //그 외 브라우저인 경우. 표준화.
		return new XMLHttpRequest();  //XMLHttpRequest : ajax 기능을 수행하는 객체.
	} else {
		return null;
	}
}

//"hello.jsp", "name=" + document.f.name.value, helloFromServer, "POST"
//url = hello.jsp
//params = name=홍길동
//callback = helloFromServer
//method = POST
//위의 4개의 파라미터 받아 옴.
function sendRequest(url, params, callback, method) {
	ajax = getAjaxObject();
	var httpMethod = method?method:"GET";  //method? -> null이 아니야?
	if(httpMethod != "GET" && httpMethod != "POST") {  //대소문자 구분함. GET | POST
		httpMethod = "GET";
	}
	var httpParams = (params == null || params == '')?null:params;
	var httpUrl = url;
	if(httpMethod == "GET" && httpParams != null) {
		httpUrl = httpUrl + "?" + httpParams;
	}  //파라미터 값 정리.
	ajax.open(httpMethod, httpUrl, true);  //ajax 객체 준비. true : 비동기 방식을 사용하도록 설정.
	ajax.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");  //POST 방식인 경우 body 부분이 필요하므로 header 설정 반드시 필요.
	ajax.onreadystatechange = callback;  //콜백 함수 지정. 내가 호출하면 나를 다시 호출.
	ajax.send((httpMethod == "POST")?httpParams:null);  //서버에 요청 정보 전송.
}