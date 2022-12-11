import 'package:flutter/material.dart';
import 'package:nex_gen_task/designExtentions/colors.dart';
import 'package:nex_gen_task/userInterface/commonComponents/book_widget.dart';
import 'package:nex_gen_task/userInterface/commonComponents/bottomSheets/articles_filter_sheet.dart';
import 'package:nex_gen_task/userInterface/commonComponents/bottomSheets/books_filter_sheet.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import '../../providers/search_provider.dart';
import '../commonComponents/bottom_sheet.dart';
import '../commonComponents/leading_title_app_bar.dart';
import '../commonComponents/article_widget.dart';

class ArticlesBooksScreen extends StatefulWidget {
  const ArticlesBooksScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ArticlesBooksScreenState();
  }
}

class _ArticlesBooksScreenState extends State<ArticlesBooksScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final RefreshController _refreshArticleController =
      RefreshController(initialRefresh: false);
  final RefreshController _refreshBookController =
      RefreshController(initialRefresh: false);
  int indx = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
    searchProvider.resetBookPage();
    searchProvider.resetArticlePage();
    _tabController.animateTo(0);
    Future.delayed(const Duration(seconds: 1), () {
      showFilterSheet();
    });
  }

  static const List<Tab> _tabs = [
    Tab(icon: Icon(Icons.looks_one), child: Text('Articles')),
    Tab(icon: Icon(Icons.looks_two), text: 'Books'),
  ];

  showFilterSheet() {
    indx == 0
        ? BottomSheetWidget.showBottomSheet(
            context, "Article Filters", const ArticlesFilterBottomSheet())
        : BottomSheetWidget.showBottomSheet(
            context, "Book Filters", const BooksFilterBottomSheet());
  }

  Widget actionButton() {
    return IconButton(
        onPressed: () {
          showFilterSheet();
        },
        icon: const Icon(
          Icons.filter_alt_outlined,
          size: 25,
        ));
  }

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);

    ///loading articles data via smart refresher\\\     ||||start||||||
    refreshArticleData() async {
      searchProvider.updateArticlePage(1);
      await searchProvider.getArticles();
    }

    void _onRefreshArticleData() async {
      await refreshArticleData();
      _refreshArticleController.refreshCompleted();
    }

    void _onLoadingArticleData() async {
      await Future.delayed(const Duration(milliseconds: 1000));
      await refreshArticleData();
      if (mounted) setState(() {});
      _refreshArticleController.loadComplete();
    }

    ///loading articles data via smart refresher\\\    ||||end||||||

    ///loading books data via smart refresher\\\     ||||start||||||
    refreshBookData() async {
      searchProvider.updateBookPage(1);
      await searchProvider.getBooks();
    }

    void _onRefreshBookData() async {
      await refreshBookData();
      _refreshBookController.refreshCompleted();
    }

    void _onLoadingBookData() async {
      await Future.delayed(const Duration(milliseconds: 1000));
      await refreshBookData();
      if (mounted) setState(() {});
      _refreshBookController.loadComplete();
    }

    ///loading books data via smart refresher\\\ ||||end||||||

    ///articles listing widget\\\         ||||start||||||
    Widget articlesListView() {
      if (searchProvider.loadingArticleData) {
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: const Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
          ),
        );
      } else {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SmartRefresher(
            enablePullDown: false,
            enablePullUp: true,
            controller: _refreshArticleController,
            onLoading: _onLoadingArticleData,
            onRefresh: _onRefreshArticleData,
            footer: const ClassicFooter(loadStyle: LoadStyle.ShowWhenLoading),
            scrollDirection: Axis.vertical,
            child: ListView.builder(
                itemCount: searchProvider.mdArticle.length,
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ArticleWidget(
                    mdArticle: searchProvider.mdArticle[index],
                  );
                }),
          ),
        );
      }
    }

    ///articles listing widget\\\     ||||end||||||

    ///books listing widget\\\          ||||start||||||
    Widget booksListView() {
      if (searchProvider.loadingBooksData) {
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: const Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
          ),
        );
      } else {
        return SmartRefresher(
          enablePullDown: false,
          enablePullUp: true,
          controller: _refreshBookController,
          onLoading: _onLoadingBookData,
          onRefresh: _onRefreshBookData,
          footer: const ClassicFooter(loadStyle: LoadStyle.ShowWhenLoading),
          scrollDirection: Axis.vertical,
          child: ListView.builder(
              itemCount: searchProvider.mdBook.length,
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return BookWidget(
                  book: searchProvider.mdBook[index],
                );
              }),
        );
      }
    }

    ///articles listing widget\\\                 ||||end||||||

    List<Widget> views = [articlesListView(), booksListView()];

    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: LeadingTitleAppBar(
            title: "Search",
            showLeading: true,
            actionsList: actionButton(),
          ),
          body: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: TabBar(
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.grey,
                    labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                    unselectedLabelStyle:
                        const TextStyle(fontStyle: FontStyle.italic),
                    overlayColor: MaterialStateColor.resolveWith(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.blue;
                      }
                      if (states.contains(MaterialState.focused)) {
                        return Colors.orange;
                      } else if (states.contains(MaterialState.hovered)) {
                        return Colors.pinkAccent;
                      }

                      return Colors.transparent;
                    }),
                    indicatorWeight: 10,
                    indicatorColor: AppColors.primaryColor,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorPadding: const EdgeInsets.all(5),
                    indicator: BoxDecoration(
                      border: Border.all(color: AppColors.primaryColor),
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.primaryColor,
                    ),
                    isScrollable: true,
                    physics: const BouncingScrollPhysics(),
                    onTap: (int index) {
                      print("index $index");
                      if (index == 0) {
                        searchProvider.getArticles(showLoading: true);
                      } else {
                        searchProvider.getBooks(showLoading: true);
                      }
                      indx = index;
                    },
                    enableFeedback: true,
                    tabs: _tabs,
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  physics: const BouncingScrollPhysics(),
                  children: views,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
