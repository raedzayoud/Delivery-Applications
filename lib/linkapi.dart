class AppLinkApi {
  static String linkServeurName = "http://192.168.72.52/ecommerce";
  //

  // //===================================Image===================================//

  // static String imagesCategories = "$linkServeurName/upload/categories";

  // static String imagesItems = "$linkServeurName/upload/items";
  // //===================================Test===================================//
  // static String test = "$linkServeurName/test.php";
  // //===================================auth===================================//

  //static String signup = "$linkServeurName/auth/signup.php";
  static String login = "$linkServeurName/delivery/auth/login.php";
  static String verifycodesignup = "$linkServeurName/delivery/auth/verifycode.php";
  static String resend = "$linkServeurName/delivery/auth/resetverifycode.php";

  //===================================Forgetpassword===================================//

  static String checkemail = "$linkServeurName/delivery/forgetpassword/checkemail.php";
  static String resetpassword =
      "$linkServeurName/delivery/forgetpassword/resetpassword.php";
  static String verifycode = "$linkServeurName/delivery/forgetpassword/verifycode.php";

  //===================================Home===================================//

  static String homepage = "$linkServeurName/home.php";


}
