import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hgc/service/MemberAPI.dart';
import 'package:hgc/ui/pages/Home/home.dart';
import 'package:hgc/ui/widgets/txtformfield.dart';

class ProfileNonMember extends StatefulWidget {
  ProfileNonMember({Key key}) : super(key: key);

  @override
  _ProfileNonMemberState createState() => _ProfileNonMemberState();
}

class _ProfileNonMemberState extends State<ProfileNonMember> {
  TextEditingController _controllernickname = TextEditingController();
  TextEditingController _controllerbirthplace = TextEditingController();
  TextEditingController _controllerhome_address = TextEditingController();
  TextEditingController _controllerdirectorate = TextEditingController();
  TextEditingController _controllerworkspace_location = TextEditingController();
  TextEditingController _controllerwork_position = TextEditingController();
  TextEditingController _controllerorganization = TextEditingController();
  TextEditingController _controllerstart_golfing_date = TextEditingController();
  TextEditingController _controllercloth_size = TextEditingController();
  TextEditingController _controllerglove_size = TextEditingController();
  var name, first_play_date, phone_number, email, company_name, instagram;
  var image;
  String dropdownValueClothes = 'S';
  String dropdownValueGlove = '18';

  @override
  Widget build(BuildContext context) {
    setDate(var dates) {
      setState(() {
        first_play_date = dates;
      });
    }

    Size size = MediaQuery.of(context).size;
    return Container(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xffffffff),
            titleSpacing: 0.0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: const Color(0xffb90b0c)),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text(
              'Become a HGC Member',
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 18,
                color: const Color(0xffb90b0c),
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              width: size.width,
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Nickname',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 15,
                        color: const Color(0xff858585),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    txtFormField(
                      controller: _controllernickname,
                      height: 45.0,
                      keyboard_type: TextInputType.text,
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      'Birthplace',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 15,
                        color: const Color(0xff858585),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    txtFormField(
                      controller: _controllerbirthplace,
                      height: 45.0,
                      keyboard_type: TextInputType.text,
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      'Home Address',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 15,
                        color: const Color(0xff858585),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    txtFormField(
                      controller: _controllerhome_address,
                      height: 87.0,
                      keyboard_type: TextInputType.text,
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      'Directorate',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 15,
                        color: const Color(0xff858585),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    txtFormField(
                      controller: _controllerdirectorate,
                      height: 45.0,
                      keyboard_type: TextInputType.text,
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      'Workplace Location',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 15,
                        color: const Color(0xff858585),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    txtFormField(
                      controller: _controllerworkspace_location,
                      height: 45.0,
                      keyboard_type: TextInputType.text,
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      'Work Position',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 15,
                        color: const Color(0xff858585),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    txtFormField(
                      controller: _controllerwork_position,
                      height: 45.0,
                      keyboard_type: TextInputType.text,
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      'Other Organization/Membership',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 15,
                        color: const Color(0xff858585),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    txtFormField(
                      controller: _controllerorganization,
                      height: 45.0,
                      keyboard_type: TextInputType.text,
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      'Start Playing Golf',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 15,
                        color: const Color(0xff858585),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: size.width * 0.90,
                      height: 45.0,
                      padding: EdgeInsets.only(left: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: const Color(0xffffffff),
                        border: Border.all(
                            width: 1.0, color: const Color(0xffbababa)),
                      ),
                      child: DateTimePicker(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        type: DateTimePickerType.date,
                        dateMask: 'd MMM, yyyy',
                        initialValue: first_play_date.toString(),
                        firstDate: DateTime(1970),
                        lastDate: DateTime(2100),
                        selectableDayPredicate: (date) {
                          // Disable weekend days to select from the calendar

                          return true;
                        },
                        onChanged: (val) {
                          print("haha ${val}");
                          setDate(val);
                        },
                        validator: (val) {
                          print("test ${val}");
                          return null;
                        },
                        onSaved: (val) => print("test ${val}"),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Clothes Size',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 15,
                        color: const Color(0xff858585),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: size.width * 0.90,
                      height: 45.0,
                      padding: EdgeInsets.only(
                          bottom: 5, left: 14, right: 14, top: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: const Color(0xffffffff),
                        border: Border.all(
                            width: 1.0, color: const Color(0xffbababa)),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: dropdownValueClothes,
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.black, fontSize: 15),
                          onChanged: (String newValue) {
                            setState(() {
                              print(newValue);
                              dropdownValueClothes = newValue;
                            });
                          },
                          items: <String>['S', 'M', 'L', 'XL', 'XXL', 'XXXL']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Glove Size',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 15,
                        color: const Color(0xff858585),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: size.width * 0.90,
                      height: 45.0,
                      padding: EdgeInsets.only(
                          bottom: 5, left: 14, right: 14, top: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: const Color(0xffffffff),
                        border: Border.all(
                            width: 1.0, color: const Color(0xffbababa)),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: dropdownValueGlove,
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.black, fontSize: 15),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValueGlove = newValue;
                            });
                          },
                          items: <String>[
                            '18',
                            '19',
                            '20',
                            '21',
                            '22',
                            '23',
                            '24',
                            '25',
                            '26',
                            '27',
                            '28',
                            '29',
                            '30',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        _registerMember();
                      },
                      child: Container(
                        width: size.width,
                        height: 45.0,
                        margin: EdgeInsets.only(bottom: 30.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: const Color(0xffb90b0c),
                          border: Border.all(
                              width: 1.0, color: const Color(0xffbababa)),
                        ),
                        child: Center(
                          child: Text(
                            'BECOME HGC MEMBER',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 16,
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 45,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _registerMember() async {
    var data = {
      'nickname': _controllernickname.text.toString(),
      'birthplace': _controllerbirthplace.text.toString(),
      'home_address': _controllerhome_address.text.toString(),
      'directorate': _controllerdirectorate.text.toString(),
      'workspace_location': _controllerworkspace_location.text.toString(),
      'work_position': _controllerwork_position.text.toString(),
      'organization': _controllerorganization.text.toString(),
      'start_golfing_date': first_play_date,
      'cloth_size': dropdownValueClothes.toString(),
      'glove_size': dropdownValueGlove.toString(),
    };

    print(data);

    MemberApi().becomeMember(data).then((value) {
      print(value);

      Future.delayed(const Duration(milliseconds: 2000), () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ));
        Fluttertoast.showToast(
            msg:
                "Your member request has been sent.\n Please wait for approval",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 14.0);
      });
    });
  }
}
