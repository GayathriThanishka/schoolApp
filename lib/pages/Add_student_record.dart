import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:intl/intl.dart';
import 'package:schoolapplication/providers/add_student_record_provider.dart';
import 'package:provider/provider.dart';

class StudentRecord extends StatefulWidget {
  const StudentRecord({super.key});

  @override
  State<StudentRecord> createState() => _StudentRecordState();
}

class _StudentRecordState extends State<StudentRecord> {
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Student Details",
          style:
              TextStyle(fontWeight: FontWeight.w500, color: Color(0XFF022D60)),
        ),
        backgroundColor: const Color(0XFF32AF85),
        centerTitle: true,
      ),
      backgroundColor: const Color(0XFFCCEDD0),
      body: Consumer<StudentProvider>(
        builder: (context, snap, child) => Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      fit: BoxFit.cover,
                      height: double.maxFinite,
                      "https://images.pexels.com/photos/5212345/pexels-photo-5212345.jpeg?auto=compress&cs=tinysrgb&w=600",
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Form(
                          key: formkey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "STUDENT DETAILS",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 24),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () => snap.pickImage(),
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundImage: snap.image == null
                                      ? const NetworkImage(
                                          'https://www.bing.com/images/search?view=detailV2&ccid=IG7Ye6Gb&id=1377498CD49FE3504EFF775A94C04A0D5CC3B41F&thid=OIP.IG7Ye6GbGRrDyZwPfYq-oAHaJ4&mediaurl=https%3a%2f%2fwww.kindpng.com%2fpicc%2fm%2f21-214585_person-symbols-transparent-background-person-icon-hd-png.png&exph=1148&expw=860&q=perso+icon+image&simid=608040616765561913&FORM=IRPRST&ck=891B9759A0EE325478AF4F9FC83E03DA&selectedIndex=6&itb=0')
                                      : FileImage(snap.image!) as ImageProvider,
                                ),
                              ),

                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: snap.nameController,
                                validator: (value) => context
                                    .read<StudentProvider>()
                                    .firstNameValidation(value),
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  contentPadding: EdgeInsets.all(20),
                                  isDense: true,
                                  label: Text("First Name"),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                validator: (value) => context
                                    .read<StudentProvider>()
                                    .lastNameValidation(value),
                                controller: snap.fatherNameController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  contentPadding: EdgeInsets.all(20),
                                  isDense: true,
                                  label: Text("Last Name"),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                validator: (value) => context
                                    .read<StudentProvider>()
                                    .dobValidation(value),
                                controller: snap.dobController,
                                onTap: () async {
                                  DateTime? pick = await showDatePicker(
                                    context: context,
                                    firstDate: DateTime(1990),
                                    lastDate: DateTime(2100),
                                  );

                                  if (pick != null) {
                                    setState(() {
                                      snap.dobController.text =
                                          DateFormat.yMd().format(pick);
                                    });
                                  }
                                },
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  contentPadding: EdgeInsets.all(20),
                                  isDense: true,
                                  label: Text("Date Of Birth"),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                validator: (value) => context
                                    .read<StudentProvider>()
                                    .contactValidation(value),
                                controller: snap.contactController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  contentPadding: EdgeInsets.all(20),
                                  isDense: true,
                                  label: Text("Contact Number "),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              DropdownButtonFormField(
                                validator: (value) => context
                                    .read<StudentProvider>()
                                    .cityValidation(value),
                                focusColor: const Color(0XFFCCEDD0),
                                borderRadius: BorderRadius.circular(20),
                                dropdownColor: const Color(0XFFCCEDD0),
                                items: snap.city
                                    .map((item) => DropdownMenuItem(
                                          value: item,
                                          child: Text(item),
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  snap.selectedCity = value!;
                                },
                                icon: const Icon(
                                    Icons.arrow_drop_down_circle_sharp),
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  contentPadding: EdgeInsets.all(20),
                                  isDense: true,
                                  label: Text("Select City"),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),

                              const SizedBox(height: 20),
                              // snap.image == null
                              //   ? const Text('No image selected.')
                              //   : Image.file(
                              //       snap.image!,
                              //       width: 50,
                              //       height: 50,
                              //     ),*/
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            snap.addStudentDetail(formkey: formkey);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(100, 50),
                          backgroundColor: const Color(0XFF69E68A),
                        ),
                        child: const Text(
                          "Submit",
                          style: TextStyle(color: Color(0XFF022D60)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
