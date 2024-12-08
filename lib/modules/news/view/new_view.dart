import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:viper_test/modules/news/interactor/news_interactor.dart';
import 'package:viper_test/modules/news/router/news_router.dart';
import '../entity/news_article.dart';
import '../presenter/news_presenter.dart';
import '../view/news_view_contract.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<StatefulWidget> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> implements NewsViewContract {
  late NewsPresenter _presenter;
  bool _isLoading = false;
  String? _errorMessage;
  List<NewsArticle> _news = [];

  @override
  void initState() {
    super.initState();
    // Using dependency injection
    _presenter = NewsPresenter(
      view: this,
      interactor: GetIt.I<NewsInteractor>(),
      router: NewsRouterImpl(context),
    );
    _presenter.fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('News')),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _presenter.navigateToWeather(),
        child: const Icon(Icons.cloud),
      ),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_errorMessage!, style: const TextStyle(color: Colors.red)),
            ElevatedButton(
              onPressed: () => _presenter.fetchNews(),
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: _news.length,
      itemBuilder: (context, index) {
        final article = _news[index];
        return ListTile(
          title: Text(article.title),
          subtitle: Text(article.description),
          leading: article.imageUrl != null
              ? Image.network(article.imageUrl!, width: 100, fit: BoxFit.cover)
              : null,
        );
      },
    );
  }

  @override
  void showLoading() {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
  }

  @override
  void showNews(List<NewsArticle> fetchedNews) {
    setState(() {
      _isLoading = false;
      _news = fetchedNews;
    });
  }

  @override
  void showError(String message) {
    setState(() {
      _isLoading = false;
      _errorMessage = message;
    });
  }
}
