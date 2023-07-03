'use strict'

function loginCheck() {
	if(login == '') {
		if(confirm('댓글 작성을 위해 로그인합니다')) {
			textarea.blur() // blur, focus를 잃는 상황
			location.href = cpath + '/member/login.jsp'
		}
		else {
			textarea.disabled = 'disabled'
			textarea.placeholder = '로그인 한 사용자만 댓글을 작성할 수 있습니다'
		}
	}
}

function confirmHandler(event) {
	event.preventDefault()				// 이벤트 대상 요소의 기본 동작을 막는다
	let target = event.target			// <a href="...">
	while(target.tagName != 'A') {		//  	<button>수정<button>
		target = target.parentNode		// </a>
	}
	
	const writer = document.querySelector('span.writer').innerText
	const task = target.querySelector('button').innerText
	
	if(login != writer) {				// 일치하지 않으면
		alert('본인의 게시글만 ' + task + '할 수 있습니다')	// 경고를 출력한다
		return							// 이벤트 함수 종료(더 이상 함수를 진행하지 않음)
	}
	
	if(confirm('정말 ' + task + '하시겠습니까 ? ')) { 	// 일치하고 삭제 수락을 하면
		location.href = target.href		// 링크의 주소대로 이동시킨다	
	}
	else {								// 수락하지 않으면
		alert(task + '(을)를 취소합니다 ~ ')  // 삭제 취소 메시지를 출력한다
	}
}