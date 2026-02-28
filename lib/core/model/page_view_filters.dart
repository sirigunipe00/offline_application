import 'package:equatable/equatable.dart';

class PageViewFilters extends Equatable {

  factory PageViewFilters.initial() => const PageViewFilters(status: 'Draft');
  const PageViewFilters({required this.status, this.query});

  final String status;
  final String? query;
  
  @override
  List<Object?> get props => [status, query];

  PageViewFilters copyWith({
    String? status,
    String? query,
  }) => PageViewFilters(status: status ?? this.status, query: query ?? this.query);
}