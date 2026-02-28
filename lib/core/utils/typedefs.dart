import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:offline_first/core/model/failure.dart';

ValueNotifier<bool> shouldAskForConfirmation = ValueNotifier(false);

typedef AsyncValueOf<T> = Future<Either<Failure,T>>;

typedef JSONObject = Map<String,dynamic>;

typedef JSONArray = List<JSONObject>;

typedef WidgetBlocBuilder<S> = Widget Function(S state);

dynamic toNull(_) => null;

typedef HintBuilder = Widget Function(
  BuildContext context,
  String hint,
  bool enabled,
);

typedef HeaderBuilder<T> = Widget Function(
  BuildContext context,
  T selectedItem,
  bool enabled,
);

typedef ListItemBuilder<T> = Widget Function(
  BuildContext context,
  T item,
  bool isSelected,
  VoidCallback onItemSelect,
);

typedef ListMultiItemBuilder<T> = Widget Function(
  BuildContext context,
  T item,
  int index,
  bool isSelected,
);