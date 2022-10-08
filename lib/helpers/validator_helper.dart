class ValidatorHelper {
  static String?  notEmpty( String? value, String fieldName ){
    return value == null || value.isEmpty ? "$fieldName cannot be blank" : null;
  }

  static String? doubleGtZero(String? value, String fieldName){
    try {
      return double.parse(value!) == 0 ? "$fieldName have to be greater than 0" : null;
    } catch (e) {
      return  "$fieldName have to be greater than 0";
    }
  }

}