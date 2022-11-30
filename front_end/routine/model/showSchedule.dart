import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zhaoxiban/pages/routine/provider/routineProvider.dart';
import 'package:zhaoxiban/pages/routine/model/routine_addIterm.dart';


class ShowSchedule extends StatefulWidget {
  @override
  createState() {
    return  ShowScheduleState();
  }
}

class ShowScheduleState extends State<ShowSchedule> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height *0.1,
        width: MediaQuery.of(context).size.width *0.7,
        child: Consumer<RoutineList>(
            builder: (context, funcRoutine, child) {
              return TextField(
                style:const TextStyle(
                    color:Color.fromRGBO(0,0, 0, 1.0),
                    fontWeight: FontWeight.w900,
                    fontSize: 30.0,
                    fontFamily: 'SHS'),
                decoration:const InputDecoration(
                  hintText: "请输入行程信息",
                  hintStyle:TextStyle(
                      color:Color.fromRGBO(114, 114, 114, 1.0),
                      fontWeight: FontWeight.w900,
                      fontSize: 30.0,
                      fontFamily: 'SHS'),
                  // 未获得焦点
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      ///用来配置边框的样式
                      borderSide: BorderSide(
                        ///设置边框的颜色
                        color: Colors.grey,
                        ///设置边框的粗细
                        width: 3.0,
                      ),
                  ),
                  //获得焦点
                  focusedBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    ///用来配置边框的样式
                    borderSide: BorderSide(
                      ///设置边框的颜色
                      color: Colors.green,
                      ///设置边框的粗细
                      width: 3.0,
                    ),
                  ),
                ),
                onChanged: (text) {
                  funcRoutine.getContent(text);
                },

              );

            }
        )
    );

  }
}