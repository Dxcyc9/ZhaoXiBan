import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zhaoxiban/pages/routine/provider/routineProvider.dart';
import 'package:zhaoxiban/pages/routine/model/routine_addIterm.dart';

List<String>amPm=["assets/img/routine_am.png","assets/img/routine_pm.png"];
String time_1_1="1";
String time_1_2="1";

class ShowTime extends StatefulWidget {
  @override
  createState() {
    return  ShowTimeState();
  }
}

class ShowTimeState extends State<ShowTime> {
  final PageController pagecontroller = new PageController(viewportFraction: 0.3,initialPage: 1);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height *0.3,
        width: MediaQuery.of(context).size.width *0.7,
        child: Consumer<RoutineList>(
            builder: (context, funcRoutine, child) {

              return Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width *0.7*0.3,
                      child:Stack(
                        children: [
                          Center(
                            child: Container(
                              height: 50,
                              decoration:const BoxDecoration(
                                  border: Border(top: BorderSide(width: 0.5),
                                      bottom: BorderSide(width: 0.5))
                              ),
                            ),
                          ),
                          PageView.builder(
                            itemCount: 2,
                            controller: pagecontroller,
                            scrollDirection: Axis.vertical,
                            pageSnapping: true,
                            physics: AlwaysScrollableScrollPhysics(),
                            itemBuilder: (ctx ,index ){
                              return Center(
                                child: Image(
                                  image: AssetImage(amPm[index]),
                                  height: 60.0,
                                  width: 50.0,
                                ),
                              );
                            },
                            onPageChanged: (int index) {
                              if(index==0)
                              {
                                funcRoutine.getAm(true);
                                }else{
                                funcRoutine.getAm(false);
                              }

                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width *0.7*0.3,
                      child:Stack(
                        children: [
                          Center(
                            child: Container(
                              height: 50,
                              decoration:const BoxDecoration(
                                  border: Border(top: BorderSide(width: 0.5),
                                      bottom: BorderSide(width: 0.5))
                              ),
                            ),
                          ),
                          PageView.builder(
                            itemCount: 13,
                            controller: pagecontroller,
                            scrollDirection: Axis.vertical,
                            pageSnapping: true,
                            physics: AlwaysScrollableScrollPhysics(),
                            itemBuilder: (ctx ,index ){
                              time_1_1=index.toString();
                              return Center(
                                  child: Text(
                                    '$index',
                                    style: const TextStyle(
                                        color:Color.fromRGBO(0, 0, 0, 1.0),
                                        fontWeight: FontWeight.w900,
                                        fontSize: 35.0,
                                        fontFamily: 'SHS'
                                    ),
                                  )
                              );
                            },
                            onPageChanged: (int index) {
                              time_1_1=index.toString();
                              funcRoutine.getHour(time_1_1);
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width *0.7*0.3,
                      child:Stack(
                        children: [
                          Center(
                            child: Container(
                              height: 50,
                              decoration:const BoxDecoration(
                                  border: Border(top: BorderSide(width: 0.5),
                                      bottom: BorderSide(width: 0.5))
                              ),
                            ),
                          ),
                          PageView.builder(
                            itemCount: 61,
                            controller: pagecontroller,
                            scrollDirection: Axis.vertical,
                            pageSnapping: true,
                            physics: AlwaysScrollableScrollPhysics(),
                            itemBuilder: (ctx ,index ){
                              time_1_2=index.toString();
                              return Center(
                                  child: Text(
                                    '$index',
                                    style: const TextStyle(
                                        color:Color.fromRGBO(0, 0, 0, 1.0),
                                        fontWeight: FontWeight.w900,
                                        fontSize: 35.0,
                                        fontFamily: 'SHS'
                                    ),
                                  )
                              );
                            },
                            onPageChanged: (int index) {
                              if(index<=9)
                              {
                                time_1_2='0'+index.toString();
                                }else{
                                time_1_2=index.toString();
                              }
                              funcRoutine.getMinute(time_1_2);
                            },
                          ),
                        ],
                      ),
                    )
                    ]
              );

            }
        )
    );

  }
}