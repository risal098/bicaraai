import 'package:http/http.dart' as http;
import 'dart:convert';
class LeaderboardData{
  static int tempdefaultid=1005;
  static int? tempdefaultscores;
  static String? tempdefaultusernames;
  static int? tempdefaultuserposition;
  static List<int>? scores;
  static List<String>? usernames;
  static List<int>? userId;

  static Future<void>? getData() async{
    var response= await http.get(Uri.https("bicaraai1.risalahqz.repl.co","giveTop20"));
    scores=[];
    usernames=[];
    userId=[];
    var data=jsonDecode(response.body);
    
  //  print(data.length);
    for(int x=0;x<data.length;x++){
      scores!.add(data[x][2]);
      usernames!.add(data[x][1]);
      userId!.add(data[x][0]);
    //  print("x= ${x}  ${data[x]}");
    //  print("datax ");
    }
    response= await http.post(Uri.https("bicaraai1.risalahqz.repl.co","giveWhereAmI"),body:tempdefaultid.toString());
    data=jsonDecode(response.body);
tempdefaultscores=data[2];
tempdefaultusernames=data[1];
  tempdefaultuserposition=data[3];

  }





}