import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
// import 'package:phone_number/phone_number.dart';

import '/component/action_button.dart';
import '/screens/login_pages/otp_page.dart';

class PhoneNumberScreen extends StatefulWidget {
  PhoneNumberScreen({Key? key}) : super(key: key);
  static const String routeName = "phone";

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  GlobalKey<FormState> formkey = GlobalKey();
  final TextEditingController controller = TextEditingController();
  PhoneNumber number = PhoneNumber(isoCode: 'SA');
  bool validPhone = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Flexible(
              flex: 2,
              child: Text(
                "QuizU",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 50),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 10),
            child: Form(
              key: formkey,
              child: InternationalPhoneNumberInput(
                autoFocus: true,
                onInputChanged: (PhoneNumber number) {
                  this.number = number;
                },
                onInputValidated: (bool value) {
                  validPhone = value;
                },
                selectorConfig: const SelectorConfig(
                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                ),
                ignoreBlank: false,
                selectorTextStyle: const TextStyle(color: Colors.black),
                initialValue: number,
                textFieldController: controller,
                autoValidateMode: AutovalidateMode.onUserInteraction,
                formatInput: true,
                keyboardType: const TextInputType.numberWithOptions(
                    signed: true, decimal: false),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 10),
          //   child: Form(
          //     key: formkey,
          //     child: TextFormField(
          //       keyboardType: TextInputType.phone,
          //       validator: ((value) =>
          //           value!.isNotEmpty ? null : "this filed must be not empty"),
          //       controller: ctrl,
          //       autocorrect: false,
          //       enableSuggestions: false,
          //       autofocus: true,
          //       decoration: const InputDecoration(
          //         labelText: 'Phone Number',
          //         helperText: '',
          //       ),
          //     ),
          //   ),
          // ),
          // Container(
          //   padding: const EdgeInsets.symmetric(
          //     vertical: 5,
          //     horizontal: 15,
          //   ),
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(8),
          //     border: Border.all(
          //       color: Colors.black.withOpacity(0.13),
          //     ),
          //     boxShadow: const [
          //       BoxShadow(
          //         color: Color(0xffeeeeee),
          //         blurRadius: 10,
          //         offset: Offset(0, 4),
          //       ),
          //     ],
          //   ),
          //   child: Stack(
          //     children: [
          //       // InternationalPhoneNumberInput(
          //       //   onInputChanged: (PhoneNumber number) {
          //       //     print(number.phoneNumber);
          //       //   },
          //       //   onInputValidated: (bool value) {
          //       //     print(value);
          //       //   },
          //       //   selectorConfig: SelectorConfig(
          //       //     // countryComparator: (c, e) {
          //       //     //   return c.dialCode;
          //       //     // },
          //       //     selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
          //       //   ),
          //       //   ignoreBlank: false,
          //       //   autoValidateMode: AutovalidateMode.disabled,
          //       //   selectorTextStyle: TextStyle(color: Colors.black),
          //       //   textFieldController: controller,
          //       //   formatInput: false,
          //       //   maxLength: 9,
          //       //   keyboardType: TextInputType.numberWithOptions(
          //       //     signed: true,
          //       //     decimal: true,
          //       //   ),
          //       //   cursorColor: Colors.black,
          //       //   inputDecoration: InputDecoration(
          //       //     contentPadding: EdgeInsets.only(
          //       //       bottom: 15,
          //       //       left: 0,
          //       //     ),
          //       //     border: InputBorder.none,
          //       //     hintText: 'Phone Number',
          //       //     hintStyle: TextStyle(
          //       //       color: Colors.grey.shade500,
          //       //       fontSize: 16,
          //       //     ),
          //       //   ),
          //       //   onSaved: (PhoneNumber number) {
          //       //     print('On Saved: $number');
          //       //   },
          //       // ),
          //       Positioned(
          //         left: 90,
          //         top: 8,
          //         bottom: 8,
          //         child: Container(
          //           height: 40,
          //           width: 1,
          //           color: Colors.black.withOpacity(0.13),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          ActionButton(
            onPressed: () async {
              if (formkey.currentState!.validate()) {
                // PhoneNumber phoneNumber =
                //     await PhoneNumberUtil().parse(ctrl.text);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OTPScreen(mobile: controller.text)),
                );
              }
            },
            label: "Start",
          ),
          Flexible(child: Container()),
        ],
      ),
    );
  }
}
