import 'package:flutter/material.dart';
import 'package:offline_first/styles/app_color.dart';

Widget buildTableCell(String title, {VoidCallback? onClick}) {
  return InkWell(
    onTap: onClick,
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.green),
      ),
      padding: const EdgeInsets.all(12.0),
      child: Center(
        child: Text(
          title.toUpperCase(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}

Widget buildTableHeader(String title) {
  return Builder(
    builder: (context) => Container(
      color: AppColors.green,
      padding: const EdgeInsets.all(8.0),
      alignment: Alignment.center,
      child: Text(
        title.toUpperCase(),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 12),
      ),
    ),
  );
}
