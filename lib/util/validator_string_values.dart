
class Validator{
  bool isPasswordField;
  dynamic value;
  Validator({this.isPasswordField = false, required this.value});
  
  dynamic recogniseType(){
    if (isPasswordField == true) {
      if (value == null || value.trim().isEmpty) {
        return 'This field is required';
      }
      else if (value.trim().length < 8) {
        return 'Password must be at least 8 characters in length';
      }
      return null;
    }
    else {
      if (value != null) {
        if (value.contains('@') && value.endsWith('.com')) {
          return null;
        }
        else {
          return 'Enter a Valid Email Address';
        }
      }
    }
  }

  
  
}