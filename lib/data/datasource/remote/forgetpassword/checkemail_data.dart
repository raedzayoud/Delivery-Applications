
import 'package:delivery/core/class/crud.dart';
import 'package:delivery/linkapi.dart';

class CheckemailData {
  Crud crud;

  CheckemailData(this.crud);

  postData(String email) async {
    var response = await crud.postData(AppLinkApi.checkemail, {
      "email": email,
    });

    // Return the data based on whether the response is a success or failure
    return response.fold(
      (left) {
        // Handle the error (left side)
        return left; // Return null or some error object if you need to handle it differently
      },
      (right) {
        // Handle the success (right side)
        return right; // Return the successful response
      },
    );
  }
}
