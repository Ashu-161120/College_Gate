import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:college_gate/panel/guest/gpending.dart';
import 'package:college_gate/panel/student/requestpending.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class faculty_appointment extends StatefulWidget {
  String email;

  faculty_appointment({Key? key, required this.email}) : super(key: key);

  @override
  _faculty_appointmentState createState() => _faculty_appointmentState();
}

class _faculty_appointmentState extends State<faculty_appointment> {
  final _formKey = GlobalKey<FormState>();
  var v;

  String? ans;
  String? phone,
      name,
      genrollnment,
      gexitdate,
      gexittime,
      gvehicleno,
      gdescription,
      guestemail,
      gpurpose;
  @override
  void initState() {
    super.initState();
  }

  Widget _buildfacultyemail() {
    return TextFormField(
        decoration: const InputDecoration(
          labelText: "Visiting Faculty's Email ID",
        ),
        readOnly: true,
        initialValue: "${widget.email}",
        validator: (email) {
          if (email == null || email.isEmpty) {
            return "Visiting Faculty's Email ID is required";
          } else {
            genrollnment = email;
            return null;
          }
        });
  }

  Widget _buildName() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Name'),
      //initialValue: _username!,
      validator: (value) {
        // value:
        if (value == null || value.isEmpty) {
          return "Name is required";
        } else {
          name = value;
          return null;
        }
      },
    );
  }

  Widget _buildemail() {
    return TextFormField(
        //initialValue: _phoneno!,
        // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: const InputDecoration(labelText: 'Email ID'),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Your email ID is required";
          } else {
            guestemail = value;
            return null;
          }
        });
  }

  Widget _buildphone() {
    return TextFormField(
        decoration: const InputDecoration(
          labelText: "Phone Number",
        ),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        validator: (value) {
          if (value == null || value.length != 10) {
            return "Valid phone number is required";
          } else {
            phone = value;
            return null;
          }
        });
  }

  Widget _buildVehicle() {
    return TextFormField(
        decoration: const InputDecoration(labelText: 'Vehicle Number'),
        validator: (value) {
          {
            gvehicleno = value;
            return null;
          }
        });
  }

  Widget _buildRelation() {
    return TextFormField(
        decoration: const InputDecoration(labelText: 'Purpose'),
        //initialValue: _roomno!,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Purpose is required";
          } else {
            gpurpose = value;
            return null;
          }
        });
  }

  Widget _buildTime() {
    DateTime times = DateTime.now();
    return Row(
      children: [
        Expanded(
          child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Date',
                // : Colors.white70,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                  borderSide: BorderSide(
                    color: Colors.black12,
                    width: 1,
                  ),
                ),
              ),
              initialValue: DateFormat('dd-MM-yyyy').format(times),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Date is required";
                } else {
                  gexitdate = value;

                  return null;
                }
              }),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Time',
                // : Colors.white70,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                  borderSide: BorderSide(
                    color: Colors.black12,
                    width: 1,
                  ),
                ),
              ),
              initialValue: DateFormat('kk:mm a').format(times),
              // decoration: const InputDecoration(labelText: 'Time'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Time is Required";
                } else {
                  gexittime = value;

                  return null;
                }
              }),
        ),
      ],
    );
  }

  // Widget _buildMessage() {
  //   return TextFormField(
  //       keyboardType: TextInputType.multiline,
  //       maxLines: 2,
  //       maxLength: 100,
  //       decoration: const InputDecoration(labelText: 'Description'),
  //       validator: (value) {
  //         if (value == null || value.isEmpty) {
  //           return "Reason is Required";
  //         } else {
  //           gdescription = value;
  //           return null;
  //         }
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    double widthMobile = MediaQuery.of(context).size.width;
    double heightMobile = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0Xff15609c),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: heightMobile * 0.028,
            ),
            onPressed: () => {Navigator.pop(context)}),
        title: Text(
          "Faculty Appointment Form",
          style: TextStyle(color: Colors.white, fontSize: heightMobile * 0.025),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(heightMobile * 0.025),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildfacultyemail(),
                  SizedBox(height: heightMobile * 0.02),
                  _buildName(),
                  _buildemail(),
                  _buildphone(),
                  _buildRelation(),
                  _buildVehicle(),
                  SizedBox(height: heightMobile * 0.06),

                  // SizedBox(height: heightMobile * 0.015),

                  _buildTime(),
                  //  _buildMessage(),
                  SizedBox(height: heightMobile * 0.06),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(15.0),
                          ),
                          primary: Color(0Xff15609c),
                          padding: EdgeInsets.all(heightMobile * 0.017),
                          // padding: const EdgeInsets.all(10),
                          minimumSize: Size(widthMobile, heightMobile * 0.028)),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: heightMobile * 0.02,
                        ),
                      ),
                      onPressed: () => {
                            if (_formKey.currentState!.validate())
                              {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Processing Data')),
                                ),
                                FirebaseFirestore.instance
                                    .collection('facultyGuest')
                                    .doc(genrollnment)
                                    .collection("guestemail")
                                    .doc(guestemail)
                                    .set({
                                  'guestname': name,
                                  'guestphone': phone,
                                  'guestemail': guestemail,
                                  'vistingfacultyemail': genrollnment,
                                  'guestappointdate': gexitdate,
                                  'guestappointtime': gexittime,
                                  'gentryisapproved': false,
                                  'guestvehicleno': gvehicleno,
                                  'guestpurpose': gpurpose,
                                  'what': "Guest",
                                  'appointisapproved': false,
                                }, SetOptions(merge: true)),

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => grequestpending(
                                            genrollnment!, phone!))),
                                // v = FirebaseFirestore.instance
                                //     .collection("studentUser")
                                //     .where("email", isEqualTo: email)
                                //     .get(),
                                // ans = v["userid"],
                                // print("answerissssssssssssss$ans")
                              }
                            else
                              {print("Not validated")}
                          })
                ],
              ),
            )),
      ),
    );
  }
}