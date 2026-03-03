import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uses_app/article_detail_page.dart';
import 'package:uses_app/cubit/news_cubit.dart';
import 'package:uses_app/cubit/news_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
      ),
      body: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          if (state is NewsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is NewsFailure) {
            return Center(child: Text('Error: ${state.errorMessage}'));
          } else if (state is NewsSuccess) {
            final articles = state.articles;
            if (articles.isEmpty) {
              return const Center(child: Text('No articles found.'));
            }
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ArticleDetailPage(article: article),
                      ),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (article.urlToImage != null)
                            Image.network(
                              article.urlToImage!,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(Icons.broken_image, size: 100);
                              },
                            ),
                          const SizedBox(height: 8.0),
                          Text(
                            article.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          if (article.description != null)
                            Text(
                              article.description!,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('Start fetching news...'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<NewsCubit>().fetchNews();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
