import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:userapp/core/shared%20widjets/custom_button.dart';
import 'package:userapp/core/shared%20widjets/custom_textfield.dart';
import 'package:userapp/features/Home/presentation/views/home_bottom.dart';
import '../../../../../core/utils/app_colors.dart';
import 'package:hive_flutter/hive_flutter.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController firstNameController=TextEditingController();
  final TextEditingController EmailController=TextEditingController();
  final TextEditingController phoneNumberController=TextEditingController();

  final ImagePicker picker = ImagePicker();
  XFile? image;
  bool isLoading = false;

  Future<void> pickPhoto(ImageSource imageSource) async {
    image = await picker.pickImage(source: imageSource);
    if (image != null) {
      Navigator.pop(context);
    }
    setState(() {});
  }



  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Fill Your Profile"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (c) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  pickPhoto(ImageSource.gallery);
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.photo_size_select_actual, color: AppColors.black),
                                    Text("Gallery"),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  pickPhoto(ImageSource.camera);
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.camera_alt, color: AppColors.black),
                                    Text("Camera"),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
                child: CircleAvatar(
                  radius: 82,
                  backgroundColor: AppColors.blue,
                  child: CircleAvatar(
                    backgroundColor: AppColors.white,
                    radius: 80,
                    child: image == null
                        ? Icon(Icons.add_a_photo, color: AppColors.blue, size: 30)
                        : ClipRRect(
                      borderRadius: BorderRadius.circular(80),
                      child: Image.file(File(image!.path), fit: BoxFit.cover, width: 160, height: 160),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CustomTextfield(name: "Full Name", controller: firstNameController,),
                    SizedBox(height: 16),
                    CustomTextfield(name: "Email Address", controller: EmailController),
                    SizedBox(height: 16),
                    CustomTextfield(name: "Phone Number", controller: phoneNumberController),
                    SizedBox(height: 250),
                    CustomButton(
                      text: "Next",
                      onpressend: () async {
          
                        if (image == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
          
                              SnackBar(content: Text("error")));
                        } else {
                          setState(() {
                            isLoading = true;
                          });
          
          
                          await Future.delayed(Duration(seconds: 1));
                          final box= await Hive.openBox("profileBox");
                          box.put("name", firstNameController.text);
                          box.put("email", EmailController.text);
                          box.put("phone", phoneNumberController.text);
                          box.put("photo", image?.path);
          
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (c) {
                                return HomeBottom(
                                  photo: File(image!.path),
                                  name: firstNameController.text,
                                  phone: phoneNumberController.text,
                                  email: EmailController.text,
                                );
                              },
                            ),
                          );
          
                          setState(() {
                            isLoading = false;
                          });
                        }
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
