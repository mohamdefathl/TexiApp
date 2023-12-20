import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class CustomPanelController extends GetxController {
  final double initFabHeight = 120.0;
  RxDouble? fabHeight = 0.0.obs;
  double panelHeightOpen = 0.0;
  final double panelHeightClosed = 95.0;
  
  final panelController = PanelController();
  @override
  void onInit() {
    fabHeight!.value = initFabHeight;
    super.onInit();
  }

  updateFabHeight(double pos) {
    fabHeight!.value =
        pos * (panelHeightOpen - panelHeightClosed) + initFabHeight;
  }
}
