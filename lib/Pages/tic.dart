import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Tic extends StatefulWidget {
  const Tic({Key? key}) : super(key: key);

  @override
  State<Tic> createState() => _TicState();
}

class _TicState extends State<Tic> {
  static const String player_x = 'X';
  static const String player_y = 'O';
  String playerAct = player_x; //player now
  static int level_player1 = 0;
  static int level_player2 = 0;
  bool? endGame = false;
  List<String> matrex = [];
  int steep = 0;
  bool StartGame = false;

@override
  void initState() {
    _inil();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    final orientation = MediaQuery.of(context).orientation;
      return orientation==Orientation.portrait?myScaffoldPortrait(w, h):myScaffold2(w, h);

  }
  _winer() {
    List<List<int>> win = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ];
    for (var w in win) {
      String playerPos0 = matrex[w[0]];
      String playerPos1 = matrex[w[1]];
      String playerPos2 = matrex[w[2]];
      if (playerPos0.isNotEmpty) {
        if (playerPos0 == playerPos1 && playerPos0 == playerPos2) {

          playerDialog(playerPos0 );
          endGame = true;

          return;
        }


      }


    }

    if(steep==9){
      drawDialog();
    }

  }

  playerDialog(String m) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: AlertDialog(
              title: Text("the Result"),
              content:m=='X'||m=='O'?Text("The Player Has Won $m "):Text('Draw'),
              actions: [
                TextButton(
                    onPressed: () {
                   setState(() {
                     _inil();
                     level_player1=level_player2=0;
                   });
                      Navigator.pop(context);
                    },
                    child: Text("Cancel")),
                TextButton(
                    onPressed: () {
                      setState(() {

                        if(m=='X'){
                          level_player1++;
                        }
                        else if(m=='O'){
                          level_player2++;
                        }

                        _inil();

                        Navigator.pop(context);
                      });
                    },
                    child: Text("Continuation")),
              ],
            ),
          );
        });
  }
  drawDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: AlertDialog(
              title: Text("the Result"),
              content:Text('Draw'),
              actions: [
                TextButton(
                    onPressed: () {
                      setState(() {
                        _inil();
                      });
                      Navigator.pop(context);
                    },
                    child: Text("Cancel")),
                TextButton(
                    onPressed: () {
                      setState(() {

                        _inil();
                        Navigator.pop(context);
                      });
                    },
                    child: Text("Continuation")),
              ],
            ),
          );
        });
  }
  Widget myScaffoldPortrait(double w,double h){
  return  Scaffold(
    appBar: AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Color.fromRGBO(215, 207, 249, 1),
      title: Text('TIC-TAC-TOE', style: TextStyle(fontSize: w * 0.09,color: Colors.black),),
    ),
    backgroundColor: Color.fromRGBO(215, 207, 249, 1),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Container(
            alignment: Alignment.center,
            width: w * 0.3,
            height: h * 0.04,
            child: Text('Instructions',
                style: TextStyle(fontSize: w * 0.05)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: w * 0.85,
            height: h * 0.07,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'player1',
                      style: TextStyle(
                          color: Colors.black, fontSize: w * 0.05),
                    ),
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(w * 0.3, h * 0.07),
                        backgroundColor: playerAct == player_x
                            ? Color.fromRGBO(173, 87, 0, 1)
                            : Color.fromRGBO(255, 204, 0, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(15)))),
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: playerAct == player_x
                        ? Color.fromRGBO(173, 87, 0, 1)
                        : Color.fromRGBO(255, 204, 0, 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: playerAct == player_y
                        ? Color.fromRGBO(173, 87, 0, 1)
                        : Color.fromRGBO(255, 204, 0, 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'player2',
                      style: TextStyle(
                          color: Colors.black, fontSize: w * 0.05),
                    ),
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(w * 0.3, h * 0.07),
                        backgroundColor: playerAct == player_y
                            ? Color.fromRGBO(173, 87, 0, 1)
                            : Color.fromRGBO(255, 204, 0, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(15)))),
              ],
            ),
          ),
          SizedBox(
            height: h * 0.05,
          ),
          Container(
            width: w * 0.8,
            height: h * 0.52,

            child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 5.5,
                    crossAxisSpacing: 5.5),
                itemCount: 9,
                itemBuilder: (BuildContext ctx, int index) {
                  return InkWell(

                    onTap: () {
                      setState(() {
                        if (endGame! || matrex[index].isNotEmpty) {}
                        matrex[index] = playerAct;
                        if (playerAct == player_x) {
                          playerAct = player_y;
                        } else {
                          playerAct = player_x;
                        }
                        steep++;
                        _winer();}
                      );
                    },
                    child: Container(
                      child: Text(
                        matrex[index],
                        style: TextStyle(
                            fontSize: w * 0.15,
                            fontWeight: FontWeight.bold),
                      ),
                      alignment: Alignment.center,
                      width: w * 25,
                      height: h * 0.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white,
                      ),
                    ),
                  );
                }),
          ),

          Container(
            width: w * 0.85,
            height: h * 0.07,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "    $level_player1",
                  style: TextStyle(
                      color: Colors.black, fontSize: w * 0.09),
                ),
                Container(
                  width: 20,height: 2,
                  color: Colors.black,
                ),
                Text(
                  '$level_player2',
                  style: TextStyle(
                      color: Colors.black, fontSize: w * 0.09),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
  }

  Widget myScaffold2(double w,double h){
  return  Scaffold(
    appBar: AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Color.fromRGBO(215, 207, 249, 1),
      title: Text('TIC-TAC-TOE', style: TextStyle(fontSize: 25,color: Colors.black),),
    ),
    backgroundColor: Color.fromRGBO(215, 207, 249, 1),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Container(
          width: 250,
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: 20),
                alignment: Alignment.center,
                width: 100,
                height: 100,
                padding: EdgeInsets.all(1),
                decoration: BoxDecoration(
                    color: playerAct == player_x
                        ? Color.fromRGBO(173, 87, 0, 1)
                        : Color.fromRGBO(255, 204, 0, 1),
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  'Player1',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: w * 0.023),
                ),
              ),
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: playerAct == player_x
                      ? Color.fromRGBO(173, 87, 0, 1)
                      : Color.fromRGBO(255, 204, 0, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          padding: EdgeInsets.only(left: 30,right: 30),
          width: double.infinity,
          height: 200,
          //          color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(

                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {

                          StartGame=true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(150, 30),
                          backgroundColor: StartGame
                              ? Color.fromRGBO(87, 70, 175, 1)
                              : Color.fromRGBO(80, 204, 48, 1.0),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(30))),
                      child: Text('PLAY!')),
                  Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 30,
                    child: Text('Instructions',
                        style: TextStyle(fontSize: 10)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              //gridview
              SizedBox(width: 150,),
              Expanded(
                child: GridView.builder(
                    padding: EdgeInsets.all(0),
                    scrollDirection: Axis.horizontal,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 1,
                        crossAxisSpacing: 1),
                    itemCount: 9,
                    itemBuilder: (BuildContext ctx, int index) {
                      return InkWell(
                        onTap: () {
                          if(StartGame){
                            setState(() {
                              if (endGame! ||
                                  matrex[index].isNotEmpty) {}
                              matrex[index] = playerAct;
                              if (playerAct == player_x) {
                                playerAct = player_y;
                              } else {
                                playerAct = player_x;
                              }
                              steep++;
                              _winer();
                            });
                          }

                        },
                        child: Container(
                          child: Text(
                            matrex[index],
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          alignment: Alignment.center,
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
                          ),
                        ),
                      );
                    }),
              ),
//level
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('$level_player1',style: TextStyle(fontSize: 30),),
                  Container(
                    width: 40,
                    height: 1,
                    color: Colors.black,
                  ),
                  Text('$level_player2',style: TextStyle(fontSize: 30),)
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          margin: EdgeInsets.only(left: 170),
          width: 250,
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(right: 20),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: playerAct == player_y
                      ? Color.fromRGBO(173, 87, 0, 1)
                      : Color.fromRGBO(255, 204, 0, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 20),
                alignment: Alignment.center,
                width: 100,
                height: 100,
                padding: EdgeInsets.all(1),
                decoration: BoxDecoration(
                    color: playerAct == player_y
                        ? Color.fromRGBO(173, 87, 0, 1)
                        : Color.fromRGBO(255, 204, 0, 1),
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  'Player1',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: w * 0.023),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
  }
  _inil(){
    playerAct=player_x;
    endGame=false;
    matrex = ['', '', '', '', '', '', '', '', ''];
    steep=0;

  }

}

