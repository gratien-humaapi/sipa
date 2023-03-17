import 'dart:io';
import 'package:path_provider/path_provider.dart';

String allScores = '';

class ScoreStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    print(directory.path);
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/score.txt');
  }

  Future readCounter() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();
      print('Afficher  $contents');

      return contents;
    } catch (e) {
      print('error: $e');
      return '';
    }
  }

  Future<File> writeCounter(scores) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$scores');
  }
}
