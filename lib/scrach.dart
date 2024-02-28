import 'dart:async';
import 'dart:io';

void main(){
  performTasks();
}


void performTasks() async{
  task1();
  task2();
  String? task3Data = await task3();
  task4(task3Data);

  String? task5Data = await task5();
  task4(task5Data);
}

void task1(){
  String result = 'task 1 data';
  print('Task 1 complete');
}

void task2(){
  Duration threeSeconds = Duration(seconds: 3);
  // sleep(threeSeconds);

  Future.delayed(threeSeconds,(){
    String result = 'task 2 data';
    print('Task 2 complete');
  });

}


String? task3(){
  String? result;

  Duration threeSeconds = Duration(seconds: 3);
  // sleep(threeSeconds);

  Future.delayed(threeSeconds,(){
    result = 'task 3 data';
    print('Task 3 complete');

  });

  return result;
}


void task4(String? task3Data){
  String result = 'task 3 data';
  print('Task 3 complete $task3Data');
}


Future<String?> task5() async{
  String? result;

  Duration threeSeconds = Duration(seconds: 3);
  // sleep(threeSeconds);

  await Future.delayed(threeSeconds,(){
    result = 'task 5 data';
    print('Task 5 complete');

  });

  return result;
}


void task6(String? task5Data){
  String result = 'task 3 data';
  print('Task 3 complete $task5Data');
}