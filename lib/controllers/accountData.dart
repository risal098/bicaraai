import 'package:http/http.dart' as http;
import 'dart:convert';
class AccountData{
  //basic accound data
  static int? isPrem;
  static String? username;
  static int? userId;
  static String? email;
  static int? permissionStatus;
  static String? deadlinePermission;
  static int playedAudioToday=0;

  static int state=1; //when changed
  static int sendingScoreState=0; 
  //statistic data;
  static Map<String,dynamic>? weeklyStat;

  static int? weeklyProgress;
  static int? weeklyTarget;

  static int? points;
  static int? activeDays;
  static int? activeDaystreaks;
  static int? totalReplay;
  static int? playedSongs;
  static int? playedIelts;
  static int? weeklyProgresPercentage;
  
static Future<void> getData()async{
  var    response= await http.post(Uri.https("bicaraai12.risalahqz.repl.co","getMyData"),
                  body:AccountData.userId.toString());
                  var data=jsonDecode(response.body);
                  
                  AccountData.weeklyTarget=data[0];
                  AccountData.weeklyProgress=data[1];
                  AccountData.weeklyStat=jsonDecode(data[2]);
  
                  AccountData.weeklyProgresPercentage=(((AccountData.weeklyProgress!/AccountData.weeklyTarget!)*100).round());
                  if(AccountData.weeklyProgresPercentage!>100){
                    AccountData.weeklyProgresPercentage=100;
                  }
                  AccountData.activeDays=data[3];
                AccountData.activeDaystreaks=data[4];
                    AccountData.points=data[5];
                    AccountData.playedSongs=data[6];
                AccountData.playedIelts=data[7];
                AccountData.totalReplay=data[8];
                 AccountData.state=0;
}
  
}