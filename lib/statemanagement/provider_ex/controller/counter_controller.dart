import 'package:flutter/material.dart';
import 'package:sep_advancedtopics/statemanagement/provider_ex/model/count.dart';

class CounterProvier extends ChangeNotifier{

  Count _incCounter = Count(0);

  Count get counter_value => _incCounter;

  void increment_Count(){
    _incCounter.value++;
    notifyListeners();
  }


}