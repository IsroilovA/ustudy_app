import 'package:http/http.dart' as http;
import 'package:ustudy_app/data/models/course.dart';

class UstudyRepository{
  UstudyRepository();
  final _client = http.Client();

  Future<List<Course>> getCourses() async{
    
  }
}