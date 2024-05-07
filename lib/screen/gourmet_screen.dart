import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GourmetScreen extends StatefulWidget {
  const GourmetScreen({super.key});

  @override
  State<GourmetScreen> createState() => _GourmetScreenState();
}

class _GourmetScreenState extends State<GourmetScreen> {
  List<dynamic> gourmetInfo = [];

  @override
  void initState() {
    super.initState();
    //getConfigInfo();
    getGourmetInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          '東京のおすすめレストラン',
          style: TextStyle(
              fontFamily: 'pretendard',
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: gourmetInfo.length,
        itemBuilder: (context, index) {
          var gourmetItem = gourmetInfo[index];
          return GestureDetector(
            child: Container(
              margin: EdgeInsets.all(8),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Row(
                    children: [
                      Container(
                          height: 200,
                          width: 200,
                          child: gourmetItem['photo']['pc']['l'] != null
                              ? ClipRRect(
                                  child: Image.network(
                                    gourmetItem['photo']['pc']['l'],
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : ClipRRect(
                                  child: Image.asset(
                                    'assets/img_null',
                                    fit: BoxFit.cover,
                                  ),
                                )),
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.only(left: 8, right: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              gourmetItem['name'],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'pretendard',
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              gourmetItem['budget']['name'],
                              style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 12,
                                  fontFamily: 'pretendard'),
                            )
                          ],
                        ),
                      ))
                    ],
                  )
                ],
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/detail', arguments: gourmetItem);
            },
          );
        },
      ),
    );
  }

  Future getGourmetInfo() async {
    String? END_POINT = dotenv.env['END_POINT'];
    try {
      final response = await http.get(Uri.parse(END_POINT!));
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        setState(() {
          gourmetInfo = responseData['results']['shop'];
        });
      } else {
        throw Exception('인터넷 연결이 안되있어요!');
      }
    } catch (error) {
      print(error);
    }
  }
}
