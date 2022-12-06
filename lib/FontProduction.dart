import "dart:io";
import "package:flutter/material.dart";

import "package:image/image.dart" hide Image, Color;
import "package:path_provider/path_provider.dart";
import "package:camera/camera.dart";
import "package:provider/provider.dart";

import "PathProvider.dart";
import "PhotoCheck.dart";

class FontProduction extends StatefulWidget {
  const FontProduction({Key? key}) : super(key: key);

  @override
  State<FontProduction> createState() => _FontProductionState();
}

class _FontProductionState extends State<FontProduction> {
  bool _cameraInitialized = false;
  late CameraController _cameraController;
  late PathProvider _pathProvider;

  @override
  void initState() {
    // 화면에 처음 진입할 때 카메라 사용을 준비 하도록 합니다.
    super.initState();
    readyToCamera();
  }

  @override
  void dispose() {
    //화면에서 벗어날 때 카메라 제어기를 위해 OS에게 할당 받은 리소스를 정리 합니다.
    _cameraController.dispose();
    super.dispose();
  }

  void readyToCamera() async {
    // 사용할 수 있는 카메라 목록을 OS로부터 받아 옵니다.
    final cameras = await availableCameras();
    if (cameras.isEmpty) {
      print("카메라를 찾지 못했습니다.");
      return;
    }

    late CameraDescription backCamera;
    for (var camera in cameras) {
      if (camera.lensDirection == CameraLensDirection.back) {
        backCamera = camera;
        break;
      }
    }
    _cameraController = CameraController(
        backCamera, ResolutionPreset.veryHigh // 가장 높은 해상도의 기능을 쓸 수 있도록 합니다.
        );
    _cameraController.initialize().then((value) {
      // 카메라 준비가 끝나면 카메라 미리보기를 보여주기 위해 앱 화면을 다시 그립니다.
      setState(() => _cameraInitialized = true);
    });
  }

  preview() {
    return _cameraInitialized
        ? Container(
            width: 350,
            height: 250,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.blue),
                borderRadius: BorderRadius.circular(20)),
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipRect(
                child: Transform.scale(
                  scale: 2.5,
                  child: Center(
                    child: CameraPreview(_cameraController),
                  ),
                ),
              ),
            ),
          )
        : Center(
            child: CircularProgressIndicator(
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.grey)));
  }

  @override
  build(BuildContext context) {
    _pathProvider = Provider.of<PathProvider>(context);
    return Column(
      children: [
        SizedBox(height: 25),
        Center(
            child: Text(
          "자신만의 폰트를 제작해보세요",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        )),
        Center(child: Text("문장을 따라 작성한 후 사진을 찍으면 폰트가 형성됩니다.")),
        SizedBox(height: 25),
        Container(
          height: 150,
          width: 350,
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.blue),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: Image.asset(
            "assets/모란.JPG",
          ),
        ),
        SizedBox(height: 25),
        preview(),
        SizedBox(height: 25),
        ElevatedButton(
          onPressed: () async {
            // try / catch 블럭에서 사진을 촬영합니다. 만약 뭔가 잘못된다면 에러에
            // 대응할 수 있습니다.
            try {
              final image = await _cameraController.takePicture();
              _pathProvider.setTemporaryDirectory((await getTemporaryDirectory()).path);
              _pathProvider.setImagePath(image.path);

              // 이미지 크롭
              File("${_pathProvider.temporaryDirectory}/crop.png").writeAsBytesSync(encodePng(copyCrop(
                  decodeJpg(File(_pathProvider.imagePath).readAsBytesSync())!,
                  0,
                  580,
                  1080,
                  770)));

              if (!mounted) return;

              await Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => PhotoCheck()),
              );
            } catch (e) {
              // 만약 에러가 발생하면, 콘솔에 에러 로그를 남깁니다.
              print(e);
            }
          },
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(
              fontFamily: "milasiancirca",
              color: Colors.white,
              fontSize: 20,
              fontStyle: FontStyle.normal,
            ),
            minimumSize: Size(MediaQuery.of(context).size.width - 50, 50),
            maximumSize: Size(MediaQuery.of(context).size.width - 50, 50),
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.add_a_photo), Text(" 촬영")]),
        ),
      ],
    );
  }
}
