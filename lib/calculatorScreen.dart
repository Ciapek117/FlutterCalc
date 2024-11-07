import 'package:flutter/material.dart';

import 'calculatorLogic.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  //Instancja klasy CalculatorLogic
  CalculatorLogic calcLog = CalculatorLogic();

  //Funkcja tworzaca przyciski
  Widget createButton(String text, Color btnColor, Color btnTextColor)
  {
    return ElevatedButton(
      onPressed: () => setState(() {
        calcLog.showCalc(text);
      }),
      child: Text(text, style: TextStyle(
        color: btnTextColor,
        fontSize: 60,
      )),
      style: ElevatedButton.styleFrom(
          backgroundColor: btnColor,
          minimumSize: const Size(100, 95),
          shape: CircleBorder()
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF857225),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //UI Kalklatora
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(padding: EdgeInsets.all(10.0),
                  child: Text(calcLog.finalText,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Color(0Xffddd7c8), fontSize: 100)
                  ),
                )
              ],
            ),

            //Tworzymy przyciski przy pomocy funkcji
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                createButton('C', Color(0xFFf18412), Color(0xFF4f5312)),
                createButton('±', Color(0xFFf18412), Color(0xFF4f5312)),
                createButton('%', Color(0xFFf18412), Color(0xFF4f5312)),
                createButton('÷', Color(0xFFf18412), Color(0xFF4f5312)),
              ],
            ),
            SizedBox( height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                createButton('7', Color(0xFF4f5312), Color(0xFFf18412)),
                createButton('8', Color(0xFF4f5312), Color(0xFFf18412)),
                createButton('9', Color(0xFF4f5312), Color(0xFFf18412)),
                createButton('x', Color(0xFFf18412), Color(0xFF4f5312)),
              ],
            ),
            SizedBox( height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                createButton('4', Color(0xFF4f5312), Color(0xFFf18412)),
                createButton('5', Color(0xFF4f5312), Color(0xFFf18412)),
                createButton('6', Color(0xFF4f5312), Color(0xFFf18412)),
                createButton('-', Color(0xFFf18412), Color(0xFF4f5312)),
              ],
            ),
            SizedBox( height: 3),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                createButton('1', Color(0xFF4f5312), Color(0xFFf18412)),
                createButton('2', Color(0xFF4f5312), Color(0xFFf18412)),
                createButton('3', Color(0xFF4f5312), Color(0xFFf18412)),
                createButton('+', Color(0xFFf18412), Color(0xFF4f5312)),
              ],
            ),
            SizedBox( height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Ten przycisk tworzymy oddzielnie, poniewaz rozni sie od innych
                ElevatedButton(
                  onPressed: () => setState(() {
                    calcLog.showCalc('0');
                  }),
                  child: Text('0', style: TextStyle(color: Color(0xFFf18412), fontSize: 60)),
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 100),
                    padding: EdgeInsets.fromLTRB(34, 0, 130, 0),
                      backgroundColor: Color(0xFF4f5312),
                      shape: StadiumBorder()
                  ),
                ),
                createButton('.', Color(0xFF4f5312), Color(0xFFf18412)),
                createButton('=', Color(0xFFf18412), Color(0xFF4f5312)),
              ],
            ),
            SizedBox( height: 3),
          ],
        ),
      ),
    );
  }
}
