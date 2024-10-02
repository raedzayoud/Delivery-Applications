import 'package:delivery/core/class/crud.dart';
import 'package:delivery/linkapi.dart';

class AcceptedData {
  Crud crud;

  AcceptedData(this.crud);

  getDataAccepted(String deliveryid) async {
    var response = await crud.postData(AppLinkApi.acceptedorders, {
      "deliveryid":deliveryid
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

  
  getDone(String ordersid,String usersid) async {
    var response = await crud.postData(AppLinkApi.orderDone, {
      "ordersid":ordersid,
      "usersid":usersid
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