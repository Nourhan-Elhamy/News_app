import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:userapp/core/shared%20widjets/custom_button.dart';
import 'package:userapp/core/shared%20widjets/custom_textfield.dart';
import 'package:userapp/core/utils/app_colors.dart';
import 'package:hive_flutter/hive_flutter.dart';
class ProfileDetailsScreen extends StatefulWidget {
  const ProfileDetailsScreen({super.key, required this.photo, required this.name, required this.phone, required this.email});
final File photo;
final String name;
final String phone;
final String email;
  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {

   TextEditingController?  nameController;
   TextEditingController?  emailController;
   TextEditingController?  phoneController;


   void initState(){
    super.initState;
    loadDataFromHive();

  }

  Future<void> loadDataFromHive()async{
    final box = await Hive.openBox("profileBox");
    setState(() {
      nameController = TextEditingController(text: box.get("name", defaultValue: widget.name));
      phoneController = TextEditingController(text: box.get("phone",defaultValue:  widget.phone));
      emailController =TextEditingController(text:box.get("email",defaultValue:  widget.email));
    });
  }

  Future<void> saveDataToHive()async{
    final box = await Hive.openBox("profileBox");
    await box.put("name", nameController?.text);
    await box.put("phone", phoneController?.text);
    await box.put("email", emailController?.text);

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Profile updated successfully!')));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              radius: 83,
              backgroundColor: AppColors.blue,
              child: CircleAvatar(
                radius: 80,
                backgroundImage: FileImage(widget.photo),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                
                children: [ 
                  CustomTextfield(name: "Full Name", controller: nameController),
                  SizedBox(height: 16),
                  CustomTextfield(name: "Email Address", controller: emailController),
                  SizedBox(height: 16),
                  CustomTextfield(name: "Phone Number", controller: phoneController),
        
              SizedBox(height: 200),
              CustomButton(
                onpressend: saveDataToHive,
                  text: "save changes")
                ],
        
        
              ),
            )
        
        
          ],
        ),
      ),
    );
  }
}
