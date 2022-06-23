import 'package:flutter/material.dart';

class CustomPaginatedDataTable extends StatefulWidget {
  final int? sortColumnIndex;
  final bool? sortAscending;
  final bool? showCheckboxColumn;
  final Function(int?)? onPageChanged;
  final Widget? header;
  final int? rowsPerPage;
  final List<DataColumn>? columns;
  final DataTableSource? source;
  final bool? searchEnable;
  final List<Widget>? actions;
  final double? horizontalMargin;
  final Function(bool?)? onSelectAll;

  CustomPaginatedDataTable({
    this.sortColumnIndex,
    this.sortAscending = true,
    this.showCheckboxColumn = false,
    this.onPageChanged,
    this.header,
    this.rowsPerPage = 10,
    this.columns,
    this.source,
    this.searchEnable = false,
    this.actions,
    this.horizontalMargin = 24.0,
    this.onSelectAll,
  });

  @override
  State<CustomPaginatedDataTable> createState() =>
      _CustomPaginatedDataTableState();
}

class _CustomPaginatedDataTableState extends State<CustomPaginatedDataTable> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PaginatedDataTable(
          sortColumnIndex: widget.sortColumnIndex,
          sortAscending: widget.sortAscending!,
          showCheckboxColumn: widget.showCheckboxColumn!,
          onPageChanged: widget.onPageChanged,
          header: widget.header,
          columns: widget.columns!,
          rowsPerPage: widget.rowsPerPage!,
          source: widget.source!,
          actions: widget.actions,
          onSelectAll: widget.onSelectAll!,
          horizontalMargin: widget.horizontalMargin!,
        ),
      ],
    );
  }
}
