import 'dart:ui';

import 'package:app/app.dart';

import 'package:bloc/bloc.dart';
import 'package:widget_repository/widget_repository.dart';

class SelectTab {
  final WidgetFamily family;
  final Color color;

  const SelectTab({required this.family, required this.color});

  Color get tabColor => Cons.tabColors[family.index];

  Color get nextTabColor => Cons.tabColors[(family.index+1)%Cons.tabColors.length];

}

class ColorChangeCubit extends Cubit<SelectTab> {
  ColorChangeCubit(Color initColor)
      : super(SelectTab(
          family: WidgetFamily.statelessWidget,
          color: initColor,
        ));

  void change(Color color, {WidgetFamily? family}) => emit(SelectTab(
        color: color,
        family: family ?? state.family,
      ));
}
