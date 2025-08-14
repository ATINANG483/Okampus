import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/chambre.dart';
import '../models/cours.dart';
import '../models/notification.dart';
import '../models/user.dart';

class ApiService {
  final String baseUrl = 'http://localhost:5000/api'; // ou ton IP backend

  Future<User> login(String email, String password) async {
    final res = await http.post(Uri.parse('$baseUrl/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}));
    if (res.statusCode == 200) {
      return User.fromJson(jsonDecode(res.body));
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<List<Chambre>> getChambres(String token) async {
    final res = await http.get(Uri.parse('$baseUrl/chambres'), headers: {'Authorization': 'Bearer $token'});
    final List data = jsonDecode(res.body);
    return data.map((json) => Chambre.fromJson(json)).toList();
  }

  Future<List<AppNotification>> getNotifications(String token) async {
    final res = await http.get(Uri.parse('$baseUrl/notifications'), headers: {'Authorization': 'Bearer $token'});
    final List data = jsonDecode(res.body);
    return data.map((json) => AppNotification.fromJson(json)).toList();
  }

  Future<List<Cours>> getCours(String token) async {
    final res = await http.get(Uri.parse('$baseUrl/cours'), headers: {'Authorization': 'Bearer $token'});
    final List data = jsonDecode(res.body);
    return data.map((json) => Cours.fromJson(json)).toList();
  }
}
