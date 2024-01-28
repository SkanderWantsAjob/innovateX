import 'package:dio/dio.dart';
import 'package:html/parser.dart';

import '../models/Quote.dart'; // Import the html package

class QuotesApiService {
  final Dio _dio = Dio();
  final String apiurl =
      "https://quotesondesign.com/wp-json/wp/v2/posts/?orderby=rand&_=${DateTime.now().millisecondsSinceEpoch}";

  Future<Quote> fetchRandomQuote() async {
    try {
      Response response = await _dio.get(apiurl);

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        if (data.isNotEmpty) {
          String quoteText = parse(data[0]['content']['rendered'])?.documentElement?.text ?? "";

          String author = data[0]['title']['rendered'];

          // Create and return a Quote object
          return Quote(text: quoteText, author: author);
        } else {
          throw Exception("No quotes available");
        }
      } else {
        throw Exception("Failed to fetch quotes");
      }
    } catch (e) {
      print("Error: $e");
      throw Exception("Error: $e");
    }
  }
}
