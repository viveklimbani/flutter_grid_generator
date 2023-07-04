import 'package:aip_practical/common/images.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController row = TextEditingController();
  TextEditingController column = TextEditingController();

  int rowC = 2;
  int colC = 2;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Home",
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: getMainLayout,
      ),
    );
  }

  get getMainLayout => Column(
        children: [
          getTextBoxField,
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GridView.builder(
                      itemCount: colC * rowC,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: rowC,
                          // childAspectRatio: colC * rowC / 50,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Container(
                        // color: Colors.greenAccent,
                        child: Image.asset(Images.icBasket),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );

  get getTextBoxField => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Row"),
            SizedBox(
              width: 50,
              child: TextField(
                controller: row,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Text("Column"),
            SizedBox(
              width: 50,
              child: TextField(
                controller: column,
              ),
            ),
            TextButton(
              onPressed: () {
                rowC = int.parse(row.text);
                colC = int.parse(column.text);
                setState(() {});
              },
              child: Container(
                color: Colors.blue,
                padding: const EdgeInsets.all(08),
                child: const Text(
                  "Get",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      );
}
