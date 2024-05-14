import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:schoolapplication/pages/Add_student_record.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schoolapplication/routers/page_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final appkey = GlobalKey<FormState>();
  TextEditingController adminIDcontroller = TextEditingController();
  TextEditingController adminpasswordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundColor: Color(0XFF32AF85),
              backgroundImage:
                  AssetImage("assets/Screenshot 2024-05-13 163359.png"),
            ),
            Text("MGT PUBLIC SCHOOL",
                style: GoogleFonts.oswald(
                  fontWeight: FontWeight.w500,
                  color: const Color(0XFF022D60),
                )),
          ],
        ),
        centerTitle: true,
        backgroundColor: const Color(0XFF6DDD89),
      ),
      backgroundColor: const Color(0XFFCCEDD0),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              //
              child: Container(
                color: Colors.black54,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    fit: BoxFit.cover,
                    height: double.maxFinite,
                    "https://images.pexels.com/photos/2982449/pexels-photo-2982449.jpeg?auto=compress&cs=tinysrgb&w=600",
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    key: appkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Admin Login",
                            style: TextStyle(
                              color: Color(0XFF022D60),
                              fontWeight: FontWeight.w500,
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: adminIDcontroller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter AdminID";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            contentPadding: EdgeInsets.all(20),
                            isDense: true,
                            label: Text("Admin ID"),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: adminpasswordcontroller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Password";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            contentPadding: EdgeInsets.all(20),
                            isDense: true,
                            label: Text("Password"),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (appkey.currentState!.validate()) {
                              return goRouter.goNamed('addstudent');
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
