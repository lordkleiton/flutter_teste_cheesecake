import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:teste_cheesecake/component/article/selectable_article.dart';
import 'package:teste_cheesecake/model/article.dart';
import 'package:teste_cheesecake/network/rest.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  _State createState() => _State();
}

class _State extends State<HomeView> {
  late Future<List<Map<String, dynamic>>> _articles;

  void initState() {
    super.initState();

    _articles = RestManager.get();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: _articles,
          builder: (context, snapshot) {
            final bool loading =
                snapshot.connectionState == ConnectionState.waiting;

            if (loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            final bool error = snapshot.hasError;

            if (error) {
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('ocorreu um erro ao buscar os artigos'),
                    MaterialButton(
                      child: Text('dnv'),
                      onPressed: () {
                        setState(() {
                          _articles = RestManager.get();
                        });
                      },
                    ),
                  ],
                ),
              );
            }

            final List<Map<String, dynamic>> data = snapshot.data!;

            return ListView.separated(
              separatorBuilder: (contex, index) => Container(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                child: Divider(
                  height: 1,
                ),
              ),
              itemCount: data.length,
              itemBuilder: (context, index) => SelectableArticleComponent(
                article: Article.fromJson(data[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}
