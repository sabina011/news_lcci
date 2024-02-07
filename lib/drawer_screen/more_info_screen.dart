import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import '../providers/userdata_providers.dart';

class MoreInfoScreen extends StatefulWidget {
  const MoreInfoScreen({Key? key}) : super(key: key);

  @override
  State<MoreInfoScreen> createState() => _MoreInfoScreenState();
}

class _MoreInfoScreenState extends State<MoreInfoScreen> {
  File? _image;
  late CameraController _cameraController;
  late List<CameraDescription> _cameras;
  final ImagePicker _imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    var status = await Permission.camera.request();
    if (status.isGranted) {
      _cameras = await availableCameras();
      _cameraController = CameraController(
        _cameras[0],
        ResolutionPreset.medium,
      );
      await _cameraController.initialize();
    } else {}
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery
        .of(context)
        .size;
    final userDataProvider = Provider.of<UserDataProvider>(context);
    final userData = userDataProvider.userData;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildProfileHeader(size),
                SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Text(
                        'Email:${userData?['email'] ?? 'N/A'}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Membership Number: ${userData?['membership_no'] ??
                            'N/A'}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                buildSaveButton(),
                const SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildProfileHeader(Size size) {
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.4,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Center(
                child: Text(
                  'Profile',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 5,),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 4,
                  ),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _showImageSourceDialog();
                      },
                      child:Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(75),
                        ),
                        child: _image != null
                            ? Image.file(
                          _image!,
                          fit: BoxFit.cover,
                        )
                            : Center(
                          child: Icon(
                            Icons.camera_alt,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                      ),

                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5,),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _showImageSourceDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose Image Source'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.camera),
                  title: Text('Take Photo'),
                  onTap: () {
                    Navigator.of(context).pop();
                    _takePhoto();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.photo_library),
                  title: Text('Choose from Gallery'),
                  onTap: () {
                    Navigator.of(context).pop();
                    _pickImage(ImageSource.gallery);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _takePhoto() async {
    final XFile? file = await _imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 800,
      maxHeight: 800,
    );
    if (file != null) {
      setState(() {
        _image = File(file.path);
      });
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final XFile? file = await _imagePicker.pickImage(
      source: source,
      maxWidth: 800,
      maxHeight: 800,
    );
    if (file != null) {
      setState(() {
        _image = File(file.path);
      });
    }
  }

  Widget buildSaveButton() {
    return Center(
      child: GestureDetector(
        onTap: () {

        },
        child: Container(
          width: 600,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: const Center(
            child: Text(
              'Change Password',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

}
