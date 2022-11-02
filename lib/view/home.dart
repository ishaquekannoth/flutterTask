import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/controller/data_provider.dart';
import 'package:task/view/widgets/tile_widget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = Provider.of<DataProvider>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Jakes Git"),
        ),
        body: pageController.getList.isNotEmpty
            ? ListView.builder(
                controller: pageController.scrollController,
                itemCount: pageController.getList.length,
                itemBuilder: (context, index) => TileWidget(
                      leadingUrl:
                          pageController.getList[index].owner?.avatarUrl,
                      title: '${index + 1}'.toString(),
                      trailingText: pageController.getList[index].language,
                      subtitleText:
                          pageController.getList[index].createdAt.toString(),
                    ))
            : Center(
                child: pageController.isDataLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () => pageController.dataFetcher(),
                        child: const Text("Refresh"),
                      )));
  }
}
