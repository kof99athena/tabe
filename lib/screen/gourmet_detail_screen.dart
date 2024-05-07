import 'package:flutter/material.dart';

class GourmetDetailScreen extends StatelessWidget {
  dynamic gourmetItem;

  GourmetDetailScreen({super.key, required this.gourmetItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: TextButton(
          child: Text(
            '戻る',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 200,
                  width: double.infinity,
                  child: gourmetItem['photo']['pc']['l'] != null
                      ? ClipRRect(
                          child: Image.network(
                            gourmetItem['photo']['pc']['l'],
                            fit: BoxFit.cover,
                          ),
                        )
                      : ClipRRect(
                          child: Image.asset('assets/img_null'),
                        )),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  gourmetItem['genre']['name'],
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.blueGrey,
                      fontFamily: 'pretendard',
                      fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                  height: 50,
                  width: 50,
                  child: gourmetItem['logo_image'] != null
                      ? ClipRRect(
                    child: Image.network(
                      gourmetItem['logo_image'],
                      fit: BoxFit.cover,
                    ),
                  )
                      : ClipRRect(
                    child: Image.asset('assets/img_null'),
                  )),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  gourmetItem['name'],
                  style: TextStyle(
                      fontSize: 28,
                      fontFamily: 'pretendard',
                      fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  gourmetItem['catch'],
                  style: TextStyle(
                      fontSize: 16,
                      backgroundColor: Colors.orange,
                      fontFamily: 'pretendard',
                      fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  gourmetItem['other_memo'],
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'pretendard',
                      fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  gourmetItem['wedding'],
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'pretendard',
                      fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                color: Colors.grey,
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 5,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  gourmetItem['address'],
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'pretendard',
                      fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  gourmetItem['open'],
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'pretendard',
                      fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
