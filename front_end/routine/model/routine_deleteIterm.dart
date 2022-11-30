import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zhaoxiban/pages/routine/provider/routineProvider.dart';
import 'package:zhaoxiban/pages/routine/model/routineIterm.dart';

class Routine_deleteIterm extends StatefulWidget {
  @override
  createState() {
    return  Routine_deleteItermState();
  }
}

class Routine_deleteItermState extends State<Routine_deleteIterm> {
  @override
  void initState() {

  }
  Widget build(BuildContext context) {
    return  Container(
        height: MediaQuery.of(context).size.height *0.67,
        width: MediaQuery.of(context).size.width *0.98,
        margin: const EdgeInsets.only(top: 20.0,bottom: 20.0),
        child: Consumer<RoutineList>(
            builder: (context, funcRoutine, child) {
              return ListView.builder(
                itemCount: routineData.length,
                itemBuilder: (BuildContext context, int index) {
                  return  Container(
                      height: MediaQuery.of(context).size.height *0.67*0.3,
                      width: MediaQuery.of(context).size.width *0.98,
                      margin:const EdgeInsets.only(left: 10.0,bottom:10.0,right:10.0 ),
                      alignment: Alignment.center,
                      decoration:const  BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 1.0),
                        borderRadius: BorderRadius.all( Radius.circular(30.0)),
                      ),
                      child:  Stack(
                          children: [
                            Positioned(
                              height: 71.5,
                              width: 400.0,
                              top:10,
                              left: 30,
                              child: Row(
                                  children: [
                                    Text(
                                        routineData[routineKey[index]][3],
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                            color:Color.fromRGBO(0, 0, 0, 1.0),
                                            fontWeight: FontWeight.w900,
                                            fontSize: 42.0,
                                            fontFamily: 'SHS'
                                        )
                                    ),
                                    Container(
                                      margin:const EdgeInsets.only(left: 20 ),
                                      child: Image(
                                        image:
                                        routineData[routineKey[index]][1]?AssetImage("assets/img/routine_am.png"):AssetImage("assets/img/routine_pm.png"),
                                        height: 60.0,
                                        width: 50.0,
                                      ),
                                    ),
                                    Container(
                                        width: (MediaQuery.of (context). size .width) / 2,
                                        child: MaterialButton(
                                          onPressed: (){
                                            showDialog(
                                                context: context,
                                                builder: (context) => AlertDialog(
                                                  title: Text(
                                                      '删除  '+routineData[routineKey[index]][3],
                                                      style: const TextStyle(
                                                          color:Color.fromRGBO(0, 0, 0, 1.0),
                                                          fontWeight: FontWeight.w900,
                                                          fontSize: 35.0,
                                                          fontFamily: 'SHS'
                                                      )
                                                  ),
                                                  content: Text(
                                                    routineData[routineKey[index]][2],
                                                      style: const TextStyle(
                                                          color:Color.fromRGBO(0, 0, 0, 1.0),
                                                          fontWeight: FontWeight.w900,
                                                          fontSize: 35.0,
                                                          fontFamily: 'SHS'
                                                      )
                                                  ),
                                                  actions: <Widget>[
                                                    Container(
                                                      height: 65,
                                                      decoration: BoxDecoration(
                                                        color:const Color.fromRGBO(
                                                            65, 178,
                                                            0, 1.0),
                                                        borderRadius: BorderRadius.circular(20),
                                                      ),
                                                      child: TextButton(
                                                        child:const Text(
                                                            "确定",
                                                            textAlign: TextAlign.center,
                                                            style:  TextStyle(
                                                                color:Color.fromRGBO(
                                                                    255, 255,
                                                                    255, 1.0),
                                                                fontWeight: FontWeight.w900,
                                                                fontSize: 35.0,
                                                                fontFamily: 'SHS'
                                                            )
                                                        ),
                                                        onPressed: () {
                                                          setState(() {
                                                            funcRoutine.getDelete(routineKey[index]);
                                                            print(routineData);
                                                            Navigator.of(context).pop();
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 65,
                                                      decoration: BoxDecoration(
                                                        color:const Color.fromRGBO(
                                                            209, 71,
                                                           71, 1.0),
                                                        borderRadius: BorderRadius.circular(20),
                                                      ),
                                                      child: TextButton(
                                                        child:const Text(
                                                            "取消",
                                                            textAlign: TextAlign.center,
                                                            style:  TextStyle(
                                                                color:Color.fromRGBO(
                                                                    255, 255,
                                                                    255, 1.0),
                                                                fontWeight: FontWeight.w900,
                                                                fontSize: 35.0,
                                                                fontFamily: 'SHS'
                                                            )
                                                        ),
                                                        onPressed: () {
                                                          Navigator.of(context).pop();
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ));
                                          },
                                          child:const Image(
                                            image: AssetImage("assets/img/routine_wrong.png"),
                                            height: 90.0,
                                            width: 90.0,
                                          ),

                                        )

                                    )
                                  ]
                              ),
                            ),
                            Positioned(
                              height: 71.5,
                              width: 400.0,
                              top: 75,
                              left: 30,
                              child: Text(
                                  routineData[routineKey[index]][2],
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                      color:Color.fromRGBO(0, 0, 0, 1.0),
                                      fontWeight: FontWeight.w900,
                                      fontSize: 35.0,
                                      fontFamily: 'SHS'
                                  )
                              ),
                            ),
                          ]
                      )
                  );

                },
              );
            }
        ));
  }
}
