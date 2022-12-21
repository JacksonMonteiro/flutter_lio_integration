import 'package:flutter/material.dart';

abstract class HomeContract{
  goToCreateOrder(){}
  goToListOrder(){}
}

class HomePresenter{
  final HomeContract contract;

  HomePresenter(this.contract);


}