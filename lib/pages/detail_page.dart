import 'package:flutter/material.dart';
import 'package:flutter_nativator2_sample/model/detail_data_model.dart';

class DetailPage extends StatefulWidget {
  final DetailDataModel? model;

  const DetailPage({Key? key, this.model}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('詳情頁')),
      body: Center(
        child: Text('資料:\nid: ${widget.model?.id}\nname: ${widget.model?.name}'),
      ),
    );
  }
}
