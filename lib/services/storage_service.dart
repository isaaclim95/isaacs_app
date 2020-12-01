import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class StorageService {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  List<String> fileUrls = [];

  firebase_storage.Reference ref =
      firebase_storage.FirebaseStorage.instance.ref('/videos');

  Future<List<String>> listExample() async {
    firebase_storage.ListResult result = await ref.listAll();

    result.items.forEach((firebase_storage.Reference ref) {
      fileUrls.add(ref.fullPath);
      print('Found file: $ref');
    });

    return ([
      'https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_480_1_5MG.mp4'
    ]);
    // return fileUrls;
  }
}
