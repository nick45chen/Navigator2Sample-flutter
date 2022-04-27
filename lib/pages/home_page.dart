import 'package:flutter/material.dart';
import 'package:flutter_nativator2_sample/model/detail_data_model.dart';

class HomePage extends StatefulWidget {
  final ValueChanged<DetailDataModel>? onJumpToDetail;

  const HomePage({Key? key, this.onJumpToDetail}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HomePage')),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('點擊按鈕跳轉下一頁', style: TextStyle(fontSize: 18.0)),
            MaterialButton(
              onPressed: () => widget.onJumpToDetail?.call(DetailDataModel('12345', '測試名稱')),
              child: const Text('跳轉詳情頁'),
            )
          ],
        ),
      ),
    );
  }
}
