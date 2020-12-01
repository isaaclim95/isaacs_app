import 'package:isaacs_app/app/locator.dart';
import 'package:isaacs_app/services/storage_service.dart';
import 'package:stacked/stacked.dart';
import 'package:video_player/video_player.dart';
import 'package:webview_flutter/webview_flutter.dart';

class StorageExampleViewModel extends BaseViewModel {
  final StorageService _storageService = locator<StorageService>();
  WebViewController webViewcontroller;

  List<VideoPlayerController> controllers = [];
  bool isPlaying = false;

  StorageExampleViewModel() {
    initialise();
  }

  void play() {
    if (isPlaying) {
      controllers[0].pause();
      isPlaying = false;
    } else {
      controllers[0].play();
      isPlaying = true;
    }
  }

  void pause() {}

  Future<void> initialise() async {
    setBusy(true);
    print('initialising');
    // List<String> urls = await _storageService.listExample();
    // print(urls.length);
    // urls.forEach((element) {
    //   print(element);
    //   print('added controller');
    //   VideoPlayerController controller = VideoPlayerController.network(
    //       'https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_480_1_5MG.mp4');
    //   controller.initialize();
    //   controllers.add(controller);
    // });
    VideoPlayerController controller = VideoPlayerController.network(
        'https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_480_1_5MG.mp4');
    controller.initialize();
    controllers.add(controller);
    setBusy(false);
  }
}
