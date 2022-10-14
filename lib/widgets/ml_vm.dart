import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:path_provider/path_provider.dart' as sysPaths;
// import 'package:path/path.dart' as path;

//start ms-settings:developers

class MlVM extends StatefulWidget {
  final Function onSelectImage;

  MlVM(this.onSelectImage);

  @override
  State<MlVM> createState() => _MlVMState();
}

class _MlVMState extends State<MlVM> {
  File? _storedImage;
  String imageLabel = "";

  Future<void> _takePicture(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: source);
    final imgPath = image?.path;

    setState(() {
      _storedImage = File(imgPath!);
    });

    final appDir = await sysPaths.getApplicationDocumentsDirectory();
    final savedImage = await _storedImage?.copy('${appDir.path}/$imgPath');
    widget.onSelectImage(savedImage);
  }

  Future<void> getImageLabels(File image) async {
    final inputImage = InputImage.fromFile(image);
    ImageLabeler imageLabeler = ImageLabeler(options: ImageLabelerOptions(confidenceThreshold: 0.6));
    List<ImageLabel> labels = await imageLabeler.processImage(inputImage);

    StringBuffer sb = StringBuffer();

    for (ImageLabel label in labels) {
      final String lblText = label.label;
      final double confidence = label.confidence;
      sb.write(lblText);
      sb.write(" : ");
      sb.write((confidence * 100).toStringAsFixed(2));
      sb.write("%\n");
    }

    imageLabeler.close();
    imageLabel = sb.toString();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
            Container(
              width: 350,
              height: 350,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
              ),
              // ignore: sort_child_properties_last
              child: _storedImage != null
                  ? Image.file(
                      _storedImage!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    )
                  : const Text(
                      'No image',
                      textAlign: TextAlign.center,
                    ),
              alignment: Alignment.center,
            ),
          const SizedBox(
            height: 20,
          ),
          Text(
            imageLabel,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: () => _takePicture(ImageSource.gallery),
                icon: const Icon(Icons.image),
                label: const Text('Open Gallery'),
              ),
              TextButton.icon(
                onPressed: () => _takePicture(ImageSource.camera),
                icon: const Icon(Icons.camera),
                label: const Text('Take Picture'),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Column(
            children: [
              ElevatedButton.icon(
                onPressed: () => getImageLabels(_storedImage!),
                icon: const Icon(Icons.add),
                label: const Text('Detect'),
                style: ElevatedButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  elevation: 0,
                  fixedSize: const Size(
                    200,
                    60,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
