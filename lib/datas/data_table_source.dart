import 'package:flutter/material.dart';
import 'package:paginated_datatable_demo/models/model.dart';
import 'package:paginated_datatable_demo/widgets/dialog_form.dart';

class DataSource extends DataTableSource {
  BuildContext context;
  List<Model> entries = [];
  int _selectedCount = 0;

  DataSource({
    required this.context,
    required this.entries,
  });

  List<Model> get selectedEntries =>
      entries.where((element) => element.selected == true).toList();

  void sort<T>(Comparable<T> Function(Model d) getField, bool ascending) {
    entries.sort((Model a, Model b) {
      if (!ascending) {
        final c = a;
        a = b;
        b = c;
      }
      final Comparable<T> aValue = getField(a);
      final Comparable<T> bValue = getField(b);
      return Comparable.compare(aValue, bValue);
    });
    notifyListeners();
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => entries.length;

  @override
  int get selectedRowCount => _selectedCount;

  @override
  DataRow? getRow(int index) {
    if (index >= entries.length) return null;
    final entry = entries[index];

    return DataRow.byIndex(
        index: index,
        selected: entry.selected,
        onSelectChanged: (bool? value) {
          if (value == null) return;
          if (entry.selected != value) {
            _selectedCount += value ? 1 : -1;
            assert(_selectedCount >= 0);
            entry.selected = value;
            notifyListeners();
          }
        },
        cells: <DataCell>[
          ///add your column here
          DataCell(Text((index + 1).toString())),
          DataCell(
              Text(
                entry.firstname,
                style: const TextStyle(color: Colors.blue),
              ),
              onTap: () => DialogForm.show(context, entry)),
          DataCell(Text(entry.lastname)),
          DataCell(Text(entry.company)),
          DataCell(Text(entry.mobile)),
          DataCell(Text(entry.house)),
          DataCell(Text(entry.email)),
          DataCell(Text(entry.birthday)),
        ]);
  }
}
