import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(PaperRockScissorsGamePage());
}

class HandPlayer {
  String image_URL;
  HandPlayer(this.image_URL);
}

class PaperRockScissorsGamePage extends StatefulWidget {
  @override
  State createState() => PaperRockScissorsGamePageState();
}

class PaperRockScissorsGamePageState extends State<PaperRockScissorsGamePage> {
  final List<HandPlayer> img_list = [];
  int player1_index;
  int player2_index;
  String result_text;

  @override
  void initState() {
    img_list.add(new HandPlayer("assets/images/paper.png"));
    img_list.add(new HandPlayer("assets/images/rock.png"));
    img_list.add(new HandPlayer("assets/images/scissors.png"));

    player1_index = 0;
    player2_index = 1;
    result_text = "";

    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Paper-Rock-Scissors',
            style: TextStyle(
              color: Colors.black38,
              fontSize: 30.0,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white70,
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'YOU',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                            color: Colors.red,
                          ),
                        ),
                        Image(image: AssetImage(img_list[player1_index].image_URL)),
                      ],
                    ),
                  ),
                  Expanded(
                    child:Column(
                      children:<Widget>[
                        Text(
                          'PLAYER 2',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                            color: Colors.red,
                          ),
                        ),
                        Image(image: AssetImage(img_list[player2_index].image_URL)),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  SizedBox(
                    height: 70.0,
                    child: Text(
                      result_text,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                  )
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonTheme(
                    minWidth: 300.0,
                    height: 50.0,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.red),
                      ),
                      color: Colors.red,
                      highlightColor: Colors.transparent,
                      onPressed: () {
                        _startRandomGame();
                      },
                      child: Text(
                        'GO!!',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white
                        ),
                      ),
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

  void _startRandomGame() {
    Random rnd = new Random();

    setState(() {
      player1_index = rnd.nextInt(3);
      player2_index = rnd.nextInt(3);

      if(player1_index == 0 && player2_index == 1){
        result_text = "YOU WIN";
      }else if(player1_index == 0 && player2_index == 2){
        result_text = "YOU LOSE";
      }else if(player1_index == 1 && player2_index == 0){
        result_text = "YOU LOSE";
      }else if(player1_index == 1 && player2_index == 2){
        result_text = "YOU WIN";
      }else if(player1_index == 2 && player2_index == 0){
        result_text = "YOU WIN";
      }else if(player1_index == 2 && player2_index == 1){
        result_text = "YOU LOSE";
      }else{
        result_text = "TIE IN PLAY";
      }
    });

  }

}
