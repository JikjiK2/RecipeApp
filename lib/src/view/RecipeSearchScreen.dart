import 'package:cook_app_project/src/view/SearchListScreen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RecipeSearchScreen extends StatefulWidget {
  @override
  _RecipeSearchScreenState createState() => _RecipeSearchScreenState();
}

class _RecipeSearchScreenState extends State<RecipeSearchScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController SearchController = TextEditingController();

    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Navigator.canPop(context)
            ? IconButton(
                splashColor: Colors.transparent,
                splashRadius: 25,
                color: Colors.black,
                icon: const Icon(
                  Icons.arrow_back,
                ),
                onPressed: () => Navigator.of(context).pop(),
              )
            : null,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              child: TextFormField(
                controller: SearchController,
                maxLines: 1,
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                autofocus: true,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                            color: Color.fromRGBO(125, 125, 125, 0.4),
                            width: 2.0)),
                    hintText: "검색"),
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            IconButton(
              style: const ButtonStyle(
                splashFactory: NoSplash.splashFactory,
              ),
              onPressed: () {
                final String word = SearchController.text;
                if (word == "") {
                  showCustom(context, "검색어를 입력해주세요.");
                } else {
                  SearchWord = word;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              SerachListScreen()));
                }
              },
              icon: const Icon(Icons.search),
              color: Colors.black,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 150.0,
              ),
              const Text(
                "TextField의 단어가 포함된 요리 리스트 출력",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//toastmessage
showCustom(BuildContext context, String msg) {
  FToast fToast = FToast();
  fToast.init(context);
  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.0),
      color: Color.fromRGBO(0, 0, 0, 0.57),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Text(
            msg,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    ),
  );
  fToast.showToast(
    child: toast,
    toastDuration: const Duration(seconds: 2),
    gravity: ToastGravity.BOTTOM,
  );
}
