import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ipfs_demo/api_response/GetApiResponse.dart';

class NFT extends StatefulWidget {
  const NFT({Key? key}) : super(key: key);

  @override
  State<NFT> createState() => _NFTState();
}

class _NFTState extends State<NFT> {
  final String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkaWQ6ZXRocjoweDRBRWNmNzlEQzUyNUM4Q0IwQUJDM2E3OTMzQ0E4Rjg4RmQ2RUZDMTgiLCJpc3MiOiJuZnQtc3RvcmFnZSIsImlhdCI6MTY3Mjg0MTI2MTA2MSwibmFtZSI6InRlc3QifQ.FmrlCdK0k7a46g44N5KzBRqdcw3EQ5Eq0P_8mo6ft54";
  final String baseUrl = "https://api.nft.storage/";

  Future<GetApiResponse> getData() async {
    Dio dio = Dio();
    dio.options.headers["Authorization"] = "Bearer $token";
    final Response response = await dio.get(baseUrl);
    return GetApiResponse.fromJson(response.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NFT"),
      ),
      body: FutureBuilder<GetApiResponse>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.data?.value != null) {
            for (var i = 0; i < snapshot.data!.value!.length; i++) {
              return ListView.builder(
                itemCount: snapshot.data!.value!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.network(
                        "https://${snapshot.data!.value![index].cid}.ipfs.nftstorage.link/${snapshot.data!.value![index].files!.first.name}"),
                  );
                },
              );
              // }
            }
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
