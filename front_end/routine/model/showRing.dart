import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zhaoxiban/pages/routine/provider/routineProvider.dart';
import 'package:zhaoxiban/pages/routine/model/routine_addIterm.dart';

List<String>repeatData=["默认","风铃","山间小溪"];
Map isSelect={
  "默认":[true],
  "风铃":[false],
  "山间小溪":[false],
};

class ShowRing extends StatefulWidget {
  @override
  createState() {
    return  ShowRingState();
  }
}

class ShowRingState extends State<ShowRing> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height *0.3,
        width: MediaQuery.of(context).size.width *0.7,
        child: Consumer<RoutineList>(
            builder: (context, funcRoutine, child) {
              return ListView.builder(
                  itemCount: repeatData.length,
                  itemBuilder: (BuildContext context, int index) {
                    index_1=index;
                    return InkWell(
                      splashColor: Color.fromRGBO(236, 233, 233, 1.0),
                      onTap: () {
                        setState(() {
                          print(isSelect[repeatData[index]][0]);
                          for (int i = 0; i < 3; i++) {
                            isSelect[repeatData[i]][0] = false;
                          }
                          isSelect[repeatData[index]][0] = true;
                          funcRoutine.getRing(repeatData[index]);
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width *0.65,
                        margin:const EdgeInsets.only(top: 20.0),
                        alignment: Alignment.center,
                        decoration:const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                  width: 2.0,
                                  color: Color.fromRGBO(
                                      196, 196, 196, 1),
                                )
                            )
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Container( //文字
                              width: MediaQuery.of(context).size.width *0.65*0.7,
                              margin:const EdgeInsets.only(left: 20.0, bottom: 10.0),
                              child: Text(
                                  repeatData[index_1],
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30.0,
                                      fontFamily: 'SHS')
                              ),
                            ),
                            Container( //单选按钮
                              width: MediaQuery.of(context).size.width *0.65*0.1,
                              child: Text("✔",
                                  style:  TextStyle(
                                      color: isSelect[repeatData[index_1]][0] ==
                                          true ? Colors.black : Colors
                                          .white,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 30.0,
                                      fontFamily: 'SHS'
                                  )),
                            ),
                          ],
                        ),
                      ),

                    );
                  }
              );
            }
        )
    );

  }
}