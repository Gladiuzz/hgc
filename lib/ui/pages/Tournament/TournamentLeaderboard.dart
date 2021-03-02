import 'package:flutter/material.dart';
import 'package:hgc/cubit/leaderboard_cubit.dart';
import 'package:hgc/model/TournamentLeaderboard.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TournamentLeaderBoard extends StatefulWidget {
  TournamentLeaderBoard({Key key}) : super(key: key);

  @override
  _TournamentLeaderBoardState createState() => _TournamentLeaderBoardState();
}

class _TournamentLeaderBoardState extends State<TournamentLeaderBoard> {
  static const int numItems = 10;
  List<bool> selected = List<bool>.generate(numItems, (index) => false);

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
              'Leaderboard',
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
              child: Builder(
                builder: (context) {
                  return _buildListView(
                      context.bloc<LeaderboardCubit>().leaderboard);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildListView(Tournament_Leaderboard leaderboard) {
    Size size = MediaQuery.of(context).size;
    return DataTable(
      showBottomBorder: false,
      columnSpacing: 30,
      headingRowColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        return const Color(0xfff8f8f8);
      }),
      columns: const <DataColumn>[
        DataColumn(
          label: Text('#'),
        ),
        DataColumn(
          label: Text('Name'),
        ),
        DataColumn(
          label: SizedBox(
            width: 50.0,
            child: Text(
              'Hole\nPlayed',
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 14,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        DataColumn(
          label: SizedBox(
            width: 41.0,
            child: Text(
              'Total\nScore',
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 14,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
      rows: leaderboard.data
          .map(
            (index) => DataRow(
              color: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                // All rows will have the same selected color.
                if (states.contains(MaterialState.selected))
                  return Theme.of(context).colorScheme.primary.withOpacity(0.5);
                // Even rows will have a grey color.
                if (numItems % 2 == 0) {
                  return Colors.white;
                }
                return const Color(
                    0xfff8f8f8); // Use default value for other states and odd rows.
              }),
              cells: <DataCell>[
                DataCell(Text('${1}')),
                DataCell(Text('${index.userName}')),
                DataCell(
                  SizedBox(
                    width: 23.0,
                    child: Text(
                      '${index.clearedScoreHolesCount}',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 13,
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                DataCell(
                  SizedBox(
                    width: 33.0,
                    child: Text(
                      '${index.totalScore}',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 13,
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}
