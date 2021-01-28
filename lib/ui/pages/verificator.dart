import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hgc/cubit/member_cubit.dart';
import 'package:hgc/model/member.dart';
import 'package:hgc/service/MemberAPI.dart';
import 'package:hgc/ui/pages/Courses_detail/courseDetail.dart';
import 'package:hgc/ui/pages/match_record.dart';
import 'package:hgc/ui/widgets/txtsearchfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Verificator extends StatefulWidget {
  Verificator({Key key}) : super(key: key);

  @override
  _VerificatorState createState() => _VerificatorState();
}

class _VerificatorState extends State<Verificator> {
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
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
              'Select Verificator',
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 18,
                color: const Color(0xffb90b0c),
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          body: Container(
            margin: EdgeInsets.only(top: 20),
            child: Column(
              children: <Widget>[
                txtsearchfield(
                  height: 37.0,
                  hint: "Select Member/Partner",
                ),
                SizedBox(
                  height: 15.0,
                ),
                FutureBuilder(
                  future: MemberApi().showMember(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("${snapshot.error}"),
                      );
                    } else if (snapshot.hasData) {
                      List<Member> member = snapshot.data;
                      return _buildListView(member);
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildListView(List<Member> member) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      margin: EdgeInsets.only(bottom: 70),
      child: ListView.builder(
        itemCount: member.length,
        itemBuilder: (context, index) {
          Member user = member[index];
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  context.bloc<MemberCubit>().getVerificator(user);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MatchRecord(),
                      ));
                },
                child: Container(
                  width: size.width,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: <Widget>[
                      (user.image != null)
                          ? Container(
                              width: 55.0,
                              height: 55.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(9999.0, 9999.0)),
                                image: DecorationImage(
                                  image: NetworkImage('${user.image}'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : Container(
                              width: 55.0,
                              height: 55.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(9999.0, 9999.0)),
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/default_avatar.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '${user.name}',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 15,
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            '${user.type}',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 12,
                              color: const Color(0xffbababa),
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Divider(),
            ],
          );
        },
      ),
    );
  }
}
