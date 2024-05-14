import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:schoolapplication/model/Student_List.dart';

class StudentRecordDetail extends StatefulWidget {
  const StudentRecordDetail({super.key});

  @override
  State<StudentRecordDetail> createState() => _StudentRecordDetailState();
}

class _StudentRecordDetailState extends State<StudentRecordDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF32AF85),
        title: const Text(
          "View Student Record",
          style:
              TextStyle(fontWeight: FontWeight.w500, color: Color(0XFF022D60)),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0XFFCCEDD0),
      body: Center(
        child: SizedBox(
          height: double.maxFinite,
          width: 600,
          child: ListView.builder(
            itemCount: studentDetailsList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0XFF6DDD89),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Name:${studentDetailsList[index].name}",
                                    style: const TextStyle(
                                        color: Color(0XFF022D60)),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    studentDetailsList[index].fathername,
                                    style: const TextStyle(
                                        color: Color(0XFF022D60)),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "DOB:${studentDetailsList[index].dob}",
                                style:
                                    const TextStyle(color: Color(0XFF022D60)),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Phn no:${studentDetailsList[index].contact}",
                                style:
                                    const TextStyle(color: Color(0XFF022D60)),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "City:${studentDetailsList[index].city}",
                                style:
                                    const TextStyle(color: Color(0XFF022D60)),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          studentDetailsList.remove(
                                              studentDetailsList[index]);
                                        });
                                      },
                                      icon: const Icon(
                                          Icons.delete_outline_outlined))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      top: -5,
                      right: -8,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://images.pexels.com/photos/8923804/pexels-photo-8923804.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                        radius: 40,
                        backgroundColor: Colors.grey,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}