import 'package:flutter/material.dart';
import 'package:incognito__chat/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class BulkMessage extends StatelessWidget {
  TextEditingController phonenocontroller = TextEditingController();
  TextEditingController messagecontroller = TextEditingController();

  Future<void> sendbulkmessage({required String? number}) async {
    if (!await launchUrl(
      // Uri.parse("https://wa.me/$number"),
      Uri.parse("https://wa.me/$number?text=${messagecontroller.text}"),
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch ';
    }
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(15),
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: kprimarycolor.withOpacity(0.8),
                blurRadius: 5,
                spreadRadius: 1,
                offset: const Offset(-5, -5),
              ),
              BoxShadow(
                color: kprimarycolor.withOpacity(0.8),
                blurRadius: 5,
                spreadRadius: 1,
                offset: const Offset(5, 5),
              ),
            ],
            borderRadius: const BorderRadius.all(
              Radius.circular(30.0),
            ),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Chat Without Saving the Number",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: kprimarycolor,
                ),
              ),
              const SizedBox(height: 20),
              Form(
                key: formkey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: phonenocontroller,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.add),
                        hintText: "Enter Numbers",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      maxLines: 8,
                      controller: messagecontroller,
                      cursorColor: Colors.purple[900],
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'message',
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 60,
                indent: 30,
                endIndent: 30,
                color: kprimarycolor,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // ElevatedButton(
                  //   onPressed: () async {
                  // FilePickerResult? result =
                  //     await FilePicker.platform.pickFiles();

                  // if (result != null) {
                  //   final file = result.files.first;
                  //   print(file.name);
                  //   print(file.size);
                  // } else {
                  //   // User canceled the picker
                  // }
                  //   },
                  //   child: const Padding(
                  //     padding: EdgeInsets.all(20),
                  //     child: Text("Pick File"),
                  //   ),
                  // ),
                  ElevatedButton(
                    onPressed: () async {
                      String numbers = phonenocontroller.text;
                      List<String> formattednumber = numbers.split(",");

                      for (var i = 0; i < formattednumber.length; i++) {
                        sendbulkmessage(number: formattednumber[i]);
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(20),
                      child: Text("Start Chat"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
