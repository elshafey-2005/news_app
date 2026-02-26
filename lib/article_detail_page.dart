import 'package:flutter/material.dart';
import 'package:uses_app/article_model.dart';

class ArticleDetailPage extends StatelessWidget {
  final Article article;

  const ArticleDetailPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (article.urlToImage != null)
                Image.network(article.urlToImage!),
              const SizedBox(height: 16.0),
              Text(
                article.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(height: 8.0),
              if (article.description != null)
                Text(
                  article.description!,
                  style: const TextStyle(fontSize: 16.0),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
