//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:quizf/welcome.dart';

import 'Question.dart';

void main()
{
runApp(MaterialApp(
debugShowCheckedModeBanner: false,
  initialRoute: 'welcome',
routes: {
'welcome':(context) => welcome(),
'Question':(context) => QuizApp(),
},
));
}