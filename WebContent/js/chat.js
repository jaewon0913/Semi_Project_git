
var textarea = document.getElementById("messageWindow");
var webSocket = new WebSocket('ws://localhost:8787/Semi_Project_final/broadcasting');
var inputMessage = document.getElementById('inputMessage');
webSocket.onerror = function(event) {
	onError(event)
};
webSocket.onopen = function(event) {
	onOpen(event)
};
webSocket.onmessage = function(event) {
	onMessage(event)
};

function closechat(){
	$("#chatbox").css("display", "none");
}

function onMessage(event) {
	var message = event.data.split("|");
	var sender = message[0];
	var content = message[1];
	if(content == ""){
	//메시지가 비어 있으면 보내지 않는다.
	} else {
		if(sender == "admin"){
			if(content.match("/")){
				if(content.match("/" + $("#chat_id").val())){
					var temp = content.replace("/" + $("#chat_id").val(), "(메시지) : ").split(": ");
					if(temp[1].trim == ""){
					} else {
						textarea.value += "관리자" + content.replace("/" + $("#chat_id").val(), "(메시지) : ") + "\n";
					}
				} else {
				}
			}
		} else {
			if(content.match("/")){
				if(content.match("/" + $("#chat_id").val())) {
					var temp = content.replace("/" + $("#chat_id").val(), "(메시지) : ").split(": ");
					if(temp[1].trim == ""){
					} else {
						textarea.value += sender + content.replace("/" + $("#chat_id").val(), "(메시지) : ") + "\n";
					}
				} else {
				}
			} 
		}
	}
}


function onOpen(event) {
	textarea.value += "각 번호를 입력하시면 설명이 나오게 되며, 일반 상담은 그냥 메시지를 입력하시면 됩니다.\n"
					+ "1. 공지사항\n"
					+ "2. 홈페이지 이용 방법\n"
					+ "3. 기타 등등...\n"
					+ "상담은 로그인이 필요한 기능입니다.\n"
					+ "상담 시간 : 12:00 ~ 18:00\n";
}
function onError(event) {
    alert(event.data);
}

function enterkey() {
	if (window.event.keyCode == 13) {
		send();
	}
}

function send() {
    if (inputMessage.value == "") {
    } else {
    		textarea.value += "나 : " + inputMessage.value + "\n";
    }
    if($("#chat_id").val()=="admin"){
    	 	webSocket.send($("#chat_id").val() + "|" +inputMessage.value);
    } else {
    		if(inputMessage.value == "1"){
    			textarea.value += "공지사항 이용 방법은 홈페이지 우측 게시판 -> 공지사항 게시판을 확인해주세요\n";
    		} else if(inputMessage.value == "2"){
    			textarea.value += "홈페이지 이용 방법\n"
    							+ "travel spot : 여행지, 축제 정보\n"
    							+ "Accommodation : 숙박시설\n"
    							+ "Reviews : 후기게시판\n"
    							+ "Board : 공지사항, 자유게시판\n";
    		} else if(inputMessage.value == "3") {
    			textarea.value += "기타 등등\n";
    		} else {
    			webSocket.send($("#chat_id").val() + "|" + "/admin " + inputMessage.value);
    		}
    }
    inputMessage.value = "";
}

window.setInterval(function() {
	var elem = document.getElementById('messageWindow');
	elem.scrollTop = elem.scrollHeight;
}, 0);