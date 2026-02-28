import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_first/core/cubit/infinite_list/infinite_list_cubit.dart';
import 'package:offline_first/core/model/failure.dart';
import 'package:offline_first/widgets/app_failure_widget.dart';
import 'package:offline_first/widgets/app_spacer.dart';
import 'package:offline_first/widgets/empty_data_widget.dart';
import 'package:offline_first/widgets/loading_indicator.dart';

typedef ChildWidgetBuilder<T> = Widget Function(BuildContext context, T data);

class InfiniteListViewWidget<T extends StateStreamable<InfiniteListState<D>>, D>
    extends StatelessWidget {
  const InfiniteListViewWidget({
    required this.childBuilder,
    required this.fetchInitial,
    required this.fetchMore,
    required this.emptyListText,
    super.key,
  });

  final ChildWidgetBuilder<D> childBuilder;
  final VoidCallback fetchInitial;
  final VoidCallback fetchMore;
  final String emptyListText;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<T, InfiniteListState<D>>(
      builder: (_, InfiniteListState<D> state) {
        return state.when(
          initial: () => const Center(child: LoadingIndicator()),
          loading: () => const Center(child: LoadingIndicator()),
          success: (
            List<D> data,
            bool hasReachedMax,
            bool isloadingMore,
            Failure? failure,
          ) {
            log('data----:${data.length}');
            if (data.isEmpty) {
              return EmptyDataWidget(
                emptyText: emptyListText,
                onRefresh: fetchInitial,
              );
            }

            return _InfiniteListView<D>(
              data: data,
              childBuilder: childBuilder,
              fetchInitial: fetchInitial,
              fetchMore: fetchMore,
              hasReachedMax: hasReachedMax,
              failure: failure,
            );
          },
          failed:
              (Failure f) =>
                  AppFailureWidget(message: f.error, onPress: fetchInitial),
        );
      },
    );
  }
}

class _InfiniteListView<T> extends StatefulWidget {
  const _InfiniteListView({
    required this.data,
    required this.childBuilder,
    required this.fetchInitial,
    required this.fetchMore,
    required this.hasReachedMax,
    this.failure,
    super.key,
  });

  final ChildWidgetBuilder<T> childBuilder;
  final List<T> data;
  final bool hasReachedMax;
  final VoidCallback fetchInitial;
  final VoidCallback fetchMore;
  final Failure? failure;

  @override
  State<_InfiniteListView<T>> createState() => _InfiniteListViewState<T>();
}

class _InfiniteListViewState<T> extends State<_InfiniteListView<T>> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      final bool hasScrolledToBottom =
          _scrollController.offset >=
          _scrollController.position.maxScrollExtent;
      if (hasScrolledToBottom &&
          !_scrollController.position.outOfRange &&
          !widget.hasReachedMax) {
        widget.fetchMore();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<T> data = widget.data;
    final bool hasReachedMax = widget.hasReachedMax;
    final int listLen =
        widget.failure != null || !hasReachedMax
            ? widget.data.length + 1
            : widget.data.length;

    return Material(
      type: MaterialType.transparency,
      child: ListView.separated(
        separatorBuilder: (_, __) => AppSpacer.p4(),
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(0.0),
        itemCount: listLen,
        controller: _scrollController,
        itemBuilder: (BuildContext ctx, int idx) {
          if (idx >= data.length) {
            if (widget.failure != null) {
              return AppFailureWidget(
                message: widget.failure!.error,
                onPress: widget.fetchMore,
              );
            }

            return const Center(child: LoadingIndicator());
          }

          return widget.childBuilder(context, data[idx]);
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
