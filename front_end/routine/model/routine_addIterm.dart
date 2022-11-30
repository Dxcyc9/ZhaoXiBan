import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zhaoxiban/pages/routine/provider/routineProvider.dart';
import 'package:zhaoxiban/pages/routine/model/showRepeat.dart';
import 'package:zhaoxiban/pages/routine/model/showTime.dart';
import 'package:zhaoxiban/pages/routine/model/showRing.dart';
import 'package:zhaoxiban/pages/routine/model/showSchedule.dart';


//数据定义
String imgUrl="";
int index_1;
String content_1="设置行程";
String setTime="设置时间";
List<String>addList=["时间","行程","重复","铃声"];
List<String>setList=[setTime,content_1,repeat_1,ring_1];
int flag=0;
String repeat_1="每天";
String ring_1="默认";
class Routine_addIterm extends StatefulWidget {
  @override
  createState() {
    return  Routine_addItermState();
  }
}

class Routine_addItermState extends State<Routine_addIterm> {

  @override

  Widget build(BuildContext context) {
    return  Container(
        height: MediaQuery.of(context).size.height *0.62,
        width: MediaQuery.of(context).size.width *0.98,
        margin: const EdgeInsets.only(top: 20.0,bottom: 20.0),
        child: Consumer<RoutineList>(
            builder: (context, funcRoutine, child) {
              content_1=funcRoutine.content;
              repeat_1=funcRoutine.repeat;
              ring_1=funcRoutine.ring;
              print("content="+content_1);
              setList[1]=content_1;
              if (funcRoutine.isam == true) {
                setTime = "上午  " + funcRoutine.hour + ":" + funcRoutine.minute;
              } else {
                setTime = "下午    " + funcRoutine.hour + ":" + funcRoutine.minute;
              }
              setList[0]=setTime;
              setList[2]=repeat_1;
              setList[3]=ring_1;
              print(setList);
              return ListView.builder(
                itemCount: addList.length,
                itemBuilder: (BuildContext context, int index) {
                if(index==0){
                  imgUrl="assets/img/routine_time.png";
                }else if(index==1){
                  imgUrl="assets/img/routine_schedule.png";
                }
                else if(index==2){
                  imgUrl="assets/img/routine_repeat.png";
                }else if(index==3){
                  imgUrl="assets/img/routine_ring.png";
                }

                  return  Container(
                      height: MediaQuery.of(context).size.height *0.62*0.3,
                      width: MediaQuery.of(context).size.width *0.98,
                      margin:const EdgeInsets.only(left: 10.0,bottom:10.0,right:10.0 ),
                      alignment: Alignment.center,
                      decoration:const  BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 1.0),
                        borderRadius: BorderRadius.all( Radius.circular(60.0)),
                      ),
                      child:  Stack(
                          children: [
                            Positioned(
                              top:10,
                              left: 30,
                              child: Row(
                                  children: [
                                    Container(
                                      margin:const EdgeInsets.only(left: 70,right: 20 ),
                                      child: Image(
                                        image: AssetImage(imgUrl),
                                        height: 60.0,
                                        width: 50.0,
                                      ),
                                    ),
                                    Text(
                                        addList[index],
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                            color:Color.fromRGBO(158, 146, 76, 1.0),
                                            fontWeight: FontWeight.w900,
                                            fontSize: 37.0,
                                            fontFamily: 'SHS'
                                        )
                                    ),
                                  ]
                              ),
                            ),
                            Positioned(
                              top: 60,
                              left: 20,
                              child:  TextButton(
                                  onPressed: (){
                                    if(index==0)//修改时间选项
                                    {
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title:Row(
                                                children:[
                                                  Container(
                                                    margin:const EdgeInsets.only(left: 40,right: 20 ),
                                                    child: Image(
                                                      image: AssetImage(imgUrl),
                                                      height: 60.0,
                                                      width: 50.0,
                                                    ),
                                                  ),
                                                  const Text(
                                                      '时间',
                                                      style:TextStyle(
                                                          color:Color.fromRGBO(158, 146, 76, 1.0),
                                                          fontWeight: FontWeight.w900,
                                                          fontSize: 35.0,
                                                          fontFamily: 'SHS'
                                                      )
                                                  ),
                                                ]
                                            ) ,
                                            content:new ShowTime(),

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
                                                      if (funcRoutine.isam == true) {
                                                        setTime = "am  " + funcRoutine.hour + ":" + funcRoutine.minute;
                                                      } else {
                                                        setTime = "pm    " + funcRoutine.hour + ":" + funcRoutine.minute;
                                                      }
                                                      print(setTime);
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
                                    }
                                    else if(index==1)//修改行程选项
                                    {
                                      {
                                        showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                              title:Row(
                                                  children:[
                                                    Container(
                                                      margin:const EdgeInsets.only(left: 40,right: 20 ),
                                                      child: Image(
                                                        image: AssetImage(imgUrl),
                                                        height: 40.0,
                                                        width: 50.0,
                                                      ),
                                                    ),
                                                    const Text(
                                                        '行程',
                                                        style:TextStyle(
                                                            color:Color.fromRGBO(158, 146, 76, 1.0),
                                                            fontWeight: FontWeight.w900,
                                                            fontSize: 35.0,
                                                            fontFamily: 'SHS'
                                                        )
                                                    ),
                                                  ]
                                              ) ,
                                              content:new ShowSchedule(),

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
                                                        content_1=funcRoutine.content;
                                                        print("content111="+content_1);
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
                                      }
                                    }
                                    else if(index==2)//修改重复选项
                                    {
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title:Row(
                                                children:[
                                                  Container(
                                                    margin:const EdgeInsets.only(left: 40,right: 20 ),
                                                    child: Image(
                                                      image: AssetImage(imgUrl),
                                                      height: 60.0,
                                                      width: 50.0,
                                                    ),
                                                  ),
                                                  const Text(
                                                      '重复',
                                                      style:TextStyle(
                                                          color:Color.fromRGBO(158, 146, 76, 1.0),
                                                          fontWeight: FontWeight.w900,
                                                          fontSize: 35.0,
                                                          fontFamily: 'SHS'
                                                      )
                                                  ),
                                                ]
                                            ) ,
                                            content:new ShowRepeat(),

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
                                                    Navigator.of(context).pop();
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
                                    }
                                    else if(index==3)//修改铃声选项
                                    {
                                      {
                                        showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                              title:Row(
                                                  children:[
                                                    Container(
                                                      margin:const EdgeInsets.only(left: 40,right: 20 ),
                                                      child: Image(
                                                        image: AssetImage(imgUrl),
                                                        height: 60.0,
                                                        width: 50.0,
                                                      ),
                                                    ),
                                                    const Text(
                                                        '铃声',
                                                        style:TextStyle(
                                                            color:Color.fromRGBO(158, 146, 76, 1.0),
                                                            fontWeight: FontWeight.w900,
                                                            fontSize: 35.0,
                                                            fontFamily: 'SHS'
                                                        )
                                                    ),
                                                  ]
                                              ) ,
                                              content:new ShowRing(),

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
                                                      Navigator.of(context).pop();
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
                                      }
                                    }
                                  },
                                child: Container(
                                  width: MediaQuery.of(context).size.width *0.8,
                                  child:Text(
                                    setList[index],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color:Color.fromRGBO(0, 0, 0, 1.0),
                                        fontWeight: FontWeight.w900,
                                        fontSize: 35.0,
                                        fontFamily: 'SHS'
                                    )
                                ),
                                )
                              )

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
