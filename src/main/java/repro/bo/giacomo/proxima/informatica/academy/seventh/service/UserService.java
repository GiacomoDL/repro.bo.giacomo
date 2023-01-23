package repro.bo.giacomo.proxima.informatica.academy.seventh.service;

import java.util.ArrayList;

import org.proxima.common.mail.MailUtility;

import proxima.informatica.academy.DatabaseManagerSingleton;
import proxima.informatica.academy.dto.UserDto;
import repro.bo.giacomo.proxima.informatica.academy.seventh.result.LoginResult;

public class UserService {

	private final int ROLE_NUMBER = 0;
	private UserService() {
	}

	private static UserService instance;

	public static UserService getInstance() {
		if (instance == null) {
			instance = new UserService();
		}
		return instance;
	}

	public LoginResult login(String email, String password) {
		LoginResult result = new LoginResult();
		UserDto user = DatabaseManagerSingleton.getInstance().getUserByEmailAndPassword(email, password);
		if (user.getEmail() == null) {
			result.setLoginResponse(false);
			result.setLoginMessage("Email or Password not found");
		} else if (user.getEnabled() == false) {
			result.setLoginResponse(false);
			result.setLoginMessage("Account not activated");
		} else {
			result.setLoginResponse(true);
			result.setLoginMessage("Welcome");
		}
		return result;
	}

	public LoginResult login(String email) {
		LoginResult result = new LoginResult();
		UserDto user = DatabaseManagerSingleton.getInstance().getUserByEmail(email);
		if (user.getEmail() == null) {
			result.setLoginResponse(false);
			result.setLoginMessage("Email not found");
		} else if (user.getPassword() == null) {
			result.setLoginResponse(false);
			result.setLoginMessage("Password not found");
		} else if (user.getEnabled() == false) {
			result.setLoginResponse(false);
			result.setLoginMessage("Account not activated");
		} else {
			result.setLoginResponse(true);
			result.setLoginMessage("Welcome");
		}
		return result;
	}

	public boolean insert(UserDto user) {
		boolean response = false;

		System.out.println(user.toString());
		if (DatabaseManagerSingleton.getInstance().insertUser(user) > 0) {
			UserDto userForId = DatabaseManagerSingleton.getInstance().getUserByEmail(user.getEmail());
			MailUtility.sendSimpleMail("dllgiacomo@gmail.com", "Create a new password",
					"Click <a href='http://localhost:8080/repro.bo.giacomo/completeRegistration.jsp?id="
							+ userForId.getId() + "'>here</a> to complete your registration");

			response = true;
		}
		return response;
	}

	public UserDto selectById(int id) {
		UserDto userRetrived = new UserDto();
		userRetrived = DatabaseManagerSingleton.getInstance().getUserById(id);

		return userRetrived;
	}

	public ArrayList<UserDto> getAllUsers() {
		ArrayList<UserDto> listUsers = new ArrayList<UserDto>();

		listUsers = DatabaseManagerSingleton.getInstance().selectAllUsers();

		return listUsers;
	}
	
	public ArrayList<UserDto> getAllUsersByRole() {
		ArrayList<UserDto> listUsers = new ArrayList<UserDto>();

		listUsers = DatabaseManagerSingleton.getInstance().getUsersByRole(ROLE_NUMBER);

		return listUsers;
	}

	public boolean updateUser(UserDto user) {
		boolean response = false;

		if (DatabaseManagerSingleton.getInstance().updateUser(user) > 0)
			response = true;

		return response;
	}

	public boolean deleteUser(int id) {
		boolean response = false;

		if (DatabaseManagerSingleton.getInstance().deleteUser(id) > 0)
			response = true;

		return response;
	}

}
