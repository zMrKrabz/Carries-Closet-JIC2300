// Maybe some good old fashioned OOP will save us here
// Instantiate object with static field that can be referenced across the app
// Just set the field once we get a value once the user logs in

class AppUser {

  static late bool isAdmin;

  AppUser() {
    isAdmin = false;
  }

  void setAdminStatus(bool adminStatus) {
    isAdmin = adminStatus;
  }
}