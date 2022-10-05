import 'dart:typed_data';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;
//import 'package:image_picker/image_picker.dart';
import 'package:cross_file/cross_file.dart';
import 'package:path_provider/path_provider.dart';

downloadFile(String url, {String? filename}) async {
  var httpClient = http.Client();
  var request = new http.Request('GET', Uri.parse(url));
  var response = httpClient.send(request);
  String dir = (await getApplicationDocumentsDirectory()).path;

  List<List<int>> chunks = [];
  int downloaded = 0;

  response.asStream().listen((http.StreamedResponse r) {
    r.stream.listen((List<int> chunk) {
      // Display percentage of completion
      //print('downloadPercentage: ${downloaded / r.contentLength * 100}');

      chunks.add(chunk);
      downloaded += chunk.length;
    }, onDone: () async {
      // Display percentage of completion
      //print('downloadPercentage: ${downloaded / r.contentLength * 100}');

      // Save the file
      File file = new File('$dir/$filename');
      final Uint8List bytes = Uint8List(r.contentLength!);
      int offset = 0;
      for (List<int> chunk in chunks) {
        bytes.setRange(offset, offset + chunk.length, chunk);
        offset += chunk.length;
      }
      await file.writeAsBytes(bytes);
      return;
    });
  });
}

downloadFileWeb(String url, String fileName) async {
  final httpsReference = FirebaseStorage.instance.refFromURL(url);

  try {
    const oneMegabyte = 1024 * 1024;
    final Uint8List? data = await httpsReference.getData(oneMegabyte);
    // Data for "images/island.jpg" is returned, use this as needed.
    XFile.fromData(data!,
            mimeType: "application/octet-stream", name: fileName + ".pdf")
        .saveTo("C:/");
  } on FirebaseException catch (e) {
    // Handle any errors.
  }
}
