package data;

import entities.User;

public interface UserDAO {
	public User showUser(int id);
	public User getUserByUsernameAndPassword(User user);
	public User createNewUser(User user);
	public User updateUserInfo(int id, User user);
	public boolean deleteUser(int id);

}
