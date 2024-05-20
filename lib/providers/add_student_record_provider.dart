import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:schoolapplication/model/Student_List.dart';
import 'package:schoolapplication/routers/page_router.dart';

class StudentProvider extends ChangeNotifier {
  File? image;
  final picker = ImagePicker();

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
    }
    notifyListeners();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  List<StudentDetail> studentDetailsList = [];

  var city = ["Chennai", "Madurai", "Coimbatore", "Trichy"];
  String? selectedCity;
  String? firstNameValidation(String? value) {
    if (value!.isEmpty) {
      return "Please Enter FirstName";
    }
    return null;
  }

  String? lastNameValidation(String? value) {
    if (value!.isEmpty) {
      return "Please Enter LastName";
    }
    return null;
  }

  String? dobValidation(String? value) {
    if (value!.isEmpty) {
      return "Please Select DOB";
    }
    return null;
  }

  String? contactValidation(String? value) {
    if (value!.isEmpty) {
      return "Please Enter ContactNo";
    }
    return null;
  }

  String? cityValidation(String? value) {
    if (value!.isEmpty) {
      return "Please Select City";
    }
    return null;
  }

  String? imageValidation(String? value) {
    if (value!.isEmpty) {
      return "Please Select Image";
    }
    return null;
  }

// ADD
  void addStudentDetail({required GlobalKey<FormState> formkey}) {
    final detail = StudentDetail(
      name: nameController.text,
      fathername: fatherNameController.text,
      dob: dobController.text,
      contact: contactController.text,
      city: selectedCity!,
      image: imageController.text,
    );
    studentDetailsList.add(detail);
    goRouter.pushNamed("viewrecord");
  }

// Remove
  void studentRecordRemoveEvent({required StudentDetail detail}) {
    studentDetailsList.remove(detail);
  }
}
