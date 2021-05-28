import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_image_pick_crop_upload/app/modules/home/controllers/home_controller.dart';
import 'package:image_picker/image_picker.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(
                () => controller.compressImagePath.value == ''
                    ? Text(
                        'Select image from camera/galley',
                        style: TextStyle(fontSize: 20),
                      )
                    : Image.file(
                        File(controller.compressImagePath.value),
                  width: double.infinity,
                  height: 300,
                      ),
              ),

              SizedBox(
                height: 10,
              ),
              Obx(() => Text(
                    controller.compressImageSize.value == ''
                        ? ''
                        : controller.compressImageSize.value,
                    style: TextStyle(fontSize: 20),
                  )),

              //Crop

              RaisedButton(
                onPressed: () {
                  controller.getImage(ImageSource.camera);
                },
                child: Text("Camera"),
              ),
              RaisedButton(
                onPressed: () {
                  controller.getImage(ImageSource.gallery);
                },
                child: Text("Gallery"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
