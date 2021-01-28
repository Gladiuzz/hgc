import 'package:fluttertoast/fluttertoast.dart';
import 'package:hgc/cubit/match_cubit.dart';
import 'package:hgc/cubit/pair_cubit.dart';
import 'package:hgc/model/Pair.dart';
import 'package:hgc/service/MatchAPI.dart';
import 'package:hgc/ui/pages/Inbox/PairSummary.dart';
import 'package:hgc/ui/pages/match_scoring/MatchScore.dart';
import 'package:indonesia/indonesia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hgc/service/InboxAPI.dart';
import 'package:hgc/ui/pages/Inbox/invoice.dart';
import 'package:hgc/model/Inbox.dart';
import 'package:hgc/ui/pages/match_scoring/MatchSummary.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Inbox extends StatefulWidget {
  Inbox({Key key}) : super(key: key);

  @override
  _InboxState createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  DateFormat dateFormat;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xffffffff),
            automaticallyImplyLeading: false,
            title: Text(
              'Inbox',
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
            child: FutureBuilder(
              future: InboxAPI().showInbox(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("${snapshot.error}"),
                  );
                } else if (snapshot.hasData) {
                  List<Inboxs> inbox = snapshot.data;
                  return _buildListView(inbox);
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildListView(List<Inboxs> inbox) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * .80,
      child: ListView.builder(
        itemCount: inbox.length,
        itemBuilder: (context, index) {
          initializeDateFormatting();
          Inboxs inboxs = inbox[index];
          DateTime dateTime = DateTime.parse(inboxs.createdAt);
          return InkWell(
            onTap: () {
              print(inboxs.data.id);
              InboxAPI().getInboxDetail(inboxs.data.id).then((value) {
                print("hah ${value}");
                context.bloc<PairCubit>().getPair(value);
                MatchApi().showMatchDetail(inboxs.data.id).then((value) async {
                  context.bloc<MatchCubit>().getMatch(value);
                });

                print(context.bloc<PairCubit>().pairs.data);
                Future.delayed(const Duration(milliseconds: 2000), () {
                  if (context.bloc<PairCubit>().pairs.data == null &&
                      context.bloc<MatchCubit>().matches == null) {
                    Fluttertoast.showToast(
                        msg: "Match Already Discard",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                        fontSize: 14.0);
                  } else if (context.bloc<PairCubit>().pairs.data == null) {
                    print("pair tidak ada");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MatchSummary(),
                        ));
                  } else {
                    print('match tidak ada');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PairSummary(),
                        ));
                  }
                });
              });
            },
            child: Container(
              width: size.width,
              height: 85.0,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 21),
                    child: SvgPicture.string(
                      '<svg viewBox="21.0 113.4 32.9 32.9" ><path transform="translate(21.0, 113.41)" d="M 32.71080017089844 26.52285766601563 C 32.47817230224609 25.68301391601563 31.9495849609375 25.02078437805176 31.18210411071777 24.60802841186523 C 30.38195419311523 24.17742538452148 29.52829360961914 24.10507202148438 28.71307563781738 24.39799880981445 L 23.19267845153809 26.38343048095703 C 22.53271675109863 26.62083625793457 21.99509620666504 27.04364776611328 21.63106727600098 27.57900810241699 L 17.56777000427246 20.27190208435059 L 28.04306030273438 1.434610962867737 C 28.30207633972168 0.9690922498703003 28.13450813293457 0.3817288279533386 27.66898918151855 0.1229698956012726 C 27.20372200012207 -0.1360423266887665 26.61610984802246 0.03152386844158173 26.35710144042969 0.4970434606075287 L 16.46416091918945 18.2872428894043 L 6.570963382720947 0.4970432221889496 C 6.312202453613281 0.03152427822351456 5.724837779998779 -0.1360425651073456 5.259324550628662 0.1229696646332741 C 4.793806076049805 0.3817310929298401 4.626239776611328 0.9690970778465271 4.885000705718994 1.434610724449158 L 15.36055564880371 20.27190208435059 L 11.29725551605225 27.57900810241699 C 10.93323040008545 27.04364776611328 10.39561462402344 26.62083625793457 9.735642433166504 26.38343048095703 L 4.215247631072998 24.39799880981445 C 3.400023698806763 24.10507202148438 2.546366930007935 24.17767906188965 1.746218800544739 24.60802841186523 C 0.978728711605072 25.02078819274902 0.4501564204692841 25.68301391601563 0.2175220251083374 26.52285766601563 C -0.1738852858543396 27.93800354003906 -0.03822395950555801 29.40440368652344 0.632293164730072 31.0062141418457 C 1.126702189445496 32.18696975708008 2.229072093963623 32.92053985595703 3.509313106536865 32.92053985595703 L 8.763914108276367 32.92053985595703 C 9.745445251464844 32.92053985595703 10.61970901489258 32.45451354980469 11.17893218994141 31.73300170898438 C 11.18546485900879 31.72470855712891 11.19224739074707 31.71642112731934 11.19852828979492 31.70812606811523 C 11.35805416107178 31.49760437011719 11.49095344543457 31.26572418212891 11.59219551086426 31.01751136779785 L 16.46418380737305 22.25653266906738 L 21.33617401123047 31.01751136779785 C 21.43741607666016 31.26546859741211 21.5700626373291 31.49735069274902 21.72984313964844 31.70787811279297 C 21.73637390136719 31.71667289733887 21.74290657043457 31.7249584197998 21.74968719482422 31.73325157165527 C 22.30891609191895 32.45477294921875 23.18317604064941 32.92053985595703 24.16445541381836 32.92053985595703 L 29.41905403137207 32.92053985595703 C 30.69930076599121 32.92053985595703 31.80166816711426 32.18695831298828 32.29582214355469 31.0062141418457 C 32.96659469604492 29.40439605712891 33.10225677490234 27.93800354003906 32.71084976196289 26.52285766601563 Z M 32.71080017089844 26.52285766601563" fill="#2698dd" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                      allowDrawingOutsideViewBox: true,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: size.width * .80,
                          child: Text(
                            '${inboxs.message}',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 14,
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          DateFormat.yMMMEd()
                              .add_jms()
                              .format(dateTime)
                              .toString(),
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 11,
                            color: const Color(0xff858585),
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
