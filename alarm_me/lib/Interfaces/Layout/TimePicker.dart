import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class TimePicker{

  BuildContext _tempContext;
  double _height;

  TimePicker(this._tempContext,this._height);

  build() {
    return DatePicker.showTimePicker(_tempContext,
      theme: DatePickerTheme(
        containerHeight: _height/3,
      ),
      currentTime: DateTime.now(),
      locale: LocaleType.en,
      showTitleActions: true,
      onChanged: (time){
        print('confirm $time');
      }
    );
  }
}