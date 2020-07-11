import 'package:flutter/material.dart';

class CustomRadioModal<T> {
  final void Function(T value) onPressed;
  final String radioText;
  final value;

  CustomRadioModal(
      {@required this.onPressed, @required this.radioText, this.value});
}

class CustomRadio extends StatelessWidget {
  final List<CustomRadioModal> children;
  final Axis scrollDirection;
  final activeIndex;

  CustomRadio(
      {@required this.children,
      @required this.activeIndex,
      this.scrollDirection = Axis.horizontal});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, i) {
        return _CustomRadioButton(
          children[i],
          isActive: i == activeIndex,
        );
      },
      scrollDirection: scrollDirection,
    );
  }
}

class _CustomRadioButton extends StatelessWidget {
  final bool _isActive;
  final CustomRadioModal _data;

  _CustomRadioButton(this._data, {bool isActive = false})
      : _isActive = isActive;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width / 3,
        child: _isActive
            ? RaisedButton(
                child: Text(
                  _data.radioText,
                ),
                color: Theme.of(context).primaryColor,
                onPressed: () => _data.onPressed(
                  _data.value,
                ),
              )
            : OutlineButton(
                child: Text(
                  _data.radioText,
                ),
                color: Theme.of(context).primaryColor,
                onPressed: () => _data.onPressed(
                  _data.value,
                ),
              ));
  }
}
