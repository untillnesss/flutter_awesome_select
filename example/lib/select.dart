import 'package:awesome_select/awesome_select.dart';
import 'package:flutter/material.dart';

class HondaSelectOutline<T> extends StatefulWidget {
  final String title;
  final bool isLoading;
  final List<S2Choice<T>> choiceItems;
  final Function(dynamic state, T value) onChange;
  final T selectedValue;
  final EdgeInsets margin;

  const HondaSelectOutline({
    Key key,
    this.title,
    this.isLoading = false,
    this.choiceItems,
    this.onChange,
    this.selectedValue,
    this.margin,
  }) : super(key: key);

  @override
  _HondaSelectOutlineState<T> createState() => _HondaSelectOutlineState<T>();
}

class _HondaSelectOutlineState<T> extends State<HondaSelectOutline<T>> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        margin: this.widget.margin ??
            EdgeInsets.symmetric(horizontal: 12).copyWith(bottom: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey),
        ),
        child: SmartSelect<T>.single(
          title: this.widget.title,
          selectedValue: this.widget.selectedValue,
          choiceItems: this.widget.choiceItems,
          onChange: (state) => this.widget.onChange(state, state.value),
          modalFilter: true,
          modalFilterAuto: true,
          modalConfig: S2ModalConfig(
            headerStyle: S2ModalHeaderStyle(
              hintStyle: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
          modalHeaderStyle: S2ModalHeaderStyle(
            backgroundColor: Colors.white,
            actionsIconTheme: IconThemeData(color: Colors.red),
            iconTheme: IconThemeData(color: Colors.black54),
            textStyle: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          tileBuilder: (context, state) {
            return S2Tile.fromState(state,
                dense: true,
                isLoading: this.widget.isLoading,
                title: state.selected.value == null
                    ? Text(
                        state.title,
                        style: TextStyle(color: Colors.black38, fontSize: 16),
                      )
                    : Text(
                        state.selected?.title?.toString() ?? this.widget.title,
                        style: TextStyle(fontSize: 16),
                      ),
                padding: EdgeInsets.symmetric(horizontal: 14),
                hideValue: true,
                trailing: Icon(Icons.arrow_downward));
          },
        ),
      ),
    );
  }
}
