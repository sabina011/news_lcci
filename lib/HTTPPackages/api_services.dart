import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/administativeteam_model.dart';
import '../model/events_models.dart';
import '../model/local_products_models.dart';
import '../model/member_event.dart';
import '../model/member_list_model.dart';
import '../model/news_model.dart';
import '../model/notice_model.dart';
import '../model/organization_member_models.dart';
import '../model/past_presidents_models.dart';
import '../model/site_model.dart';


const String base_url = "https://lekhnathcci.org.np/api";



class ApiService {
  final String baseUrl;
  ApiService(this.baseUrl);

  Future<ApiResponse> fetchNews(int page) async {
    final response = await http.get(Uri.parse('$base_url/news?page=$page'));

    if (response.statusCode == 200) {
      return ApiResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load news data');
    }
  }


  Future<NoticeResponse> fetchNotice() async {
    try {
      final response = await http.get(Uri.parse('$base_url/notice/1'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = json.decode(response.body);
        return NoticeResponse.fromJson(responseBody);
      } else {
        throw Exception('Failed to load notice');
      }
    } catch (error) {
      throw Exception('Error occurred: $error');
    }
  }


  Future<AdministrativeResponse> fetchAdministrative() async {
    try {
      final response = await http.get(Uri.parse('$base_url/teams/administrative team'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = json.decode(response.body);
        return AdministrativeResponse.fromJson(responseBody);
      } else {
        throw Exception('Failed to load notice');
      }
    } catch (error) {
      throw Exception('Error occurred: $error');
    }
  }


  Future<MemberResponse> fetchMembers() async {
    final response = await http.get(Uri.parse('$base_url/teams/member list'));
    if (response.statusCode == 200) {
      return MemberResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load events data');
    }
  }


  Future<EventsData> fetchEvent() async {
    final response = await http.get(Uri.parse('$base_url/events/member/1'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      print(jsonData['data']);
      return EventsData.fromJson(jsonData['data']);
    } else {
      throw Exception('Failed to load events');
    }
  }


  Future<EventResponse> fetchEvents(int page) async {
    final response = await http.get(Uri.parse('$base_url/events?page=$page'));
    if (response.statusCode == 200) {
      return EventResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load events data');
    }
  }

  Future<ApiResponses> fetchSites(int page) async {
    final response = await http.get(Uri.parse('$base_url/local/sites'));
    if (response.statusCode == 200) {
      return ApiResponses.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load sites data');
    }
  }

  Future<ProductModel?> fetchProducts() async {
    final response = await http.get(Uri.parse('$base_url/local/products'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = json.decode(response.body);
      final List<dynamic> productsData = responseBody['data'];
      List<ProductModel> products = productsData.map((data) {
        return ProductModel.fromJson(data);
      }).toList();
    } else {
      throw Exception('Failed to load products data');
    }
    return null;
  }


  Future<PresidentsResponse> fetchPastPresidents(int page) async {
    final response = await http.get(

        Uri.parse('$base_url/teams/Past Presidents?page=$page'));
    //print('Response Body: ${response.body}');
    if (response.statusCode == 200) {
      return PresidentsResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load past presidents data');
    }
  }


  Future<OrganizationalResponse> fetchOrganizationalMembers(int page) async {
    final response = await http.get(
        Uri.parse('$base_url/teams/Organizational Team?page=$page'));
    if (response.statusCode == 200) {
      return OrganizationalResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load past presidents data');
    }
  }


  Future<Map<String, dynamic>> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$base_url/member/login'),
      body: {
        'username': username,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to login');
    }
  }



}


