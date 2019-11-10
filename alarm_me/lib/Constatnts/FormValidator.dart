class FormValidator {

  static String validateUserName(String value){
    if(value.length==0){
      return "Username cannot be null";
    }
    else if (value.length<6){
      return "Username must have atleast 5 characters";
    }
    return null;
  }


  static String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  static String validatePassword(String value){
    String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Password be complex';
    else
      return null;
  }

  static String passwordEqualCheck(String pass, String conPass){
    if(pass!=conPass){
      return "Password mismatch";
    }
    return null;
  }
}