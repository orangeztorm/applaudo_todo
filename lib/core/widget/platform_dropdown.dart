import 'package:flutter/material.dart';

class PlatformDropdown<T> extends StatelessWidget {
  const PlatformDropdown({
    required this.options,
    required this.selectedValue,
    required this.onChanged,
    required this.itemBuilder,
    super.key,
  });
  final List<T> options;
  final T selectedValue;
  final void Function(T?) onChanged;
  final DropdownMenuItemBuilder<T> itemBuilder;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // if (Platform.isIOS) {
    //   return CupertinoPicker(
    //     itemExtent: 32,
    //     onSelectedItemChanged: (int index) {
    //       onChanged(options[index]);
    //     },
    //     children: options.map(itemBuilder).toList(),
    //   );
    // } else if (Platform.isAndroid) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimary,
        border: const Border(
          bottom: BorderSide(
            color: Colors.blue,
            width: 2,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: DropdownButton<T>(
          value: selectedValue,
          onChanged: onChanged,
          isExpanded: true,
          hint: const Text('Select an option'),
          items: options.map<DropdownMenuItem<T>>(itemBuilder).toList(),
          icon: const Icon(Icons.arrow_drop_down),
          iconSize: 36,
          elevation: 16,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
          underline: Container(),
        ),
      ),
    );
    // } else {
    //   return const Text('Platform not supported');
    // }
  }
}

typedef DropdownMenuItemBuilder<T> = DropdownMenuItem<T> Function(T option);
