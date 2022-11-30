import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zhaoxiban/pages/routine/provider/routineProvider.dart';
import 'package:zhaoxiban/pages/routine/model/routine_addIterm.dart';

List<String>customData=["星期一","星期二","星期三","星期四","星期五","星期六","星期日"];
Map isSelect={
  "星期一":[true],
  "星期二":[false],
  "星期三":[false],
  "星期四":[false],
  "星期五":[false],
  "星期六":[false],
  "星期日":[false],
};

class CustomRepeat extends StatefulWidget {
  @override
  createState() {
    return  CustomRepeatState();
  }
}

class CustomRepeatState extends State<CustomRepeat> {
  @override
  Widget build(BuildContext context) {
    return  Container(
        height: MediaQuery.of(context).size.height *0.3,
        width: MediaQuery.of(context).size.width *0.7,
        child: Consumer<RoutineList>(
            builder: (context, funcRoutine, child) {
              // sampleData.forEach((element) => element.isSelected = false);
              return ListView.builder(
                itemCount: customData.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(

                    //highlightColor: Colors.red,
                    splashColor: Color.fromRGBO(236, 233, 233, 1.0),

                    onTap: () {
                      setState(() {
                        isSelect[customData[index]][0] = !isSelect[customData[index]][0];
                      });
                    },
                    child: Container(
                      margin:const EdgeInsets.only(left: 30.0,top:20.0,right:30.0 ),
                      alignment: Alignment.center,
                      child:  Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Container(//单选按钮
                            margin:  EdgeInsets.only(bottom: 10.0),
                            height: 45.0,
                            width: 45.0,
                            child: Center(
                              child:  Text("✔",
                                  style:  TextStyle(
                                      color:
                                      isSelect[customData[index]][0] ? Colors.white : Colors.transparent,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 25.0,
                                      fontFamily: 'weird'
                                  )),
                            ),
                            decoration:  BoxDecoration(
                              color: isSelect[customData[index]][0]
                                  ?  Color.fromRGBO(65, 178, 0, 1.0)
                                  : Colors.transparent,
                              border:  Border.all(
                                  width: 3.0,
                                  color: isSelect[customData[index]][0]
                                      ? Color.fromRGBO(65, 178, 0, 1.0)
                                      : Color.fromRGBO(196, 196, 196, 1)),
                              borderRadius: const BorderRadius.all(const Radius.circular(50.0)),
                            ),
                          ),
                          Container(//方言文字
                            margin:  EdgeInsets.only(left: 20.0,bottom: 10.0),
                            child: Text(
                                customData[index],
                                style: const TextStyle(
                                    color:Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30.0,
                                    fontFamily: 'SHS')
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }
        ));

  }
}
