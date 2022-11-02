import 'package:flutter/material.dart';
import 'package:task/constants.dart';

class TileWidget extends StatelessWidget {
  const TileWidget(
      {this.title,
      this.leadingUrl,
      this.subtitleText,
      this.trailingText,
      super.key});
  final String? subtitleText;
  final String? leadingUrl;
  final String? title;
  final String? trailingText;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.1,
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            child: Image.network(leadingUrl ?? noImage),
          ),
          subtitle: Text(subtitleText ?? "No data"),
          title: SizedBox(
              width: size.width * 0.3,
              child: Text(
                title ?? "No data",
                style: const TextStyle(overflow: TextOverflow.ellipsis),
              )),
          trailing: SizedBox(
              width: size.width * 0.3,
              child: Text(
                trailingText ?? "No Data",
                style: const TextStyle(overflow: TextOverflow.ellipsis),
              )),
        ),
      ),
    );
  }
}
