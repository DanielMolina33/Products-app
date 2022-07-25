//Flutter
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';
import 'providers/LoginProvider.dart';
import 'providers/ProductsProvider.dart';

// Components
import 'package:flutter_app/components/SplashScreen.dart';
import 'components/Products.dart';
import 'components/Login.dart';

void main() => runApp(const AppState());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(lazy: false, create: (_) => LoginProvider()),
        ChangeNotifierProvider(lazy: false, create: (_) => ProductsProvider()),
      ],
      child: const MyApp(),
    );
  }
}

class _MyAppState extends State<MyApp> {
  Widget route = const Login();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final LocalStorage storage = LocalStorage('session');

  @override
	void initState(){
		super.initState();
    storage.ready.then((_) => 
      checkIfIsLogged().then((isLogged) => {
        if(isLogged){
          setState(() => route = const Products()),
        }
      })
    );
	}

  Future<bool> checkIfIsLogged() async {
    if(storage.getItem('user_logged') != null){
      Map<String, dynamic> userLogged = await storage.getItem('user_logged');
      bool? hasToken = userLogged['token']! != null ? true : false;
      if(hasToken){
        String createdAt = userLogged['created_at'];
        DateTime createdAtParsed = DateTime.parse(createdAt);
        DateTime now = DateTime.now();
        int difference = now.difference(createdAtParsed).inHours;

        return !isExpired(difference);
      } 
    }
		return false;
	}

  bool isExpired(int val){
    const int toExpire = 12;

    if(val >= toExpire){
      storage.deleteItem('user_logged');
      return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash-screen',
      navigatorKey: navigatorKey,
      routes: {
        "splash-screen": (_) => SplashScreen(route),
        "login": (_) => const Login(),
        "products": (_) => const Products(),
      },
    );
  }
}