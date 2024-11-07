import 'package:flutter/material.dart';

class CalculatorLogic {

  var text = ''; //Zmienna posiadajaca wpisane wartosci
  var finalText = '0'; //Zmienna wyswietlajaca wpisane wartosci
  var operator = ''; //Zmienna informujaca jaka operacje nalezy wkonac
  double num1 = 0;
  double num2 = 0;
  double result = 0; //Zmienna przechowujaca wynik zmiennych


  //Funkcja zajmujaca sie pokazywaniem i wykonywaniem obliczen
  void showCalc(String btnText)
  {
    //Czyscimy wartosci zmiennych
    if(btnText == 'C')
    {
      finalText = '0';
      text = '0';
      num1 = 0;
      num2 = 0;
      operator = '';
      result = 0;

    }
    //Jezeli zostal klikniety pzycisk "rowna sie"
    //WYkonujemy konkretna operacje
    else if(operator == '=' || btnText == '=')
    {
      //Dodawanie
      if(operator == '+')
      {
        setNumbers();
        result = (num1 + num2);
        setAfterCalcs();
      }
      //Odejmowanie
      else if(operator == '-')
      {
        setNumbers();
        result = (num1 - num2);
        setAfterCalcs();
      }
      //Mnozenie
      else if(operator == 'x')
      {
        setNumbers();
        result = (num1 * num2);
        setAfterCalcs();
      }
      //Dzielenie
      else if(operator == '÷')
      {
        setNumbers();
        result = (num1 / num2);
        setAfterCalcs();
      }
    }
    //Zmiana znaku liczby
    else if(btnText == '±')
    {
      if(num1 == 0)
        num1 = double.parse(text);
      if(num1 > 0)
        num1 = num1 * (-1);
      else
        num1 = num1.abs();
      finalText = num1.toString();
    }
    //Zamiana liczby na jej procent
    else if(btnText == '%')
    {
      if(num1 == 0)
        num1 = double.parse(text);
      num1 /= 100;
      finalText = num1.toString();
    }
    //Dodaje kropki do utworzenia liczby zmiennoprzecinkowej
    else if(text == '0' && btnText == '.')
    {
       text = '0.';
       finalText = text;
    }
    else
    {
      if(btnText == '+' || btnText == '-' || btnText == 'x' || btnText == '÷' || btnText == '=')
      {
        setNumbers();
        text = '0';
        operator = btnText;
        print(num1 + num2);
      }
      else
      //Sprawdzamy czy cos zostalo wczesniej wpisane do kalkulaora
      //Jezeli nie, liczba zastepuje 0
      if(text == '0')
      {
        text = btnText;
        finalText = text;
      }
      else
      {
        text += btnText;
        finalText = text;
      }

    }
  }

  //Funkcja ustawiajaca liczby do obliczen
  void setNumbers()
  {
    if(num1 == 0)
      num1 = double.parse(text);
    else
      num2 = double.parse(text);
  }

  //Funkcja wykonujaca dzialania po obliczeniach
  void setAfterCalcs()
  {
    num1 = result;
    text = result.toString();
    finalText = text;
  }
}



