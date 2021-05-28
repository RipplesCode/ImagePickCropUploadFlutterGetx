import 'dart:io';

import 'package:get/get.dart';


class ImageUploadProvider extends GetConnect {

  //Upload Image
  Future<String> uploadImage(File file) async {
    try
    {
      final form = FormData({
        'file': MultipartFile(file,filename: 'aa.jpg'),

      });


      final response = await post(
          "http://192.168.43.236:81/ToDoApp/public/index.php/api/customerProfileImageUpload",form);
      if (response.status.hasError) {
        return Future.error(response.body);
      } else {
        return  response.body['result'];
      }
    }
    catch(exception)
    {
      return Future.error(exception.toString());
    }





  }
}
