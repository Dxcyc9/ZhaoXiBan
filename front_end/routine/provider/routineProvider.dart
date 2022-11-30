import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zhaoxiban/pages/routine/model/routineIterm.dart';

class RoutineList with ChangeNotifier {
  List<String> schedule=[];//存有选中的每日行程
  List<String> delete=[];//刪除
  String hour="00";
  String minute="00";
  bool isam=false;
  String content="设置行程";
  String repeat="每天";
  String ring="默认";
  synchronize() async {
    final data = await SharedPreferences.getInstance();

      schedule = data.getStringList('schedule');//读数据
      //delete = data.getStringList('delete');//读数据

  }

  void getSchedule(String item)async
  {
    schedule.add(item);
    print(schedule);
    notifyListeners();
    final data = await SharedPreferences.getInstance();//存入磁盘
    data.setStringList('schedule', schedule);
  }
  void getDelete(String item)async
  {
    delete.add(item);
    print(delete);
    notifyListeners();
    //final data = await SharedPreferences.getInstance();//存入磁盘
   // data.setStringList('delete', delete);
  }
  void getAm(bool item)async
  {
    isam=item;
    notifyListeners();
    //final data = await SharedPreferences.getInstance();//存入磁盘
    //data.setStringList('schedule', schedule);
  }
  void getHour(String item)async
  {
    hour=item;
    notifyListeners();
    //final data = await SharedPreferences.getInstance();//存入磁盘
    //data.setStringList('schedule', schedule);
  }
  void getMinute(String item)async
  {
    minute=item;
    notifyListeners();
    //final data = await SharedPreferences.getInstance();//存入磁盘
    //data.setStringList('schedule', schedule);
  }
  void getContent(String item)async
  {
    content=item;
    notifyListeners();
    //final data = await SharedPreferences.getInstance();//存入磁盘
    //data.setStringList('schedule', schedule);
  }
  void getRepeat(String item)async
  {
    repeat=item;
    notifyListeners();
    //final data = await SharedPreferences.getInstance();//存入磁盘
    //data.setStringList('schedule', schedule);
  }
  void getRing(String item)async
  {
    ring=item;
    notifyListeners();
    //final data = await SharedPreferences.getInstance();//存入磁盘
    //data.setStringList('schedule', schedule);
  }
  void moveSchedule(String item)async
  {
    schedule.remove(item);
    print(schedule);
    notifyListeners();
    final data = await SharedPreferences.getInstance();//存入磁盘
    data.setStringList('schedule', schedule);
  }
}
