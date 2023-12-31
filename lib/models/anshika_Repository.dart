import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:workshala/models/anshika_datamodelProfile.dart';
import 'package:workshala/models/anshika_datamodel_jobs.dart';


class JobsRepository {


  
  Future<List<JobsApiModel>> FetchJobsapi() async {
    String url = "https://workshala.onrender.com/jobs";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<JobsApiModel> jobsList =
          body.map((job) => JobsApiModel.fromJson(job)).toList();

      return jobsList;
    }
    throw Exception('Error');
  }
}

  // Future<UserDetailModel> Fetchprofileapi(String authToken) async {
    
   // String url = "https://workshala.onrender.com/profile";

   // final response = await http.get(Uri.parse(url),
   // headers: {'Authorization': 'Bearer $authToken'},
    //);

    //if (response.statusCode == 200) {
      //final body = jsonDecode(response.body);
     // return UserDetailModel.fromJson(body);
    //}
    //throw Exception('Error');
  //}


