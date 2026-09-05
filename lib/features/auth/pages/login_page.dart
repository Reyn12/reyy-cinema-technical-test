import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:reyy_cinema/gen/assets.gen.dart';
import 'package:reyy_cinema/network/api_service.dart';
import 'package:reyy_cinema/resources/resources.dart';
import 'package:reyy_cinema/routes/app_paths.dart';
import 'package:reyy_cinema/widget/image_load.dart';

import '../../../helper/dialog_error_helper.dart';
import '../../../helper/validator.dart';
import '../../../widget/custom_snackbar.dart';
import '../../../widget/custom_text_field.dart';
import '../../../widget/loading_dialog.dart';
import '../../../widget/primary_button.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormBuilderState>();
  late final LoginBloc loginBloc;

  @override
  void initState() {
    super.initState();
    loginBloc = LoginBloc(
      apiService: sharedApiService,
      authBloc: context.read<AuthBloc>(),
    );
  }

  @override
  void dispose() {
    loginBloc.close();
    super.dispose();
  }

  void submitLogin() {
    loginBloc.add(
      const LoginSubmitted(username: 'rey122', password: 'reyy123123'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocProvider.value(
      value: loginBloc,
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          switch (state) {
            case LoginLoading():
              LoadingDialog.show(context);
            case LoginFailure(error: final error):
              LoadingDialog.hide(context);
              final parsed = parseDialogError(error);
              CustomSnackbar.error(
                context,
                parsed.message,
                title: parsed.title,
              );
            case LoginSuccess():
              LoadingDialog.hide(context);
              context.go(AppPaths.mainNavigation);
            case LoginInitial():
              break;
          }
        },
        builder: (context, state) {
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.dark,
            ),
            child: Scaffold(
              backgroundColor: AppColors.neutral10,
              body: FormBuilder(
                key: formKey,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 280,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.primaryPressed,
                            AppColors.primaryDark,
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 280,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: AppColors.neutral10,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(24),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 24,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'Selamat Datang',
                                textAlign: TextAlign.center,
                                style: textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.neutral100,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Login ke akun untuk akses fitur',
                                textAlign: TextAlign.center,
                                style: textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textColor80,
                                ),
                              ),
                              const SizedBox(height: 24),
                              CustomTextField(
                                name: 'username',
                                label: 'Username',
                                hint: 'Masukkan Username',
                                keyboardType: TextInputType.text,
                                validators: [Validator.required()],
                              ),
                              const SizedBox(height: 12),
                              CustomTextField.password(
                                name: 'password',
                                label: 'Password',
                                hint: 'Masukkan Password',
                              ),
                              const SizedBox(height: 8),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {
                                    CustomSnackbar.info(
                                      context,
                                      'Fitur ini belum tersedia',
                                    );
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    minimumSize: Size.zero,
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  child: Text(
                                    'Lupa Password',
                                    style: textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              PrimaryButton(
                                enabled: state is! LoginLoading,
                                text: 'Bypass Login (Development)',
                                onPressed: submitLogin,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 120,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ImageLoad(src: Assets.icons.icLogoLogin.path),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
