import 'package:flutter/material.dart';
import 'package:offline_first/widgets/app_bar.dart';
import 'package:offline_first/widgets/buttons/app_btn.dart';
import 'package:offline_first/widgets/inputs/app_text_field.dart';

class CreateNewPasswordPage extends StatelessWidget {
  const CreateNewPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController newController = TextEditingController();
    TextEditingController confirmController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(),
                const SizedBox(height: 30),
                const Text(
                  'Create new password',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Your new password must be unique from those previously used.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 30),
                AppTextField(
                  title: 'Email',
                  hintText: 'Enter Your Email',

                  prefixIcon: const Icon(Icons.email_outlined),
                  controller: newController,
                  inputType: TextInputType.emailAddress,
                  onPressed: () {},
                ),

                const SizedBox(height: 20),
                AppTextField(
                  title: 'Email',
                  hintText: 'Enter Your Email',

                  prefixIcon: const Icon(Icons.email_outlined),
                  controller: confirmController,
                  inputType: TextInputType.emailAddress,
                  onPressed: () {},
                ),

                const SizedBox(height: 30),
               AppButton(
                  label: 'Reset Password',
                  onPressed: () {
                   
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
