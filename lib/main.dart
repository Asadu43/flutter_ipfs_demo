import 'package:flutter/material.dart';
import 'package:flutter_ipfs/flutter_ipfs.dart';

import 'package:flutter_ipfs/src/service/file_picker.dart';
import 'package:flutter_ipfs/src/service/image_picker.dart';
import 'package:flutter_ipfs/src/service/video_picker.dart';
import 'package:flutter_ipfs_demo/HomePage.dart';
import 'package:ipfs_client_flutter/ipfs_client_flutter.dart';
import 'package:ipfs_http_rpc/ipfs.dart';

void main() {
  runApp(const MyApp());
}

// ignore_for_file: deprecated_member_use

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String baseUrl = "https://api.nft.storage";
    // FlutterIpfs ipfs = FlutterIpfs();

    // Ipfs ipfs = Ipfs(url: "h/ttp://10.0.2.2:8080/api/v0");
    IpfsClient ipfsClient = IpfsClient(url: "https://car.ipfs.io");
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
