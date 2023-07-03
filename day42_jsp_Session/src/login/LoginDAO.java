package login;

public class LoginDAO {
	String[][] arr = {
		{ "test", "admin", "itbank" },
		{ "123", "1", "it" },
		{ "테스트", "관리자", "아이티뱅크" }
	};
	
	public LoginDTO login(String id, String pw) {
		LoginDTO dto = null;
		for(int i = 0; i < 3; i++) {
			if(arr[0][i].equals(id)) {
				if(arr[1][i].equals(pw)) {
					dto = new LoginDTO();
					dto.setUserId(arr[0][i]);
					dto.setUserPw(arr[1][i]);
					dto.setUserName(arr[2][i]);
					break;
				}
			}
		}
		
		return dto;
	}
}
