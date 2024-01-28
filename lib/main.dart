import 'package:flutter/material.dart';
import 'screens/CPRInstructionsScreen.dart';
import 'core/models/Quote.dart';
import 'core/services/QuoteApiService.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/cprInstructions': (context) => CPRInstructionsScreen(),
        '/screen3': (context) => Screen3(),
      },
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Quote? currentQuote;

  @override
  void initState() {
    super.initState();
    loadQuote();
  }

  Future<void> loadQuote() async {
    try {
      Quote quote = await getQuote();
      setState(() {
        currentQuote = quote;
      });
    } catch (e) {
      print("Error loading quote: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/palestine.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: currentQuote != null
              ? QuoteDisplay(quote: currentQuote!)
              : CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: loadQuote,
        tooltip: 'Get Random Quote',
        child: Icon(Icons.refresh),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
              onPrimary: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onPressed: () {
              // temshi lel CPR
              Navigator.pushNamed(context, '/cprInstructions');
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Text('CPR Instructions'),
            ),
          ),
        ),
      ),
    );
  }
}


class QuoteDisplay extends StatelessWidget {
  final Quote quote;

  const QuoteDisplay({Key? key, required this.quote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '"${quote.text}"',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10.0),
          Text(
            "- ${quote.author}",
            style: TextStyle(fontSize: 16.0),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

  Future<Quote>  getQuote() async {

  QuotesApiService apiService = QuotesApiService();

  try {
    Quote quote = await apiService.fetchRandomQuote();
    print("Random Quote: ${quote.text} - ${quote.author}");
    return (quote) ;
  } catch (e) {
    print("Error: $e");
    // Return a default or empty quote in case of an error
    return Quote(text: "the opposite of poverty isn't weath, the opposite of poverty is wealth", author: "maya angelou");
  }

}
