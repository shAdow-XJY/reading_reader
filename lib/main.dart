import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:reading_reader/redux/app_state/state.dart';
import 'package:reading_reader/router/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final store = Store<AppState>(appReducer, initialState: AppState.initialState());

  @override
  Widget build(BuildContext context) {
    /// 使用StoreProvider 包裹根元素，使其提供store
    return StoreProvider(
      store: store,
      /// 为了能直接在child使用store，我们这里要继续包裹一层StoreBuilder
      child: StoreBuilder<AppState>(
        builder: (context, store) {
          return MaterialApp(
              title: 'Writing Writer',
              theme: ThemeData(
                brightness: Brightness.dark,
              ),
              debugShowCheckedModeBanner: false,
              initialRoute: '/',
              onGenerateRoute: onGenerateRoute
          );
        },
      ),
    );
  }
}
