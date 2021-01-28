import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hgc/cubit/course_cubit.dart';
import 'package:hgc/cubit/match_cubit.dart';
import 'package:hgc/model/match.dart';
import 'package:hgc/service/MatchAPI.dart';
import 'package:hgc/ui/pages/match_record.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Discard extends StatefulWidget {
  final String title, description, buttonText;
  final Matches match;

  Discard(
      {@required this.title,
      @required this.description,
      @required this.buttonText,
      this.match});
  // CustomDetail({Key key}) : super(key: key);

  @override
  _DiscardState createState() => _DiscardState();
}

class _DiscardState extends State<Discard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      child: Container(
        width: size.width,
        height: 162.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: const Color(0xffffffff),
        ),
        child: Container(
          margin: EdgeInsets.only(top: 25),
          child: Center(
            child: Column(
              children: <Widget>[
                Text(
                  '${widget.title}',
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 20,
                    color: const Color(0xffb90b0c),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  '${widget.description}',
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 16,
                    color: const Color(0xff858585),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MatchRecord(),
                            ));
                      },
                      child: InkWell(
                        onTap: () {
                          if (widget.match == null) {
                            MatchApi().discardMatch(
                                context.bloc<MatchCubit>().matches.id);
                            context.read<CourseCubit>().removeCourse();
                          } else {
                            MatchApi().discardMatch(widget.match.id);
                          }
                          context.read<MatchCubit>().removeMatch();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MatchRecord(),
                              ));
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 20, top: 15),
                          child: Column(
                            children: <Widget>[
                              SvgPicture.string(
                                '<svg viewBox="84.5 509.5 98.0 1.0" ><path transform="translate(84.5, 509.5)" d="M 0 0 L 98 0" fill="none" stroke="#bababa" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                allowDrawingOutsideViewBox: true,
                                fit: BoxFit.fill,
                              ),
                              SizedBox(
                                height: 11.5,
                              ),
                              Text(
                                'Discard',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 18,
                                  color: const Color(0xffb90b0c),
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        padding: EdgeInsets.only(top: 15, right: 20),
                        child: Column(
                          children: <Widget>[
                            SvgPicture.string(
                              '<svg viewBox="84.5 509.5 98.0 1.0" ><path transform="translate(84.5, 509.5)" d="M 0 0 L 98 0" fill="none" stroke="#bababa" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                              allowDrawingOutsideViewBox: true,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(
                              height: 11.5,
                            ),
                            Text(
                              'Cancel',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 18,
                                color: const Color(0xff858585),
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Consts {
  Consts._();
  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}
