import 'package:adobe_xd/pinned.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hgc/cubit/user_cubit.dart';
import 'package:hgc/service/UserAPI.dart';
import 'package:hgc/ui/pages/Home/Profile/EditPassword.dart';
import 'package:hgc/ui/pages/Home/Profile/EditProfile.dart';
import 'package:hgc/ui/pages/Home/Profile/PrivacyPolicy.dart';
import 'package:hgc/ui/pages/Home/Profile/ProfileNonMember.dart';
import 'package:hgc/ui/pages/Home/Profile/QrCode.dart';
import 'package:hgc/ui/pages/sign_in.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UserApi().showUser().then((value) {
      print(value);
      context.bloc<UserCubit>().getUser(value);
    });
  }

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
              'Profile',
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
              margin: EdgeInsets.only(top: 30.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        width: 98.0,
                        height: 98.0,
                        margin: EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.elliptical(9999.0, 9999.0)),
                          image: context.bloc<UserCubit>().user.image != null
                              ? DecorationImage(
                                  image: NetworkImage(
                                      '${context.bloc<UserCubit>().user.image}'),
                                  fit: BoxFit.cover,
                                )
                              : DecorationImage(
                                  image: AssetImage(
                                      'assets/images/default_avatar.jpg'),
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 26.0,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '${context.bloc<UserCubit>().user.name}',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 20,
                                color: const Color(0xff000000),
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 3.0,
                            ),
                            Text(
                              '${context.bloc<UserCubit>().user.type}',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 13,
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
                  SizedBox(
                    height: 25.0,
                  ),
                  Container(
                    width: 414.0,
                    height: 352.0,
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 25.8),
                      child: Column(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditProfile(),
                                  ));
                            },
                            child: Row(
                              children: <Widget>[
                                SvgPicture.string(
                                  '<svg viewBox="20.0 265.8 27.6 24.5" ><path transform="translate(20.0, 265.75)" d="M 19.28204154968262 3.987017631530762 L 23.6020622253418 8.307050704956055 C 23.78405952453613 8.489048004150391 23.78405952453613 8.785990715026855 23.6020622253418 8.967986106872559 L 13.14205837249756 19.42802238464355 L 8.697514533996582 19.92133140563965 C 8.103631973266602 19.98838233947754 7.600746154785156 19.48549461364746 7.667797565460205 18.89161109924316 L 8.161103248596191 14.44705295562744 L 18.62110900878906 3.987017631530762 C 18.80310440063477 3.805020332336426 19.10004425048828 3.805020332336426 19.28204154968262 3.987017631530762 Z M 27.04083633422852 2.890246152877808 L 24.7036190032959 0.5530216693878174 C 23.97563362121582 -0.1749662309885025 22.79265594482422 -0.1749662309885025 22.05988311767578 0.5530216693878174 L 20.36444091796875 2.248467445373535 C 20.18244552612305 2.430464267730713 20.18244552612305 2.727406740188599 20.36444091796875 2.909403562545776 L 24.68446159362793 7.22943639755249 C 24.86645889282227 7.411433696746826 25.16339683532715 7.411433696746826 25.34539604187012 7.22943639755249 L 27.04083633422852 5.53399133682251 C 27.76882171630859 4.80121374130249 27.76882171630859 3.618233442306519 27.04083633422852 2.890245676040649 Z M 18.3912181854248 16.5831241607666 L 18.3912181854248 21.45872497558594 L 3.065203189849854 21.45872497558594 L 3.065203189849854 6.132666110992432 L 14.07119750976563 6.132666110992432 C 14.22445774078369 6.132666110992432 14.36813831329346 6.070404052734375 14.47829437255859 5.96503734588623 L 16.39404678344727 4.049279689788818 C 16.75803756713867 3.685285329818726 16.49941444396973 3.067453861236572 15.9869499206543 3.067453861236572 L 2.298902273178101 3.067453861236572 C 1.029716610908508 3.067453861236572 0 4.097174167633057 0 5.366363048553467 L 0 22.22502899169922 C 0 23.49421691894531 1.029716610908508 24.5239372253418 2.298902273178101 24.5239372253418 L 19.15751838684082 24.5239372253418 C 20.42670440673828 24.5239372253418 21.45642280578613 23.49421691894531 21.45642280578613 22.22502899169922 L 21.45642280578613 14.66736507415771 C 21.45642280578613 14.15490055084229 20.83859062194824 13.90106296539307 20.4745979309082 14.26026725769043 L 18.55884552001953 16.176025390625 C 18.4534797668457 16.28618240356445 18.3912181854248 16.42986297607422 18.3912181854248 16.5831241607666 Z" fill="#b90b0c" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                  allowDrawingOutsideViewBox: true,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 28),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        'Edit Profile',
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 14,
                                          color: const Color(0xff252525),
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Divider(
                                        height: 1,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.5,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditPassword(),
                                  ));
                            },
                            child: Row(
                              children: <Widget>[
                                Center(
                                  child: SvgPicture.string(
                                    '<svg viewBox="24.0 334.0 19.2 25.0" ><path transform="translate(17.25, 330.63)" d="M 23.57632255554199 12.02845287322998 L 22.13406753540039 12.02845287322998 L 22.13406753540039 9.222062110900879 C 22.13406753540039 6.055107593536377 19.6101188659668 3.4229896068573 16.44316291809082 3.374914407730103 C 13.23414421081543 3.332848787307739 10.5960168838501 5.946938037872314 10.5960168838501 9.143939971923828 L 10.5960168838501 12.02845287322998 L 9.15376091003418 12.02845287322998 C 7.831692218780518 12.02845287322998 6.75 13.11014461517334 6.75 14.43221282958984 L 6.75 25.97026443481445 C 6.75 27.29233169555664 7.831692218780518 28.3740234375 9.15376091003418 28.3740234375 L 23.57632255554199 28.3740234375 C 24.89839172363281 28.3740234375 25.98008346557617 27.29233169555664 25.98008346557617 25.97026443481445 L 25.98008346557617 14.43221282958984 C 25.98008346557617 13.11014461517334 24.89839172363281 12.02845287322998 23.57632255554199 12.02845287322998 Z M 17.20635795593262 19.52818489074707 L 17.20635795593262 23.66265296936035 C 17.20635795593262 24.11335754394531 16.85781288146973 24.50396919250488 16.40710830688477 24.52800750732422 C 15.92635631561279 24.55204582214355 15.52372646331787 24.16744422912598 15.52372646331787 23.68669128417969 L 15.52372646331787 19.52818489074707 C 14.83264541625977 19.19165992736816 14.37593078613281 18.45851135253906 14.44804382324219 17.62320518493652 C 14.53217506408691 16.69174766540527 15.29536914825439 15.94658088684082 16.22682571411133 15.88047790527344 C 17.35058403015137 15.8023567199707 18.28804969787598 16.69174766540527 18.28804969787598 17.79747772216797 C 18.28804969787598 18.56067276000977 17.84936332702637 19.21569633483887 17.20635795593262 19.52818489074707 Z M 20.45143508911133 12.02845287322998 L 12.27864933013916 12.02845287322998 L 12.27864933013916 9.143939971923828 C 12.27864933013916 8.056238174438477 12.70531749725342 7.034639835357666 13.48052978515625 6.259427547454834 C 14.25574207305908 5.484214782714844 15.27734184265137 5.057547092437744 16.36504173278809 5.057547092437744 C 17.4527416229248 5.057547092437744 18.47434043884277 5.484214782714844 19.24955368041992 6.259427547454834 C 20.02476692199707 7.034639835357666 20.45143508911133 8.056238174438477 20.45143508911133 9.143939971923828 L 20.45143508911133 12.02845287322998 Z" fill="#b90b0c" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                    allowDrawingOutsideViewBox: true,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 28),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Change Password',
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 14,
                                          color: const Color(0xff252525),
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Divider(
                                        height: 1,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.5,
                          ),
                          Builder(
                            builder: (context) {
                              if (context.bloc<UserCubit>().user.type ==
                                  "Guest") {
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ProfileNonMember(),
                                            ));
                                      },
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            child: // Adobe XD layer: 'teamwork' (group)
                                                SizedBox(
                                              width: 27.0,
                                              height: 28.0,
                                              child: Stack(
                                                children: <Widget>[
                                                  Pinned.fromSize(
                                                    bounds: Rect.fromLTWH(
                                                        10.0, 0.0, 7.0, 7.0),
                                                    size: Size(27.1, 28.4),
                                                    pinTop: true,
                                                    fixedWidth: true,
                                                    fixedHeight: true,
                                                    child: Stack(
                                                      children: <Widget>[
                                                        Pinned.fromSize(
                                                          bounds: Rect.fromLTWH(
                                                              0.0,
                                                              0.0,
                                                              7.0,
                                                              7.0),
                                                          size: Size(7.0, 7.0),
                                                          pinLeft: true,
                                                          pinRight: true,
                                                          pinTop: true,
                                                          pinBottom: true,
                                                          child: Stack(
                                                            children: <Widget>[
                                                              Pinned.fromSize(
                                                                bounds: Rect
                                                                    .fromLTWH(
                                                                        0.0,
                                                                        0.0,
                                                                        7.0,
                                                                        7.0),
                                                                size: Size(
                                                                    7.0, 7.0),
                                                                pinLeft: true,
                                                                pinRight: true,
                                                                pinTop: true,
                                                                pinBottom: true,
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.all(Radius.elliptical(
                                                                            9999.0,
                                                                            9999.0)),
                                                                    color: const Color(
                                                                        0xffb90b0c),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Pinned.fromSize(
                                                    bounds: Rect.fromLTWH(
                                                        8.5, 9.8, 10.2, 18.6),
                                                    size: Size(27.1, 28.4),
                                                    pinBottom: true,
                                                    fixedWidth: true,
                                                    fixedHeight: true,
                                                    child: Stack(
                                                      children: <Widget>[
                                                        Pinned.fromSize(
                                                          bounds: Rect.fromLTWH(
                                                              0.0,
                                                              0.0,
                                                              10.2,
                                                              18.6),
                                                          size:
                                                              Size(10.2, 18.6),
                                                          pinLeft: true,
                                                          pinRight: true,
                                                          pinTop: true,
                                                          pinBottom: true,
                                                          child: Stack(
                                                            children: <Widget>[
                                                              Pinned.fromSize(
                                                                bounds: Rect
                                                                    .fromLTWH(
                                                                        0.0,
                                                                        0.0,
                                                                        10.2,
                                                                        18.6),
                                                                size: Size(
                                                                    10.2, 18.6),
                                                                pinLeft: true,
                                                                pinRight: true,
                                                                pinTop: true,
                                                                pinBottom: true,
                                                                child:
                                                                    SvgPicture
                                                                        .string(
                                                                  '<svg viewBox="0.0 0.0 10.2 18.6" ><path transform="translate(-160.0, -160.0)" d="M 170.1617431640625 167.5226287841797 L 169.3923950195313 161.5302429199219 C 169.3059692382813 160.6608276367188 168.5806274414063 160.0049743652344 167.7078552246094 160.0049743652344 L 166.7792053222656 160.0049743652344 C 166.5537719726563 160.0049743652344 166.3385620117188 160.0948028564453 166.1792297363281 160.25244140625 L 165.08447265625 161.3471832275391 L 163.9897155761719 160.25244140625 C 163.8303833007813 160.0948028564453 163.6151733398438 160.0049743652344 163.3897399902344 160.0049743652344 L 162.4627685546875 160.0049743652344 C 161.5883178710938 160.0049743652344 160.8629760742188 160.6608276367188 160.7782287597656 161.5081787109375 L 160.0071411132813 167.5243682861328 C 159.9766845703125 167.7650146484375 160.0512084960938 168.0090637207031 160.2122497558594 168.1903839111328 C 160.3731994628906 168.3733978271484 160.6036682128906 168.4785003662109 160.8477172851563 168.4785003662109 L 161.7628784179688 168.4785003662109 L 162.4712524414063 177.1214447021484 C 162.5560302734375 177.9891052246094 163.2830200195313 178.6466217041016 164.1575012207031 178.6466217041016 L 166.0131530761719 178.6466217041016 C 166.8876342773438 178.6466217041016 167.6129760742188 177.9891052246094 167.7010498046875 177.1061553955078 L 168.4077758789063 168.4784545898438 L 169.3211975097656 168.4784545898438 C 169.5652465820313 168.4784545898438 169.7957458496094 168.3733978271484 169.9567260742188 168.1903839111328 C 170.1194458007813 168.0090637207031 170.1939697265625 167.7650146484375 170.1617431640625 167.5226287841797 Z" fill="#b90b0c" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                                                  allowDrawingOutsideViewBox:
                                                                      true,
                                                                  fit: BoxFit
                                                                      .fill,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Pinned.fromSize(
                                                    bounds: Rect.fromLTWH(
                                                        19.0, 1.0, 6.0, 6.0),
                                                    size: Size(27.1, 28.4),
                                                    pinRight: true,
                                                    pinTop: true,
                                                    fixedWidth: true,
                                                    fixedHeight: true,
                                                    child: Stack(
                                                      children: <Widget>[
                                                        Pinned.fromSize(
                                                          bounds: Rect.fromLTWH(
                                                              0.0,
                                                              0.0,
                                                              6.0,
                                                              6.0),
                                                          size: Size(6.0, 6.0),
                                                          pinLeft: true,
                                                          pinRight: true,
                                                          pinTop: true,
                                                          pinBottom: true,
                                                          child: Stack(
                                                            children: <Widget>[
                                                              Pinned.fromSize(
                                                                bounds: Rect
                                                                    .fromLTWH(
                                                                        0.0,
                                                                        0.0,
                                                                        6.0,
                                                                        6.0),
                                                                size: Size(
                                                                    6.0, 6.0),
                                                                pinLeft: true,
                                                                pinRight: true,
                                                                pinTop: true,
                                                                pinBottom: true,
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.all(Radius.elliptical(
                                                                            9999.0,
                                                                            9999.0)),
                                                                    color: const Color(
                                                                        0xffb90b0c),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Pinned.fromSize(
                                                    bounds: Rect.fromLTWH(
                                                        1.7, 1.3, 6.8, 6.8),
                                                    size: Size(27.1, 28.4),
                                                    pinLeft: true,
                                                    pinTop: true,
                                                    fixedWidth: true,
                                                    fixedHeight: true,
                                                    child: Stack(
                                                      children: <Widget>[
                                                        Pinned.fromSize(
                                                          bounds: Rect.fromLTWH(
                                                              0.0,
                                                              0.0,
                                                              6.8,
                                                              6.8),
                                                          size: Size(6.8, 6.8),
                                                          pinLeft: true,
                                                          pinRight: true,
                                                          pinTop: true,
                                                          pinBottom: true,
                                                          child: Stack(
                                                            children: <Widget>[
                                                              Pinned.fromSize(
                                                                bounds: Rect
                                                                    .fromLTWH(
                                                                        0.0,
                                                                        0.0,
                                                                        6.8,
                                                                        6.8),
                                                                size: Size(
                                                                    6.8, 6.8),
                                                                pinLeft: true,
                                                                pinRight: true,
                                                                pinTop: true,
                                                                pinBottom: true,
                                                                child:
                                                                    SvgPicture
                                                                        .string(
                                                                  '<svg viewBox="0.0 0.0 6.8 6.8" ><path transform="translate(-32.0, -0.01)" d="M 35.38839721679688 0.005000000819563866 C 33.51914978027344 0.005000000819563866 31.99900245666504 1.525140285491943 31.99900245666504 3.394387722015381 C 31.99900245666504 5.263636112213135 33.51914978027344 6.783777236938477 35.38839721679688 6.783777236938477 C 37.25594711303711 6.783777236938477 38.77778244018555 5.263636112213135 38.77778244018555 3.39438796043396 C 38.77778244018555 1.525140762329102 37.25594711303711 0.005000000819563866 35.38839721679688 0.005000000819563866 Z" fill="#b90b0c" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                                                  allowDrawingOutsideViewBox:
                                                                      true,
                                                                  fit: BoxFit
                                                                      .fill,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Pinned.fromSize(
                                                    bounds: Rect.fromLTWH(
                                                        18.9, 9.8, 8.3, 16.9),
                                                    size: Size(27.1, 28.4),
                                                    pinRight: true,
                                                    pinBottom: true,
                                                    fixedWidth: true,
                                                    fixedHeight: true,
                                                    child: Stack(
                                                      children: <Widget>[
                                                        Pinned.fromSize(
                                                          bounds: Rect.fromLTWH(
                                                              0.0,
                                                              0.0,
                                                              8.3,
                                                              16.9),
                                                          size: Size(8.3, 16.9),
                                                          pinLeft: true,
                                                          pinRight: true,
                                                          pinTop: true,
                                                          pinBottom: true,
                                                          child: Stack(
                                                            children: <Widget>[
                                                              Pinned.fromSize(
                                                                bounds: Rect
                                                                    .fromLTWH(
                                                                        0.0,
                                                                        0.0,
                                                                        8.3,
                                                                        16.9),
                                                                size: Size(
                                                                    8.3, 16.9),
                                                                pinLeft: true,
                                                                pinRight: true,
                                                                pinTop: true,
                                                                pinBottom: true,
                                                                child:
                                                                    SvgPicture
                                                                        .string(
                                                                  '<svg viewBox="0.0 0.0 8.3 16.9" ><path transform="translate(-356.06, -160.0)" d="M 364.3144226074219 167.5226898193359 L 363.5450744628906 161.5319366455078 C 363.4586181640625 160.6608581542969 362.7350158691406 160.0049896240234 361.8605346679688 160.0049896240234 L 360.9319152832031 160.0049896240234 C 360.7063903808594 160.0049896240234 360.4911804199219 160.0948028564453 360.3319396972656 160.25244140625 L 359.2371215820313 161.3471984863281 L 358.1423645019531 160.25244140625 C 357.9830932617188 160.0948028564453 357.767822265625 160.0049896240234 357.5441589355469 160.0049896240234 L 356.6154174804688 160.0049896240234 C 356.5103759765625 160.0049896240234 356.4155578613281 160.0422973632813 356.3153991699219 160.0609588623047 C 356.5339965820313 160.4473114013672 356.7052917480469 160.8659057617188 356.7561645507813 161.3353424072266 L 357.5237731933594 167.3074493408203 C 357.61865234375 168.0344696044922 357.3916015625 168.7665710449219 356.9034729003906 169.3173522949219 C 356.673095703125 169.5817413330078 356.378173828125 169.7681579589844 356.06298828125 169.9139251708984 L 356.6255798339844 175.4267272949219 C 356.7120056152344 176.2961120605469 357.4373168945313 176.9519348144531 358.3118286132813 176.9519348144531 L 360.1675415039063 176.9519348144531 C 361.0419616699219 176.9519348144531 361.7673034667969 176.2943725585938 361.8554382324219 175.4114685058594 L 362.5604858398438 168.4785003662109 L 363.473876953125 168.4785003662109 C 363.7178955078125 168.4785003662109 363.9484252929688 168.3733978271484 364.1093139648438 168.1903533935547 C 364.2720642089844 168.0090789794922 364.3466491699219 167.7650146484375 364.3144226074219 167.5226898193359 Z" fill="#b90b0c" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                                                  allowDrawingOutsideViewBox:
                                                                      true,
                                                                  fit: BoxFit
                                                                      .fill,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Pinned.fromSize(
                                                    bounds: Rect.fromLTWH(
                                                        0.0, 9.8, 8.3, 16.9),
                                                    size: Size(27.1, 28.4),
                                                    pinLeft: true,
                                                    pinBottom: true,
                                                    fixedWidth: true,
                                                    fixedHeight: true,
                                                    child: Stack(
                                                      children: <Widget>[
                                                        Pinned.fromSize(
                                                          bounds: Rect.fromLTWH(
                                                              0.0,
                                                              0.0,
                                                              8.3,
                                                              16.9),
                                                          size: Size(8.3, 16.9),
                                                          pinLeft: true,
                                                          pinRight: true,
                                                          pinTop: true,
                                                          pinBottom: true,
                                                          child: Stack(
                                                            children: <Widget>[
                                                              Pinned.fromSize(
                                                                bounds: Rect
                                                                    .fromLTWH(
                                                                        0.0,
                                                                        0.0,
                                                                        8.3,
                                                                        16.9),
                                                                size: Size(
                                                                    8.3, 16.9),
                                                                pinLeft: true,
                                                                pinRight: true,
                                                                pinTop: true,
                                                                pinBottom: true,
                                                                child:
                                                                    SvgPicture
                                                                        .string(
                                                                  '<svg viewBox="0.0 0.0 8.3 16.9" ><path transform="translate(0.0, -160.0)" d="M 7.412047386169434 169.3088684082031 C 6.930752754211426 168.7648773193359 6.70705509185791 168.0344848632813 6.798568725585938 167.3108673095703 L 7.569653987884521 161.2929382324219 C 7.613715648651123 160.8421478271484 7.779794692993164 160.4354705810547 7.991631984710693 160.0592193603516 C 7.896728515625 160.0422821044922 7.806910037994385 160.0049743652344 7.706923961639404 160.0049743652344 L 6.778232097625732 160.0049743652344 C 6.552836418151855 160.0049743652344 6.337611198425293 160.0948028564453 6.178309440612793 160.25244140625 L 5.083537101745605 161.3471832275391 L 3.988765478134155 160.25244140625 C 3.829464197158813 160.0948028564453 3.614237785339355 160.0049743652344 3.390538215637207 160.0049743652344 L 2.461793422698975 160.0049743652344 C 1.58733081817627 160.0049743652344 0.862001895904541 160.6608276367188 0.7772671580314636 161.5081787109375 L 0.006181356031447649 167.5243682861328 C -0.02432313375174999 167.7650146484375 0.05024339631199837 168.0090637207031 0.2112393528223038 168.1903839111328 C 0.3722352683544159 168.3733978271484 0.604408323764801 168.4785003662109 0.8467496037483215 168.4785003662109 L 1.761884331703186 168.4785003662109 L 2.470266580581665 175.4267120361328 C 2.555001020431519 176.2943878173828 3.282024383544922 176.9519195556641 4.156486988067627 176.9519195556641 L 6.01217794418335 176.9519195556641 C 6.886639595031738 176.9519195556641 7.611968994140625 176.2943572998047 7.700092315673828 175.4114379882813 L 8.262730598449707 169.9121704101563 C 7.945875644683838 169.7647552490234 7.649304389953613 169.5766143798828 7.412047386169434 169.3088684082031 Z" fill="#b90b0c" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                                                  allowDrawingOutsideViewBox:
                                                                      true,
                                                                  fit: BoxFit
                                                                      .fill,
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
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 28),
                                            child: Column(
                                              children: <Widget>[
                                                Text(
                                                  'Become a HGC Member',
                                                  style: TextStyle(
                                                    fontFamily: 'Lato',
                                                    fontSize: 14,
                                                    color:
                                                        const Color(0xff252525),
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                                Divider(
                                                  height: 1,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.5,
                                    ),
                                  ],
                                );
                              } else {
                                return Container();
                              }
                            },
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => QrCode(),
                                  ));
                            },
                            child: Row(
                              children: <Widget>[
                                Center(
                                  child: SvgPicture.string(
                                    '<svg viewBox="24.0 412.0 20.1 20.1" ><path transform="translate(21.43, 410.07)" d="M 8.83940315246582 3.181773662567139 L 3.824441909790039 3.181773662567139 L 3.824441909790039 8.196735382080078 L 8.83940315246582 8.196735382080078 L 8.83940315246582 3.181773662567139 Z M 10.09314346313477 1.928033351898193 L 10.09314346313477 9.45047664642334 L 2.570701599121094 9.45047664642334 L 2.570701599121094 1.928033351898193 L 10.09314346313477 1.928033351898193 Z M 5.078182220458984 4.435514450073242 L 7.585663318634033 4.435514450073242 L 7.585663318634033 6.942994594573975 L 5.078182697296143 6.942994594573975 L 5.078182220458984 4.435514450073242 Z M 21.37680816650391 3.181773900985718 L 16.36184692382813 3.181773900985718 L 16.36184692382813 8.196735382080078 L 21.37680816650391 8.196735382080078 L 21.37680816650391 3.181773662567139 Z M 22.63054847717285 1.928033590316772 L 22.63054847717285 9.45047664642334 L 15.10810661315918 9.45047664642334 L 15.10810661315918 1.928033351898193 L 22.63054847717285 1.928033351898193 Z M 17.61558723449707 4.435514450073242 L 20.12306785583496 4.435514450073242 L 20.12306785583496 6.942994594573975 L 17.61558723449707 6.942994594573975 L 17.61558723449707 4.435514450073242 Z M 8.839405059814453 15.71917819976807 L 3.824443578720093 15.71917819976807 L 3.824443578720093 20.73413848876953 L 8.839405059814453 20.73413848876953 L 8.839405059814453 15.71917819976807 Z M 10.0931453704834 14.4654369354248 L 10.0931453704834 21.98787879943848 L 2.570703506469727 21.98787879943848 L 2.570703506469727 14.4654369354248 L 10.0931453704834 14.4654369354248 Z M 5.078184127807617 16.97291946411133 L 7.585665225982666 16.97291946411133 L 7.585665225982666 19.48040008544922 L 5.078184604644775 19.48040008544922 L 5.078184127807617 16.97291946411133 Z M 11.34688568115234 1.928033590316772 L 12.60062599182129 1.928033590316772 L 12.60062599182129 3.181773900985718 L 11.34688568115234 3.181773900985718 L 11.34688568115234 1.928033590316772 Z M 12.60062599182129 3.181773900985718 L 13.85436630249023 3.181773900985718 L 13.85436630249023 4.435514450073242 L 12.60062599182129 4.435514450073242 L 12.60062599182129 3.181773900985718 Z M 11.34688568115234 4.435514450073242 L 12.60062599182129 4.435514450073242 L 12.60062599182129 5.689254283905029 L 11.34688568115234 5.689254283905029 L 11.34688568115234 4.435514450073242 Z M 12.60062599182129 5.689254283905029 L 13.85436630249023 5.689254283905029 L 13.85436630249023 6.942994594573975 L 12.60062599182129 6.942994594573975 L 12.60062599182129 5.689254283905029 Z M 11.34688568115234 6.942994594573975 L 12.60062599182129 6.942994594573975 L 12.60062599182129 8.196735382080078 L 11.34688568115234 8.196735382080078 L 11.34688568115234 6.942994594573975 Z M 12.60062599182129 8.196735382080078 L 13.85436630249023 8.196735382080078 L 13.85436630249023 9.45047664642334 L 12.60062599182129 9.45047664642334 L 12.60062599182129 8.196735382080078 Z M 11.34688568115234 9.45047664642334 L 12.60062599182129 9.45047664642334 L 12.60062599182129 10.70421695709229 L 11.34688568115234 10.70421695709229 L 11.34688568115234 9.45047664642334 Z M 11.34688568115234 11.95795726776123 L 12.60062599182129 11.95795726776123 L 12.60062599182129 13.21169757843018 L 11.34688568115234 13.21169757843018 L 11.34688568115234 11.95795726776123 Z M 12.60062599182129 13.21169757843018 L 13.85436630249023 13.21169757843018 L 13.85436630249023 14.46543884277344 L 12.60062599182129 14.46543884277344 L 12.60062599182129 13.21169757843018 Z M 11.34688568115234 14.46543884277344 L 12.60062599182129 14.46543884277344 L 12.60062599182129 15.71917915344238 L 11.34688568115234 15.71917915344238 L 11.34688568115234 14.46543884277344 Z M 12.60062599182129 15.71917915344238 L 13.85436630249023 15.71917915344238 L 13.85436630249023 16.97291946411133 L 12.60062599182129 16.97291946411133 L 12.60062599182129 15.71917915344238 Z M 11.34688568115234 16.97291946411133 L 12.60062599182129 16.97291946411133 L 12.60062599182129 18.22665977478027 L 11.34688568115234 18.22665977478027 L 11.34688568115234 16.97291946411133 Z M 12.60062599182129 18.22665977478027 L 13.85436630249023 18.22665977478027 L 13.85436630249023 19.48040008544922 L 12.60062599182129 19.48040008544922 L 12.60062599182129 18.22665977478027 Z M 11.34688568115234 19.48040008544922 L 12.60062599182129 19.48040008544922 L 12.60062599182129 20.7341423034668 L 11.34688568115234 20.7341423034668 L 11.34688568115234 19.48040008544922 Z M 12.60062599182129 20.7341423034668 L 13.85436630249023 20.7341423034668 L 13.85436630249023 21.98788261413574 L 12.60062599182129 21.98788261413574 L 12.60062599182129 20.7341423034668 Z M 21.37680816650391 11.95796012878418 L 22.63054847717285 11.95796012878418 L 22.63054847717285 13.21170043945313 L 21.37680816650391 13.21170043945313 L 21.37680816650391 11.95796012878418 Z M 3.824444532394409 11.95796012878418 L 5.078185081481934 11.95796012878418 L 5.078185081481934 13.21170043945313 L 3.824444532394409 13.21170043945313 L 3.824444532394409 11.95796012878418 Z M 5.078185081481934 10.70421981811523 L 6.331924915313721 10.70421981811523 L 6.331924915313721 11.95796012878418 L 5.078185081481934 11.95796012878418 L 5.078185081481934 10.70421981811523 Z M 2.570704221725464 10.70421981811523 L 3.824444532394409 10.70421981811523 L 3.824444532394409 11.95796012878418 L 2.570704460144043 11.95796012878418 L 2.570704221725464 10.70421981811523 Z M 7.585665702819824 10.70421981811523 L 8.839406967163086 10.70421981811523 L 8.839406967163086 11.95796012878418 L 7.585665702819824 11.95796012878418 L 7.585665702819824 10.70421981811523 Z M 8.839406967163086 11.95796012878418 L 10.09314727783203 11.95796012878418 L 10.09314727783203 13.21170043945313 L 8.839406967163086 13.21170043945313 L 8.839406967163086 11.95796012878418 Z M 10.09314727783203 10.70421981811523 L 11.34688758850098 10.70421981811523 L 11.34688758850098 11.95796012878418 L 10.0931453704834 11.95796012878418 L 10.09314727783203 10.70421981811523 Z M 13.85436820983887 11.95796012878418 L 15.10810852050781 11.95796012878418 L 15.10810852050781 13.21170043945313 L 13.85436820983887 13.21170043945313 L 13.85436820983887 11.95796012878418 Z M 15.10810852050781 10.70421981811523 L 16.36184883117676 10.70421981811523 L 16.36184883117676 11.95796012878418 L 15.10810852050781 11.95796012878418 L 15.10810852050781 10.70421981811523 Z M 16.36184883117676 11.95796012878418 L 17.6155891418457 11.95796012878418 L 17.6155891418457 13.21170043945313 L 16.36184883117676 13.21170043945313 L 16.36184883117676 11.95796012878418 Z M 17.6155891418457 10.70421981811523 L 18.86932945251465 10.70421981811523 L 18.86932945251465 11.95796012878418 L 17.6155891418457 11.95796012878418 L 17.6155891418457 10.70421981811523 Z M 18.86932945251465 11.95796012878418 L 20.12306976318359 11.95796012878418 L 20.12306976318359 13.21170043945313 L 18.86932945251465 13.21170043945313 L 18.86932945251465 11.95796012878418 Z M 20.12306976318359 10.70421981811523 L 21.37681007385254 10.70421981811523 L 21.37681007385254 11.95796012878418 L 20.12306976318359 11.95796012878418 L 20.12306976318359 10.70421981811523 Z M 21.37681007385254 14.46544075012207 L 22.63055038452148 14.46544075012207 L 22.63055038452148 15.71918201446533 L 21.37681007385254 15.71918201446533 L 21.37681007385254 14.46544075012207 Z M 13.8543701171875 14.46544075012207 L 15.10811042785645 14.46544075012207 L 15.10811042785645 15.71918201446533 L 13.8543701171875 15.71918201446533 L 13.8543701171875 14.46544075012207 Z M 15.10811042785645 13.21170043945313 L 16.36185073852539 13.21170043945313 L 16.36185073852539 14.46544075012207 L 15.10811042785645 14.46544075012207 L 15.10811042785645 13.21170043945313 Z M 16.36185073852539 14.46544075012207 L 17.61559104919434 14.46544075012207 L 17.61559104919434 15.71918201446533 L 16.36185073852539 15.71918201446533 L 16.36185073852539 14.46544075012207 Z M 18.86933135986328 14.46544075012207 L 20.12307167053223 14.46544075012207 L 20.12307167053223 15.71918201446533 L 18.86933135986328 15.71918201446533 L 18.86933135986328 14.46544075012207 Z M 20.12307167053223 13.21170043945313 L 21.37681198120117 13.21170043945313 L 21.37681198120117 14.46544075012207 L 20.12307167053223 14.46544075012207 L 20.12307167053223 13.21170043945313 Z M 21.37681198120117 16.97292137145996 L 22.63055229187012 16.97292137145996 L 22.63055229187012 18.22666358947754 L 21.37681198120117 18.22666358947754 L 21.37681198120117 16.97292137145996 Z M 13.8543701171875 16.97292137145996 L 15.10811042785645 16.97292137145996 L 15.10811042785645 18.22666358947754 L 13.8543701171875 18.22666358947754 L 13.8543701171875 16.97292137145996 Z M 15.10811042785645 15.71918201446533 L 16.36185073852539 15.71918201446533 L 16.36185073852539 16.97292137145996 L 15.10811042785645 16.97292137145996 L 15.10811042785645 15.71918201446533 Z M 17.61559104919434 15.71918201446533 L 18.86933135986328 15.71918201446533 L 18.86933135986328 16.97292137145996 L 17.61559104919434 16.97292137145996 L 17.61559104919434 15.71918201446533 Z M 18.86933135986328 16.97292137145996 L 20.12307357788086 16.97292137145996 L 20.12307357788086 18.22666358947754 L 18.86933135986328 18.22666358947754 L 18.86933135986328 16.97292137145996 Z M 20.12307357788086 15.71918201446533 L 21.3768138885498 15.71918201446533 L 21.3768138885498 16.97292137145996 L 20.12307357788086 16.97292137145996 L 20.12307357788086 15.71918201446533 Z M 21.3768138885498 19.48040390014648 L 22.63055229187012 19.48040390014648 L 22.63055229187012 20.73414421081543 L 21.37681198120117 20.73414421081543 L 21.3768138885498 19.48040390014648 Z M 15.10811233520508 18.22666358947754 L 16.36185264587402 18.22666358947754 L 16.36185264587402 19.48040390014648 L 15.10811233520508 19.48040390014648 L 15.10811233520508 18.22666358947754 Z M 16.36185264587402 19.48040390014648 L 17.61559295654297 19.48040390014648 L 17.61559295654297 20.73414421081543 L 16.36185264587402 20.73414421081543 L 16.36185264587402 19.48040390014648 Z M 17.61559295654297 18.22666358947754 L 18.86933326721191 18.22666358947754 L 18.86933326721191 19.48040390014648 L 17.61559295654297 19.48040390014648 L 17.61559295654297 18.22666358947754 Z M 18.86933326721191 19.48040390014648 L 20.12307357788086 19.48040390014648 L 20.12307357788086 20.73414421081543 L 18.86933326721191 20.73414421081543 L 18.86933326721191 19.48040390014648 Z M 15.10811233520508 20.73414421081543 L 16.36185264587402 20.73414421081543 L 16.36185264587402 21.98788452148438 L 15.10811233520508 21.98788452148438 L 15.10811233520508 20.73414421081543 Z M 17.61559295654297 20.73414421081543 L 18.86933326721191 20.73414421081543 L 18.86933326721191 21.98788452148438 L 17.61559295654297 21.98788452148438 L 17.61559295654297 20.73414421081543 Z M 20.12307357788086 20.73414421081543 L 21.3768138885498 20.73414421081543 L 21.3768138885498 21.98788452148438 L 20.12307357788086 21.98788452148438 L 20.12307357788086 20.73414421081543 Z" fill="#b90b0c" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                    allowDrawingOutsideViewBox: true,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 28),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        'QR Code',
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 14,
                                          color: const Color(0xff252525),
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Divider(
                                        height: 1,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.5,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PrivacyPolicy(),
                                  ));
                            },
                            child: Row(
                              children: <Widget>[
                                Center(
                                  child: SvgPicture.string(
                                    '<svg viewBox="24.0 478.0 21.0 26.3" ><path transform="translate(24.0, 8946.03)" d="M 10.50053215026855 -8441.7490234375 L 10.50093460083008 -8441.7490234375 L 10.49837970733643 -8441.7490234375 C 10.22320747375488 -8441.8896484375 7.738136768341064 -8443.1806640625 5.250441074371338 -8445.357421875 C 3.726113319396973 -8446.69140625 2.511643886566162 -8448.0859375 1.640764713287354 -8449.5 C 0.5520341992378235 -8451.26953125 8.36425806483021e-06 -8453.0771484375 8.36425806483021e-06 -8454.873046875 L 8.36425806483021e-06 -8464.0615234375 L 10.50093460083008 -8468 L 21.00000762939453 -8464.0615234375 L 21.00000762939453 -8454.873046875 C 21.00000762939453 -8453.0771484375 20.44807815551758 -8451.26953125 19.35954093933105 -8449.5 C 18.48881721496582 -8448.0859375 17.27455902099609 -8446.69140625 15.75050067901611 -8445.357421875 C 13.26327800750732 -8443.181640625 10.77861976623535 -8441.8896484375 10.50349807739258 -8441.7490234375 L 10.50309562683105 -8441.7490234375 L 10.50053215026855 -8441.7490234375 Z M 7.166746616363525 -8457.8408203125 C 6.59254789352417 -8457.8408203125 6.125397682189941 -8457.3740234375 6.125397682189941 -8456.8017578125 L 6.125397682189941 -8451.802734375 C 6.125397682189941 -8451.228515625 6.59254789352417 -8450.7626953125 7.166746616363525 -8450.7626953125 L 13.41300964355469 -8450.7626953125 C 13.98720836639404 -8450.7626953125 14.45435905456543 -8451.228515625 14.45435905456543 -8451.802734375 L 14.45435905456543 -8456.8017578125 C 14.45435905456543 -8457.3740234375 13.98720836639404 -8457.8408203125 13.41300964355469 -8457.8408203125 L 12.78819179534912 -8457.8408203125 L 12.78819179534912 -8459.0576171875 C 12.78819179534912 -8460.4326171875 11.68287944793701 -8461.5703125 10.32427024841309 -8461.5908203125 L 10.29166793823242 -8461.5908203125 C 8.91309928894043 -8461.5908203125 7.791555404663086 -8460.46875 7.791555404663086 -8459.0908203125 L 7.791555404663086 -8457.8408203125 L 7.166746616363525 -8457.8408203125 Z M 10.30754089355469 -8452.427734375 L 10.30748748779297 -8452.427734375 L 10.28787899017334 -8452.427734375 C 10.08749294281006 -8452.427734375 9.924469947814941 -8452.591796875 9.924469947814941 -8452.79296875 L 9.924469947814941 -8454.5947265625 C 9.611644744873047 -8454.7451171875 9.428969383239746 -8455.0693359375 9.459586143493652 -8455.41796875 C 9.494858741760254 -8455.8203125 9.825830459594727 -8456.1455078125 10.2294454574585 -8456.171875 C 10.24989414215088 -8456.1748046875 10.26848888397217 -8456.1748046875 10.2889461517334 -8456.1748046875 C 10.74830913543701 -8456.1748046875 11.12203407287598 -8455.8017578125 11.12203407287598 -8455.34375 C 11.12203407287598 -8455.0185546875 10.94247341156006 -8454.7314453125 10.65342235565186 -8454.5947265625 L 10.65342235565186 -8452.802734375 C 10.65342235565186 -8452.6025390625 10.50149440765381 -8452.4384765625 10.30754089355469 -8452.427734375 Z M 12.05924701690674 -8457.8408203125 L 12.05837249755859 -8457.8408203125 L 8.520508766174316 -8457.8408203125 L 8.520508766174316 -8459.0908203125 C 8.520508766174316 -8459.560546875 8.70475959777832 -8460.00390625 9.03931999206543 -8460.3408203125 C 9.374569892883301 -8460.67578125 9.818357467651367 -8460.8603515625 10.2889461517334 -8460.8603515625 C 10.76138210296631 -8460.8603515625 11.20517826080322 -8460.67578125 11.53857326507568 -8460.3408203125 C 11.87433242797852 -8460.00390625 12.05924701690674 -8459.560546875 12.05924701690674 -8459.0908203125 L 12.05924701690674 -8457.841796875 L 12.05924701690674 -8457.8408203125 Z" fill="#b90b0c" stroke="none" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" /></svg>',
                                    allowDrawingOutsideViewBox: true,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 28),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        'Privacy Policy',
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 14,
                                          color: const Color(0xff252525),
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Divider(
                                        height: 1,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.5,
                          ),
                          InkWell(
                            onTap: () {
                              // print(context.bloc<UserCubit>().user);
                              _logout();
                            },
                            child: Row(
                              children: <Widget>[
                                Center(
                                  child: SvgPicture.string(
                                    '<svg viewBox="22.0 548.5 24.1 18.4" ><path transform="translate(22.0, 543.98)" d="M 23.80321884155273 14.50935649871826 L 15.75705909729004 22.55553817749023 C 15.03865242004395 23.27394676208496 13.79341316223145 22.77105903625488 13.79341316223145 21.74134063720703 L 13.79341316223145 17.14352226257324 L 7.279857635498047 17.14352226257324 C 6.642869472503662 17.14352226257324 6.130406379699707 16.63105773925781 6.130406379699707 15.99406814575195 L 6.130406379699707 11.39625072479248 C 6.130406379699707 10.75926208496094 6.642869472503662 10.24679660797119 7.279857635498047 10.24679660797119 L 13.79341316223145 10.24679660797119 L 13.79341316223145 5.648977279663086 C 13.79341316223145 4.62404727935791 15.03386306762695 4.116371631622314 15.75705909729004 4.834780693054199 L 23.80321884155273 12.88096332550049 C 24.24863052368164 13.33116626739502 24.24863052368164 14.05915355682373 23.80321884155273 14.50935649871826 Z M 9.195609092712402 22.31606864929199 L 9.195609092712402 20.40031051635742 C 9.195609092712402 20.0842113494873 8.936982154846191 19.82558250427246 8.620882987976074 19.82558250427246 L 4.597804546356201 19.82558250427246 C 3.750084400177002 19.82558250427246 3.065203189849854 19.14069938659668 3.065203189849854 18.29297637939453 L 3.065203189849854 9.097341537475586 C 3.065203189849854 8.249617576599121 3.750084400177002 7.564735412597656 4.597804546356201 7.564735412597656 L 8.620882987976074 7.564735412597656 C 8.936982154846191 7.564735412597656 9.195609092712402 7.306108474731445 9.195609092712402 6.990007400512695 L 9.195609092712402 5.074251174926758 C 9.195609092712402 4.758150100708008 8.936982154846191 4.499523162841797 8.620882987976074 4.499523162841797 L 4.597804546356201 4.499523162841797 C 2.059433221817017 4.499523162841797 0 6.558962821960449 0 9.097341537475586 L 0 18.29297637939453 C 0 20.83135414123535 2.059433221817017 22.89079475402832 4.597804546356201 22.89079475402832 L 8.620882987976074 22.89079475402832 C 8.936982154846191 22.89079475402832 9.195609092712402 22.63216781616211 9.195609092712402 22.31606864929199 Z" fill="#b90b0c" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                    allowDrawingOutsideViewBox: true,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 28),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        'Logout',
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 14,
                                          color: const Color(0xff252525),
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Divider(
                                        height: 1,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _logout() async {
    UserApi().logout().then((value) async {
      print(value);
      // Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => SignInPage(),
      //     ));

      pushNewScreen(
        context,
        screen: SignInPage(),
        withNavBar: false,
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
    });
  }
}
