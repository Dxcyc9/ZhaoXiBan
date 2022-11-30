import 'package:flutter/material.dart';
import 'package:zhaoxiban/pages/homepage/page/HomePage.dart';
import 'package:zhaoxiban/pages/routine/model/routine_addIterm.dart';
import 'package:zhaoxiban/pages/routine/model/routineIterm.dart';
import 'package:zhaoxiban/pages/routine/page/routine.dart';
import 'package:provider/provider.dart';
import 'package:zhaoxiban/pages/routine/provider/routineProvider.dart';

class Routine_add extends StatefulWidget {
  const Routine_add({key}) : super(key: key);

  @override
  State<Routine_add> createState() => _Routine_addState();
}

class _Routine_addState extends State<Routine_add> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:const Color.fromRGBO(74, 69, 40, 1.0),
          leading: MaterialButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return const HomePage();
                },
              ));
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          elevation: 2.0,
          title: const Text(
            "每日行程",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 25.0,
                fontFamily: 'SHS'),
          ),
        ),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width ,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(214, 197, 99, 1.0),
          ),
          child:  Consumer<RoutineList>(
          builder: (context, funcRoutine, child) {
            return Column(

                 children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(top: 10),
                        child:const Text(
                        "添加行程",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Color.fromRGBO(74, 69, 40, 1.0),
                        fontSize: 35.0,
                        fontFamily: 'SHS'),
                        ),
                        ),
                   Expanded(
                     child:Container(

                       width: MediaQuery.of(context).size.width,
                       child: new Routine_addIterm(),
                     ),
                   ),

                   Container(
                              width: 300,
                              child: Container(
                              decoration:const BoxDecoration(
                              color: Color.fromRGBO(65, 178, 0, 1.0),
                              borderRadius: BorderRadius.all( Radius.circular(20.0)),
                              ),
                              child: TextButton(
                              onPressed: (){
                              setState(() {

                        });
                     },
                                      child: TextButton(
                                          onPressed: () {
                                          routineKey.add(nowKey.toString());
                                          print(routineKey);
                                          print(nowKey.toString());
                                          routineData[nowKey.toString()]=[false, funcRoutine.isam, funcRoutine.content, funcRoutine.hour+":"+funcRoutine.minute, '每次', '默认'];
                                          // routineData[nowKey.toString()][0]=false;
                                          // print(1);
                                          // routineData[nowKey.toString()][1]=funcRoutine.isam;
                                          // print(2);
                                          // routineData[nowKey.toString()][2]=funcRoutine.content;
                                          // print(3);
                                          // routineData[nowKey.toString()][3]=funcRoutine.hour+":"+funcRoutine.minute;
                                          // print(4);
                                          setList[0]="pm  00:00";
                                          setList[1]="设置行程";
                                          nowKey++;
                                          Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) {
                                            return const Routine();
                                                },
                                           ));
                                          },
                                            child:const Text(
                                            "确认添加",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            color: Color.fromRGBO(255, 255, 255, 1.0),
                                            fontSize: 35.0,
                                            fontFamily: 'SHS'),
                                            ),
                                            )


                                             ),
        )

        )
        ]
        );
    })
    )
    );
  }
}
