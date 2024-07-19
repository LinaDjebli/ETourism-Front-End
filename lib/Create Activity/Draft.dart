import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

String generateDraftId() {
  var uuid = Uuid();
  return uuid.v4();
}
Future<void> addDraftId(String draftId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> draftIds = prefs.getStringList('draft_ids') ?? [];
  draftIds.add(draftId);
  await prefs.setStringList('draft_ids', draftIds);
}

Future<List<String>> getDraftIds() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getStringList('draft_ids') ?? [];
}

Future<Map<String, dynamic>> loadDraft(String draftId, List<String> keys) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Map<String, dynamic> data = {};
  for (String key in keys) {
    data[key] = prefs.getString('draft_${draftId}_$key') ?? '';
  }
  return data;
}
Future<void> saveDraft(String draftId, Map<String, dynamic> newData) async {
  final prefs = await SharedPreferences.getInstance();
  String? existingDraftString = prefs.getString(draftId);
  Map<String, dynamic> existingDraft = {};

  if (existingDraftString != null) {
    existingDraft = jsonDecode(existingDraftString);
  }

  existingDraft.addAll(newData);

  await prefs.setString(draftId, jsonEncode(existingDraft));
}
Future<Map<String, dynamic>> loadFullDraft(String draftId) async {
  final prefs = await SharedPreferences.getInstance();
  String? draftString = prefs.getString(draftId);

  if (draftString != null) {
    return jsonDecode(draftString);
  }
  return {};
}