import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:schoolapplication/providers/add_student_record_provider.dart';

class StudentRecordDetail extends StatefulWidget {
  const StudentRecordDetail({super.key});

  @override
  State<StudentRecordDetail> createState() => _StudentRecordDetailState();
}

class _StudentRecordDetailState extends State<StudentRecordDetail> {
  @override
  Widget build(BuildContext context) {
    final snap = context.watch<StudentProvider>();

    print(snap.studentDetailsList);
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
      body: ListView.builder(
        itemCount: snap.studentDetailsList.length,
        itemBuilder: (context, index) {
          print(snap.studentDetailsList[0]);
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
                                "Name:${snap.studentDetailsList[index].name}",
                                style:
                                    const TextStyle(color: Color(0XFF022D60)),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                snap.studentDetailsList[index].fathername,
                                style:
                                    const TextStyle(color: Color(0XFF022D60)),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "DOB:${snap.studentDetailsList[index].dob}",
                            style: const TextStyle(color: Color(0XFF022D60)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Phn no:${snap.studentDetailsList[index].contact}",
                            style: const TextStyle(color: Color(0XFF022D60)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "City:${snap.studentDetailsList[index].city}",
                            style: const TextStyle(color: Color(0XFF022D60)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () =>
                                      snap.studentRecordRemoveEvent(
                                          detail:
                                              snap.studentDetailsList[index]),
                                  icon:
                                      const Icon(Icons.delete_outline_outlined))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: -5,
                  right: -8,
                  child: CircleAvatar(
                    backgroundImage: snap.image == null
                        ? const AssetImage('assets/default_avatar.png')
                        : FileImage(snap.image!) as ImageProvider,
                    radius: 40,
                    backgroundColor: Colors.grey,
                    child: snap.image == null
                        ? const Icon(
                            Icons.add_a_photo,
                            size: 50,
                            color: Colors.white,
                          )
                        : null,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
