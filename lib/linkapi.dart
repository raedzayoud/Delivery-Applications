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
  static String verifycodesignup =
      "$linkServeurName/delivery/auth/verifycode.php";
  static String resend = "$linkServeurName/delivery/auth/resetverifycode.php";

  //===================================Forgetpassword===================================//

  static String checkemail =
      "$linkServeurName/delivery/forgetpassword/checkemail.php";
  static String resetpassword =
      "$linkServeurName/delivery/forgetpassword/resetpassword.php";
  static String verifycode =
      "$linkServeurName/delivery/forgetpassword/verifycode.php";

  //===================================Home===================================//

  static String homepage = "$linkServeurName/home.php";

//order
  static String pendingorders = "$linkServeurName/delivery/order/pending.php";
  static String ordersdetails =
      "$linkServeurName/delivery/order/orderdetails.php";
  static String ordersarchive = "$linkServeurName/delivery/order/archive.php";
  static String acceptedorders = "$linkServeurName/delivery/order/accepted.php";
  static String approveorder = "$linkServeurName/delivery/order/approve.php";
  static String orderDone = "$linkServeurName/delivery/order/done.php";
  
  //notifications
  static String notifications = "$linkServeurName/notifications.php";
}
