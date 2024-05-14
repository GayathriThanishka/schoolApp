import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:schoolapplication/model/Student_List.dart';
import 'package:intl/intl.dart';
import 'package:schoolapplication/routers/page_router.dart';

class StudentRecord extends StatefulWidget {
  const StudentRecord({super.key});

  @override
  State<StudentRecord> createState() => _StudentRecordState();
}

class _StudentRecordState extends State<StudentRecord> {
  final formkey = GlobalKey<FormState>();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController fathernamecontroller = TextEditingController();
  TextEditingController dobcontroller = TextEditingController();
  TextEditingController contactcontroller = TextEditingController();
  //TextEditingController citycontroller = TextEditingController();

  var city = ["Chennai", "Madurai", "Coimbatore", "Trichy"];
  String? selectedCity;
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
      body: Padding(
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
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please Enter FirstName";
                                }
                                return null;
                              },
                              controller: namecontroller,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                contentPadding: EdgeInsets.all(20),
                                isDense: true,
                                label: Text("First Name"),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please Enter LastName";
                                }
                                return null;
                              },
                              controller: fathernamecontroller,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                contentPadding: EdgeInsets.all(20),
                                isDense: true,
                                label: Text("Last Name"),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please Select DOB";
                                }
                                return null;
                              },
                              controller: dobcontroller,
                              onTap: () async {
                                DateTime? pick = await showDatePicker(
                                  context: context,
                                  firstDate: DateTime(1990),
                                  lastDate: DateTime(2100),
                                );

                                if (pick != null) {
                                  setState(() {
                                    dobcontroller.text =
                                        DateFormat.yMd().format(pick);
                                  });
                                }
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                contentPadding: EdgeInsets.all(20),
                                isDense: true,
                                label: Text("Date Of Birth"),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please Enter Contact Number";
                                }
                                return null;
                              },
                              controller: contactcontroller,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                contentPadding: EdgeInsets.all(20),
                                isDense: true,
                                label: Text("Contact Number "),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            DropdownButtonFormField(
                              validator: (value) {
                                if (value == null) {
                                  return "Select the value";
                                }
                                return null;
                              },
                              focusColor: const Color(0XFFCCEDD0),
                              borderRadius: BorderRadius.circular(20),
                              dropdownColor: const Color(0XFFCCEDD0),
                              items: city
                                  .map((item) => DropdownMenuItem(
                                        value: item,
                                        child: Text(item),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                selectedCity = value!;
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
                          final detail = StudentDetail(
                            name: namecontroller.text,
                            fathername: fathernamecontroller.text,
                            dob: dobcontroller.text,
                            contact: contactcontroller.text,
                            city: selectedCity!,
                          );
                          studentDetailsList.add(detail);
                          goRouter.push("/viewrecord");
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
    );
  }
}
