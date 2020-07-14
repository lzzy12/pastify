import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paster/configs/configs.dart';

class CustomRadioModal<T> {
  final void Function(T value) onPressed;
  final String radioText;
  final T value;

  CustomRadioModal(
      {@required this.onPressed, @required this.radioText, this.value});
}

class CustomRadio<T> extends StatelessWidget {
  final List<CustomRadioModal> children;
  final Axis scrollDirection;
  final activeIndex;
  final _scrollController = ScrollController();

  CustomRadio(
      {@required this.children,
      @required this.activeIndex,
      this.scrollDirection = Axis.horizontal});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.smallButtonHeight,
      child: CupertinoScrollbar(
        controller: _scrollController,
        isAlwaysShown: true,
        child: ListView.separated(
          controller: _scrollController,
          itemCount: children.length,
          itemBuilder: (ctx, i) {
            return _CustomRadioButton<T>(
              children[i],
              isActive: i == activeIndex,
            );
          },
          scrollDirection: scrollDirection,
          separatorBuilder: (ctx, i) => SizedBox(
            width: Sizes.horizontalMargin,
          ),
        ),
      ),
    );
  }
}

class _CustomRadioButton<T> extends StatelessWidget {
  final bool _isActive;
  final CustomRadioModal<T> _data;

  _CustomRadioButton(this._data, {bool isActive = false})
      : _isActive = isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width / 3,
      height: 20,
      child: _isActive
          ? RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Sizes.radius)),
        child: Text(
          _data.radioText,
          style: TextStyle(color: Colors.white),
        ),
        color: Theme
            .of(context)
            .primaryColor,
        onPressed: () =>
            _data.onPressed(
              _data.value,
            ),
      )
          : OutlineButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Sizes.radius)),
        child: Text(
          _data.radioText,
        ),
        borderSide: BorderSide(color: Theme
            .of(context)
            .primaryColor),
        onPressed: () =>
            _data.onPressed(
              _data.value,
            ),
      ),
    );
  }
}
