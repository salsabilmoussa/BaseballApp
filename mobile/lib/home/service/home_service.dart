import 'dart:convert';
import 'package:baseball_cards_app/home/model/card.dart' as model;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomeService extends ChangeNotifier {
  final String? _url = dotenv.env['BASE_URL'];
  List<model.Card> cards = [];
  final TextEditingController nameController = TextEditingController();
  final TextEditingController playerController = TextEditingController();
  final TextEditingController teamController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  bool isAddDialog = true;

  HomeService() {
    getCards();
  }

  Future<Map<String, String>> getHeaders() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt_token');
    final headers = {
      'Content-Type': 'application/json',
    };
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    return headers;
  }

  void getCards() async {
    final url = Uri.parse('$_url/cards');
    final headers = await getHeaders();
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      List<dynamic> jsonCards = json.decode(response.body);

      cards = jsonCards.map((card) => model.Card.fromJson(card)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load cards');
    }
  }

  Future<model.Card> showCard(int? id) async {
    final url = Uri.parse('$_url/card/$id');
    final headers = await getHeaders();
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      notifyListeners();
      return model.Card.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load card');
    }
  }

  Future<void> addCard(model.Card card) async {
    final url = Uri.parse('$_url/card/new');
    final headers = await getHeaders();
    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(card.toJson()),
    );

    if (response.statusCode == 201) {
      getCards();
      notifyListeners();
    } else {
      throw Exception('Failed to add card: ${response.body}');
    }
  }

  Future<void> editCard(int? id, model.Card updatedCard) async {
    final url = Uri.parse('$_url/card/$id/edit');
    final headers = await getHeaders();
    final response = await http.put(
      url,
      headers: headers,
      body: jsonEncode(updatedCard.toJson()),
    );

    if (response.statusCode == 200) {
      notifyListeners();
      getCards();
    } else {
      throw Exception('Failed to edit card: ${response.body}');
    }
  }

  Future<void> deleteCard(int? id) async {
    final url = Uri.parse('$_url/card/$id');
    final headers = await getHeaders();
    final response = await http.delete(url, headers: headers);

    if (response.statusCode == 200) {
      getCards();
      notifyListeners();
    } else {
      throw Exception('Failed to delete card: ${response.body}');
    }
  }

  void clearControllers() {
    nameController.clear();
    playerController.clear();
    teamController.clear();
    yearController.clear();
    imageController.clear();
  }
}
