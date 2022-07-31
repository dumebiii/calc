import 'package:math_expressions/math_expressions.dart';
import 'package:calc/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Calc extends StatefulWidget {
  const Calc({Key? key}) : super(key: key);

  @override
  _CalcState createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  String userinput = '0';
  String answer = '0';
  String expression = '';

  buttonpressed(text) {
    setState(() {
      if (text == 'C') {
        userinput = '0';
        answer = '0';
      } else if (text == 'CE') {
        userinput = userinput.substring(0, userinput.length - 1);
        if (userinput == '') {
          userinput = '0';
        }
      } else if (text == '=') {
        expression = userinput;
        expression = expression.replaceAll('+', '+');
        expression = expression.replaceAll('x', '*');
        expression = expression.replaceAll('÷', '/');
        expression = expression.replaceAll('%', '%');
        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          final ans = exp.evaluate(EvaluationType.REAL, cm);

          var ant = ans.toInt();
          var and = ant.toStringAsExponential(4);
          answer = and.toString();
          // if (and > pow(10, 18)) {
          //   and = pow(10, 18);
          // }
          if (ant > pow(10, 10) || ant < pow(10, 4294967296)) {
            answer = ant.toStringAsExponential(4);
            // answer = and.toStringAsFixed(3);
            //  var and = ant.toStringAsExponential();
          } else {
            answer = ant.toString();
          }
        } catch (e) {
          answer = 'Error';
        }
      } else {
        if (userinput == '0') {
          userinput = text;
        } else {
          userinput = userinput + text;
        }
      }
    });
  }

  // ignore: non_constant_identifier_names
  Widget Buttonpress({Color? color, String? text, double? width}) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: TextButton(
        onPressed: () => buttonpressed(text),
        child: Text(text!, style: Theme.of(context).textTheme.headline2),
      ),
      height: 70.0,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
        // color: Theme.of(context).primaryColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.transparent,
                alignment: Alignment.topRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Padding(padding: EdgeInsets.all(25)),
                    // ListView(
                    //   scrollDirection: Axis.vertical,
                    //   shrinkWrap: true,
                    //   physics: const NeverScrollableScrollPhysics(),
                    //   children: [
                    //     Text(
                    //       userinput,
                    //       style: Theme.of(context).textTheme.headline6,
                    //     ),
                    //   ],
                    // ),
                    SingleChildScrollView(
                      reverse: true,
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          userinput,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      answer,
                      style: kequationstyle,
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    const Divider(
                      height: 5.0,
                      indent: 80.0,
                    ),
                  ],
                ),
                height: 300,
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Buttonpress(
                      text: 'C',
                      width: 70.0,
                      color: Theme.of(context).primaryColor),
                  Buttonpress(
                      text: 'CE',
                      width: 70.0,
                      color: Theme.of(context).primaryColor),
                  Buttonpress(
                      text: '%',
                      width: 70.0,
                      color: Theme.of(context).primaryColor),
                  Buttonpress(
                      text: '÷',
                      width: 70.0,
                      color: Theme.of(context).primaryColor),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Buttonpress(
                    text: '7',
                    color: Colors.transparent,
                  ),
                  Buttonpress(text: '8', color: Colors.transparent),
                  Buttonpress(text: '9', color: Colors.transparent),
                  Buttonpress(
                      text: 'x',
                      width: 70.0,
                      color: Theme.of(context).primaryColor),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Buttonpress(text: '4', color: Colors.transparent),
                  Buttonpress(text: '5', color: Colors.transparent),
                  Buttonpress(text: '6', color: Colors.transparent),
                  Buttonpress(
                      text: '-',
                      width: 70.0,
                      color: Theme.of(context).primaryColor),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Buttonpress(text: '1', color: Colors.transparent),
                  Buttonpress(text: '2', color: Colors.transparent),
                  Buttonpress(text: '3', color: Colors.transparent),
                  Buttonpress(
                      text: '+',
                      width: 70.0,
                      color: Theme.of(context).primaryColor),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Buttonpress(text: '0', color: Colors.transparent),
                  Buttonpress(text: '.', color: Colors.transparent),
                  Buttonpress(
                      text: '=',
                      width: 180.0,
                      color: Theme.of(context).primaryColor),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Widget Buttonpress(String text, double width, Color color) {
//   return Container(
//     margin: const EdgeInsets.all(15),
//     child: TextButton(
//       onPressed: () {},
//       child: Text(text!, style: Theme.of(context).textTheme.headline2),
//     ),
//     height: 70.0,
//     width: width,
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(10),
//       color: color,
//       // color: Theme.of(context).primaryColor,
//     ),
//   );
// }

// class Buttonpress extends StatefulWidget {
//   final String? text;
//   final double? width;
//   final Color? color;

//   const Buttonpress({Key? key, this.text, this.width, this.color})
//       : super(key: key);

//   @override
//   State<Buttonpress> createState() => _ButtonpressState();
// }

// class _ButtonpressState extends State<Buttonpress> {
//  buttonpressed(text){
// setState(() {
//   if (text == 'C'){

//   }else if( text =='+/-'){

//   }else if(text =='='){

//   }else{
// if()
//   }

// });
//  }

//   @override
  
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(15),
//       child: TextButton(
//         onPressed:()=> buttonpressed(widget.text),
//         child: Text(widget.text!, style: Theme.of(context).textTheme.headline2),
//       ),
//       height: 70.0,
//       width: widget.width,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: widget.color,
//         // color: Theme.of(context).primaryColor,
//       ),
//     );
//   }
// }
