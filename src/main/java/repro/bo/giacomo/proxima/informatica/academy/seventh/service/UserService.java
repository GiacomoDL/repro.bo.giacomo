package repro.bo.giacomo.proxima.informatica.academy.seventh.service;

import java.util.ArrayList;

import org.proxima.common.mail.MailUtility;

import proxima.informatica.academy.DatabaseManagerSingleton;
import proxima.informatica.academy.dto.UserDto;

public class UserService {

	private UserService() {
	}

	private static UserService instance;

	public static UserService getInstance() {
		if (instance == null) {
			instance = new UserService();
		}
		return instance;
	}

	public boolean login(String email, String password) {
		boolean response = false;
		UserDto user = DatabaseManagerSingleton.getInstance().getUserByEmailAndPassword(email, password);
		if (user.getId() != null)
			response = true;

		return response;
	}

	public boolean insert(UserDto user) {
		boolean response = false;

		System.out.println(user.toString());
		if (DatabaseManagerSingleton.getInstance().insertUser(user) > 0) {
			try {
				MailUtility.sendSimpleMail("dllgiacomo@gmail.com", "test", "Test invio email");
			} catch (Exception e) {
				e.printStackTrace();
			}
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
