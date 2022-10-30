import 'package:flutter/material.dart';
import 'package:incognito__chat/constants.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:url_launcher/url_launcher.dart';

class Singlemessage extends StatefulWidget {
  const Singlemessage({
    Key? key,
  }) : super(key: key);

  @override
  State<Singlemessage> createState() => _SinglemessageState();
}

TextEditingController phonecontroller = TextEditingController();

class _SinglemessageState extends State<Singlemessage> {
  @override
  Widget build(BuildContext context) {
    Future<void> singlemessage({required String number}) async {
      if (!await launchUrl(
        Uri.parse("https://wa.me/$number"),
        mode: LaunchMode.externalApplication,
      )) {
        throw 'Could not launch ';
      }
    }

    String finalnumber = '';
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(15),
          height: MediaQuery.of(context).size.height * 0.4,
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
              IntlPhoneField(
                initialCountryCode: 'IN',
                controller: phonecontroller,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                onChanged: (phone) {
                  finalnumber = phone.completeNumber;
                  print(finalnumber);
                },
                onCountryChanged: (country) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.white,
                      content: Text(
                        'Country changed to: ${country.name}',
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              Divider(
                height: 60,
                indent: 30,
                endIndent: 30,
                color: kprimarycolor,
              ),
              ElevatedButton(
                onPressed: () async {
                  singlemessage(number: finalnumber);
                },
                child: const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("Start Chat"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
