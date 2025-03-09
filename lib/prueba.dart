import 'dart:convert';
import 'dart:io';

void main() async {
  final file = File('lib/assets/userdataonsume.json');
  final contents = await file.readAsString();
  final data = jsonDecode(contents);
  print(data);
}