import 'package:flutter/material.dart';

import '../../../../providers/ui/screens/future_calculator/future_calculator_view_model.dart';
import '../../../styles/app_colors.dart';

class CalculatorForm extends StatefulWidget {
  final FutureCalculatorViewModel viewModel;
  const CalculatorForm({super.key, required this.viewModel});

  @override
  State<CalculatorForm> createState() => _CalculatorFormState();
}

class _CalculatorFormState extends State<CalculatorForm> {
  late final TextEditingController intialBalanceController;
  late final TextEditingController monthlyDepositController;
  late final TextEditingController annualInterestController;
  late final TextEditingController yearsDurationController;

  @override
  void initState() {
    super.initState();
    intialBalanceController = TextEditingController();
    monthlyDepositController = TextEditingController();
    annualInterestController = TextEditingController();
    yearsDurationController = TextEditingController();
  }

  @override
  void dispose() {
    intialBalanceController.dispose();
    monthlyDepositController.dispose();
    annualInterestController.dispose();
    yearsDurationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomTextField(
          text: 'Balance Inicial',
          prefixLabel: '\$',
          controller: intialBalanceController,
        ),
        SizedBox(height: 10),
        _CustomTextField(
          text: 'Depósito Periódico Mensual',
          prefixLabel: '\$',
          controller: monthlyDepositController,
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: _CustomTextField(
                text: 'Ratio Interés Anual',
                sufixLabel: '%',
                controller: annualInterestController,
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: _CustomTextField(
                text: 'Duración (años)',
                sufixLabel: 'años',
                controller: yearsDurationController,
                widthPrefixSufix: 50,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.purple.withValues(alpha: 0.8),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () async {
            FocusManager.instance.primaryFocus?.unfocus();
            await Future.delayed(Duration(milliseconds: 500));
            widget.viewModel.calculate(
              double.parse(intialBalanceController.text.replaceAll(',', '.')),
              double.parse(monthlyDepositController.text.replaceAll(',', '.')),
              double.parse(annualInterestController.text.replaceAll(',', '.')),
              int.parse(yearsDurationController.text),
            );
          },
          child: Text(
            'Calcular',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
      ],
    );
  }
}

class _CustomTextField extends StatelessWidget {
  final String text;
  final String? prefixLabel;
  final String? sufixLabel;
  final double? widthPrefixSufix;
  final TextEditingController controller;

  const _CustomTextField({
    required this.text,
    required this.controller,
    this.prefixLabel,
    this.sufixLabel,
    this.widthPrefixSufix = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 2),
        SizedBox(
          height: 40,
          child: Row(
            children: [
              if (prefixLabel != null)
                _PrefixSufixContainer(
                  isPrefix: true,
                  text: prefixLabel!,
                  width: widthPrefixSufix,
                ),
              Expanded(
                child: TextField(
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  controller: controller,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: _borderColor, width: 1),
                      borderRadius: borderRadius,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: AppColors.purple),
                      borderRadius: borderRadius,
                    ),
                  ),
                ),
              ),
              if (sufixLabel != null)
                _PrefixSufixContainer(
                  isPrefix: false,
                  text: sufixLabel!,
                  width: widthPrefixSufix,
                ),
            ],
          ),
        ),
      ],
    );
  }

  BorderRadius get borderRadius {
    return BorderRadius.only(
      topRight: Radius.circular(sufixLabel == null ? 5 : 0),
      topLeft: Radius.circular(prefixLabel != null ? 0 : 5),
      bottomRight: Radius.circular(sufixLabel == null ? 5 : 0),
      bottomLeft: Radius.circular(prefixLabel != null ? 0 : 5),
    );
  }
}

class _PrefixSufixContainer extends StatelessWidget {
  final String text;
  final bool isPrefix;
  final double? width;

  const _PrefixSufixContainer({
    required this.text,
    required this.isPrefix,
    this.width = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.2),
        border: Border(
          top: BorderSide(color: _borderColor),
          bottom: BorderSide(color: _borderColor),
          left: isPrefix ? BorderSide(color: _borderColor) : BorderSide.none,
          right: isPrefix ? BorderSide.none : BorderSide(color: _borderColor),
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(isPrefix ? 5 : 0),
          bottomLeft: Radius.circular(isPrefix ? 5 : 0),
          topRight: Radius.circular(!isPrefix ? 5 : 0),
          bottomRight: Radius.circular(!isPrefix ? 5 : 0),
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: text.length > 1 ? 14 : 16,
        ),
      ),
    );
  }
}

final _borderColor = Colors.grey.withValues(alpha: 0.75);
