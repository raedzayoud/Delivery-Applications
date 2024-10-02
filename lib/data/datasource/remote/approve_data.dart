import 'package:delivery/core/class/crud.dart';
import 'package:delivery/linkapi.dart';

class ApproveData {
  Crud crud;

  ApproveData(this.crud);

  getDataApproved(String ordersid, String usersid, String deliveryid) async {
    var response = await crud.postData(AppLinkApi.approveorder,
        {"ordersid": ordersid, "usersid": usersid, "deliveryid": deliveryid});

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
