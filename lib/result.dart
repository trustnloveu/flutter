import "package:flutter/material.dart";

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;

    if (resultScore >= 20) {
      resultText = "Your score is over average.";
    } else if (resultScore >= 10) {
      resultText = "Your score is on average.";
    } else {
      resultText = "Your score is under average.";
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultScore.toString(),
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          TextButton(
              onPressed: resetHandler,
              child: Text("Restart"),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.blue),
              )),
        ],
      ),
    );
  }
}
