import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:reyy_cinema/helper/validator.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/widget/custom_snackbar.dart';
import 'package:reyy_cinema/widget/custom_text_field.dart';
import 'package:reyy_cinema/widget/loading_dialog.dart';
import 'package:reyy_cinema/widget/primary_button.dart';

class ProfileChangePasswordBottomsheet extends StatefulWidget {
  const ProfileChangePasswordBottomsheet({super.key});

  @override
  State<ProfileChangePasswordBottomsheet> createState() =>
      ProfileChangePasswordBottomsheetState();
}

class ProfileChangePasswordBottomsheetState
    extends State<ProfileChangePasswordBottomsheet> {
  final _formKey = GlobalKey<FormBuilderState>();
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();

  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 16,
        bottom: MediaQuery.viewInsetsOf(context).bottom + 24,
      ),
      child: FormBuilder(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: const Icon(
                  Icons.close,
                  size: 24,
                  color: AppColors.shadesPrimary50,
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  'Ganti Password',
                  textAlign: TextAlign.center,
                  style: AppTypography.h8Bold.copyWith(
                    color: AppColors.neutral100,
                  ),
                ),
                Text(
                  'Masukkan password lama dan baru untuk melanjutkan',
                  textAlign: TextAlign.center,
                  style: AppTypography.bodyRegularM.copyWith(
                    color: AppColors.neutral90,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            CustomTextField.password(
              name: 'old_password',
              label: 'Password Lama',
              hint: 'Masukkan Password Lama',
              controller: oldPasswordController,
              validators: [Validator.required()],
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 16),
            CustomTextField.password(
              name: 'new_password',
              label: 'Password Baru',
              hint: 'Masukkan Password Baru',
              controller: newPasswordController,
              action: TextInputAction.done,
              validators: [Validator.required()],
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 24),
            PrimaryButton(
              text: 'Ganti Password',
              enabled: oldPasswordController.text.isNotEmpty &&
                  newPasswordController.text.isNotEmpty,
              onPressed: () async {
                if (!(_formKey.currentState?.saveAndValidate() ?? false)) {
                  return;
                }

                LoadingDialog.show(context);
                await Future<void>.delayed(const Duration(milliseconds: 800));
                if (!context.mounted) return;
                LoadingDialog.hide(context);

                Navigator.of(context).pop();
                CustomSnackbar.success(context, 'Password berhasil diganti');
              },
            ),
          ],
        ),
      ),
    );
  }
}
