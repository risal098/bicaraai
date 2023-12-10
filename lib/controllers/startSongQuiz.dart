import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import '../screens/songsection.dart';
import '../screens/song_ans_page.dart';
import '../screens/song_ans_page2.dart';
import '../screens/song_ans_page3.dart';
import '../screens/songGrade.dart ';
import '../widgets/songlevel.dart';
class MyJABytesSource extends StreamAudioSource {
  final Uint8List? _buffer;

  MyJABytesSource(this._buffer) : super(tag: 'MyAudioSource');

  @override
  Future<StreamAudioResponse> request([int? start, int? end]) async {
    // Returning the stream audio response with the parameters
    return StreamAudioResponse(
      sourceLength: _buffer!.length,
      contentLength: (end ?? _buffer!.length) - (start ?? 0),
      offset: start ?? 0,
      stream: Stream.fromIterable([_buffer!.sublist(start ?? 0, end)]),
      contentType: 'audio/wav',
    );
  }
}


class StartSong{
  static int? statcode;
  static String? title;
  static String? singer;
  static String? imageLink;
  static int player1Receive=0;
  static int player2Receive=0;
  static int player3Receive=0;
  static Uint8List? forPlayer1;
  static Uint8List? forPlayer2;
  static Uint8List? forPlayer3;
  static AudioPlayer? player1;
  static AudioPlayer? player2;
  static AudioPlayer? player3;
  static String? lyric1;
  static String? lyric2;
  static String? lyric3;
  static String? userLyric1;
  static String? userLyric2;
  static String? userLyric3;
  static http.Response? response;
  static http.Response? response11;
  static http.Response? response12;
  static void makeNull(){
    StartSong.title=null;
    StartSong.singer=null;
    StartSong.imageLink=null;
    StartSong.forPlayer1=null;
    StartSong.forPlayer2=null;
    StartSong.forPlayer3=null;
    StartSong.player1=null;
    StartSong.player2=null;
    StartSong.player3=null;
    StartSong.lyric1=null;
    StartSong.lyric2=null;
    StartSong.lyric3=null;
    StartSong.userLyric1=null;
    StartSong.userLyric2=null;
    StartSong.userLyric3=null;
  }
  static void itemPrepare(){

    StartSong.lyric1="";
    StartSong.lyric2="";
    StartSong.lyric3="";
    StartSong.userLyric1="";
    StartSong.userLyric2="";
    StartSong.userLyric3="";
  }
  
  static Future<AudioPlayer> getAudio(Uint8List? bytes) async{
  var thePlayer=new AudioPlayer();
  await thePlayer.setAudioSource(MyJABytesSource(bytes));
  return thePlayer;
}

static Future<void> get1(getTitle,difficulty)async
{ response = await http.get(Uri.https('bicaraai12.risalahqz.repl.co', 'getAudio/${getTitle}&audio1&${difficulty}'));//cheovzvxbc
  print("one more 1");
    StartSong.forPlayer1=response!.bodyBytes;
    StartSong.player1=await getAudio(StartSong.forPlayer1);
    player1Receive=response!.statusCode;
}
static Future<void> get2(getTitle,difficulty)async
 {  response11 = await http.get(Uri.https('bicaraai12.risalahqz.repl.co', 'getAudio/${getTitle}&audio2&${difficulty}'));//cheovzvxbc
  print("one more 2");
   StartSong.forPlayer2=response11!.bodyBytes;
   StartSong.player2=await getAudio(StartSong.forPlayer2);
   player2Receive=response11!.statusCode;
}
static Future<void> get3(getTitle,difficulty)async
  { response12 = await http.get(Uri.https('bicaraai12.risalahqz.repl.co', 'getAudio/${getTitle}&audio3&${difficulty}'));//cheovzvxbc
  print("one more 3");
   StartSong.forPlayer3=response12!.bodyBytes;
    StartSong.player3=await getAudio(StartSong.forPlayer3);
    player3Receive=response12!.statusCode;
}
  static Future<int> getBlobData(String getTitle,String difficulty,String songName,String singer,String imageLink ) async {
  print("send 1");
  try{
  final response = await http.get(Uri.https('bicaraai12.risalahqz.repl.co', 'getAudio/${getTitle}&audio1&${difficulty}'));//cheovzvxbc
  print("one more 1");
  final response11 = await http.get(Uri.https('bicaraai12.risalahqz.repl.co', 'getAudio/${getTitle}&audio2&${difficulty}'));//cheovzvxbc
  print("one more 2");
  final response12 = await http.get(Uri.https('bicaraai12.risalahqz.repl.co', 'getAudio/${getTitle}&audio3&${difficulty}'));//cheovzvxbc
  print("one more 3");
  final response13=await http.get(Uri.https('bicaraai12.risalahqz.repl.co', 'getLyric/${getTitle}&${difficulty}'));
  print("receive all");
  if (response.statusCode == 200) {
    itemPrepare();
    StartSong.title=songName;
      StartSong.singer=singer;
      StartSong.imageLink=imageLink;
    StartSong.forPlayer1=response.bodyBytes;
    StartSong.forPlayer2=response11.bodyBytes;
    StartSong.forPlayer3=response12.bodyBytes;
    StartSong.player1=await getAudio(StartSong.forPlayer1);
    StartSong.player2=await getAudio(StartSong.forPlayer2);
    StartSong.player3=await getAudio(StartSong.forPlayer3);
    var temp= jsonDecode(response13.body);
    StartSong.lyric1=temp[0];
    StartSong.lyric2=temp[1];
    StartSong.lyric3=temp[2];
    print("lyric1: ${lyric1}");
    print("lyric2: ${lyric2}");
    print("lyric3: ${lyric3}");
    statcode=1;
   return 1;
  } else {
    statcode=-1;
    return -1;
    //throw Exception('Failed to load Blob data');
  }}catch(e){
    statcode=-1;
    return -1;
  }
}


  static Future<int> getBlobData2(String getTitle,String difficulty,String songName,String singer,String imageLink ) async {
  print("send 1");
  try{
      itemPrepare();
    StartSong.title=songName;
      StartSong.singer=singer;
      StartSong.imageLink=imageLink;
      print("lyric jaidi");
    final response13=await http.get(Uri.https('bicaraai12.risalahqz.repl.co', 'getLyric/${getTitle}&${difficulty}'));
    print(response13.statusCode);
    if(response13.statusCode!=200){
      player1Receive=404;
    }
    var temp= jsonDecode(response13.body);
    
    StartSong.lyric1=temp[0];
    StartSong.lyric2=temp[1];
    StartSong.lyric3=temp[2];
    print("lyric jaidi end");
     print("lyric1: ${lyric1}");
    print("lyric2: ${lyric2}");
    print("lyric3: ${lyric3}");
    get1(getTitle,difficulty);
    get2(getTitle,difficulty);
    get3(getTitle,difficulty);
/*
   response = await http.get(Uri.https('bicaraai12.risalahqz.repl.co', 'getAudio/${getTitle}&audio1&${difficulty}'));//cheovzvxbc
  print("one more 1");
    StartSong.forPlayer1=response!.bodyBytes;
    StartSong.player1=await getAudio(StartSong.forPlayer1);
    player1Receive=response!.statusCode;

   response11 = await http.get(Uri.https('bicaraai12.risalahqz.repl.co', 'getAudio/${getTitle}&audio2&${difficulty}'));//cheovzvxbc
  print("one more 2");
   StartSong.forPlayer2=response11!.bodyBytes;
   StartSong.player2=await getAudio(StartSong.forPlayer2);
   player2Receive=response11!.statusCode;

   response12 = await http.get(Uri.https('bicaraai12.risalahqz.repl.co', 'getAudio/${getTitle}&audio3&${difficulty}'));//cheovzvxbc
  print("one more 3");
   StartSong.forPlayer3=response12!.bodyBytes;
    StartSong.player3=await getAudio(StartSong.forPlayer3);
    player3Receive=response12!.statusCode;
*/
  print("receive all");
  /*
  if (response.statusCode == 200) {
  
  
   
   
    
   
   return 1;
  } else {
    return -1;
    //throw Exception('Failed to load Blob data');
  }*/
  return 1;
  }catch(e){
    return -1;
  }
}
static Future<void> getStatus1(BuildContext context) async{
  int time=0;
  print(player1Receive);
  if(player1Receive!=200){
   Timer.periodic(Duration(milliseconds: 100), (Timer timer) { 
    time+=1;
    if(time==290 || (player1Receive!=200 && player1Receive!=0)){
      timer.cancel();
      print(time);
      Level.level = "Easy";
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){return SongSection();}));
    }
    else if(player1Receive==200){
      timer.cancel();
      print("ans1");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){return SongAns();}));

    }
  });}else{
    print("ans11");
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){return SongAns();}));
  }
}
static Future<void> getStatus2(BuildContext context) async{
  int time=0;
  if(player2Receive!=200){
   Timer.periodic(Duration(milliseconds: 100), (Timer timer) { 
    time+=1;
    if(time==290 || ( player2Receive!=200&& player2Receive!=0)){
      timer.cancel();
      Level.level = "Easy";
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){return SongSection();}));
    }
    else if(player2Receive==200){
      timer.cancel();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){return SongAns2();}));

    }
  });}else{
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){return SongAns2();}));
  }
}


static Future<void> getStatus3(BuildContext context) async{
  int time=0;
  if(player3Receive!=200){
   Timer.periodic(Duration(milliseconds: 100), (Timer timer) { 
    time+=1;
    if(time==290 || (player3Receive!=200&& player3Receive!=0)){
      timer.cancel();
      Level.level = "Easy";
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){return SongSection();}));
    }
    else if(player3Receive==200){
      timer.cancel();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){return SongAns3();}));

    }
  });}else{
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){return SongAns3();}));
  }
}

}