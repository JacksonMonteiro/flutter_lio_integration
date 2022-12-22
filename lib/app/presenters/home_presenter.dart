import 'package:flutter/material.dart';

abstract class HomeContract{}

class HomePresenter{
  final HomeContract contract;

  HomePresenter(this.contract);


}