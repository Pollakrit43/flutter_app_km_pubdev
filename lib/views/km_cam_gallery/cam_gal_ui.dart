import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CamGalUI extends StatefulWidget {
  const CamGalUI({Key? key}) : super(key: key);

  @override
  _CamGalUIState createState() => _CamGalUIState();
}

class _CamGalUIState extends State<CamGalUI> {
// สร้างตัวเเปรเก็บรูปที่ได้จากการเลือก
  File? imageSelectedUse; //อย่าลืม import dart.io;
// เมธอดเปิดกล้อง
  Future selecetImgFromCamera() async {
    final imageSelect = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    //ตรวจสอบว่าเลือกรูปหรือไม่
    if (imageSelect == null) {
      return;
    }
    //กรณีเลือกรูป ให้กำหนดรูปให้กับตัวเเปรที่สร้างไว้ข้างบนเพื่อเอาไปใช้มนจุดอื่นๆ
    final imageSelectPath = File(imageSelect.path);
    setState(() {
      imageSelectedUse = imageSelectPath;
    });
  }

// เมธอดเปิดแกลอรี่
  Future selectImgFromgallery() async {
    final imageSelect = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    //ตรวจสอบว่าเลือกรูปหรือไม่
    if (imageSelect == null) {
      return;
    }
    //กรณีเลือกรูป ให้กำหนดรูปให้กับตัวเเปรที่สร้างไว้ข้างบนเพื่อเอาไปใช้มนจุดอื่นๆ
    final imageSelectPath = File(imageSelect.path);
    setState(() {
      imageSelectedUse = imageSelectPath;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'CamGal KM',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              CircleAvatar(
                radius: 100,
                backgroundColor: Colors.redAccent,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    90,
                  ),
                  child: imageSelectedUse == null
                      ? Image.asset(
                          'assets/images/logo.png',
                          width: 180,
                          height: 180,
                          fit: BoxFit.cover,
                        )
                      : Image.file(
                          File(
                            imageSelectedUse!.path,
                          ),
                          width: 180,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      selecetImgFromCamera();
                    },
                    icon: Icon(
                      Icons.camera_alt,
                    ),
                    label: Text(
                      'Camera',
                    ),
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      selectImgFromgallery();
                    },
                    icon: Icon(
                      Icons.camera,
                    ),
                    label: Text(
                      'Camera',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
