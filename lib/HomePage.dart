import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ipfs_demo/NFT.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkaWQ6ZXRocjoweDRBRWNmNzlEQzUyNUM4Q0IwQUJDM2E3OTMzQ0E4Rjg4RmQ2RUZDMTgiLCJpc3MiOiJuZnQtc3RvcmFnZSIsImlhdCI6MTY3Mjg0MTI2MTA2MSwibmFtZSI6InRlc3QifQ.FmrlCdK0k7a46g44N5KzBRqdcw3EQ5Eq0P_8mo6ft54";
  final String baseUrl = "https://api.nft.storage/upload";
  XFile? _image;

  Future _imgFromGallery() async {
    final XFile? image = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  Future upload({XFile? imageFile}) async {
    if (imageFile != null) {
      final formData = FormData.fromMap({});
      formData.files.add(MapEntry(
          "file", await MultipartFile.fromFile(imageFile.path.toString())));
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      final Response response = await dio.post(baseUrl, data: formData);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: const Text(
          'Flutter Ipfs',
          style: TextStyle(
            letterSpacing: 1.2,
            color: Colors.black,
            fontSize: 19,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              height: size.height * 0.3,
              width: size.width * 0.6,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
                // borderRadius: BorderRadius.circular(80),
              ),
              child: _image != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.file(
                        File(_image!.path),
                        fit: BoxFit.cover,
                      ),
                    )
                  : Image.network(
                      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png",
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () async {
                _imgFromGallery();
              },
              child: const SizedBox(
                height: 50,
                child: Center(
                  child: Text(
                    'Select Image',
                    style: TextStyle(fontSize: 18, fontFamily: 'Brand-Bold'),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () async {
                print(_image!.path);

                upload(imageFile: _image);
              },
              child: const SizedBox(
                height: 50,
                child: Center(
                  child: Text(
                    'Upload Image',
                    style: TextStyle(fontSize: 18, fontFamily: 'Brand-Bold'),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () async {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => NFT()));
              },
              child: const SizedBox(
                height: 50,
                child: Center(
                  child: Text(
                    'Show Image',
                    style: TextStyle(fontSize: 18, fontFamily: 'Brand-Bold'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
