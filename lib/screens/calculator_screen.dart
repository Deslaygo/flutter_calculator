import 'package:flutter/material.dart';
import 'package:flutter_calculator/services/theme_service.dart';
import 'package:flutter_calculator/widgets/operator_item.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  double? resultado;

  String operacion = '';

  void agregarOperador(String operador) {
    final operadores = ['%', 'x', '+', '-', '÷', '.'];

    if (operacion.isEmpty) return;

    final ultimoCaracter = operacion.substring(operacion.length - 1);

    if (operadores.contains(ultimoCaracter)) return;

    operacion += operador;
    setState(() {});
  }

  void agregarDigito(String digito) => setState(() {
        operacion += digito;
      });

  void obtenerResultado() {}

  @override
  Widget build(BuildContext context) {
    final themeService = Provider.of<ThemeService>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        top: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  width: 150,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () => themeService.darkTheme = false,
                        icon: const Icon(FontAwesomeIcons.sun),
                        color: themeService.darkTheme == false
                            ? Theme.of(context).colorScheme.primaryVariant
                            : Theme.of(context).colorScheme.surface,
                      ),
                      const SizedBox(width: 16),
                      IconButton(
                        onPressed: () => themeService.darkTheme = true,
                        icon: const Icon(FontAwesomeIcons.moon),
                        color: themeService.darkTheme == true
                            ? Theme.of(context).colorScheme.primaryVariant
                            : Theme.of(context).colorScheme.surface,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
              width: double.infinity,
              height: 150,
              margin: const EdgeInsets.only(top: 80),
              padding: const EdgeInsets.only(right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    operacion,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: themeService.darkTheme
                            ? Colors.white
                            : Colors.black),
                  ),
                  Visibility(
                    visible: resultado != null,
                    child: Text(
                      resultado.toString(),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: themeService.darkTheme
                              ? Colors.white
                              : Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 24),
                padding: const EdgeInsets.only(top: 60, left: 24, right: 24),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        OperatorItem(
                          label: 'AC',
                          color: Theme.of(context).colorScheme.secondaryVariant,
                          onTap: () => setState(() {
                            operacion = '';
                            resultado = null;
                          }),
                        ),
                        OperatorItem(
                          label: 'C',
                          color: Theme.of(context).colorScheme.secondaryVariant,
                        ),
                        OperatorItem(
                          label: '%',
                          color: Theme.of(context).colorScheme.secondaryVariant,
                          onTap: () => agregarOperador('%'),
                        ),
                        OperatorItem(
                          label: '÷',
                          color: Theme.of(context).colorScheme.error,
                          onTap: () => agregarOperador('÷'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        OperatorItem(
                          label: '7',
                          color: themeService.darkTheme
                              ? Colors.white
                              : Colors.black,
                          onTap: () => agregarDigito('7'),
                        ),
                        OperatorItem(
                          label: '8',
                          color: themeService.darkTheme
                              ? Colors.white
                              : Colors.black,
                          onTap: () => agregarDigito('8'),
                        ),
                        OperatorItem(
                          label: '9',
                          color: themeService.darkTheme
                              ? Colors.white
                              : Colors.black,
                          onTap: () => agregarDigito('9'),
                        ),
                        OperatorItem(
                          label: 'x',
                          color: Theme.of(context).colorScheme.error,
                          onTap: () => agregarOperador('x'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        OperatorItem(
                          label: '4',
                          color: themeService.darkTheme
                              ? Colors.white
                              : Colors.black,
                          onTap: () => agregarDigito('4'),
                        ),
                        OperatorItem(
                          label: '5',
                          color: themeService.darkTheme
                              ? Colors.white
                              : Colors.black,
                          onTap: () => agregarDigito('5'),
                        ),
                        OperatorItem(
                          label: '6',
                          color: themeService.darkTheme
                              ? Colors.white
                              : Colors.black,
                          onTap: () => agregarDigito('6'),
                        ),
                        OperatorItem(
                          label: '-',
                          color: Theme.of(context).colorScheme.error,
                          onTap: () => agregarOperador('-'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        OperatorItem(
                          label: '1',
                          color: themeService.darkTheme
                              ? Colors.white
                              : Colors.black,
                          onTap: () => agregarDigito('1'),
                        ),
                        OperatorItem(
                          label: '2',
                          color: themeService.darkTheme
                              ? Colors.white
                              : Colors.black,
                          onTap: () => agregarDigito('2'),
                        ),
                        OperatorItem(
                          label: '3',
                          color: themeService.darkTheme
                              ? Colors.white
                              : Colors.black,
                          onTap: () => agregarDigito('3'),
                        ),
                        OperatorItem(
                          label: '+',
                          color: Theme.of(context).colorScheme.error,
                          onTap: () => agregarOperador('+'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        OperatorItem(
                          label: 'R',
                          color: themeService.darkTheme
                              ? Colors.white
                              : Colors.black,
                        ),
                        OperatorItem(
                          label: '0',
                          color: themeService.darkTheme
                              ? Colors.white
                              : Colors.black,
                          onTap: () => agregarDigito('0'),
                        ),
                        OperatorItem(
                          label: '.',
                          color: themeService.darkTheme
                              ? Colors.white
                              : Colors.black,
                          onTap: () => agregarOperador('.'),
                        ),
                        OperatorItem(
                          label: '=',
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
