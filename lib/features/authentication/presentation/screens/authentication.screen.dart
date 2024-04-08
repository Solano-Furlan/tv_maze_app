import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:local_auth/local_auth.dart';
import 'package:tv_maze_app/core/dependencies/dependencies.dart';
import 'package:tv_maze_app/core/design_system/theme/colors.dart';
import 'package:tv_maze_app/core/design_system/widgets/buttons/button.widget.dart';
import 'package:tv_maze_app/core/design_system/widgets/fields/text_field.widget.dart';
import 'package:tv_maze_app/core/design_system/widgets/layouts/divider.widget.dart';
import 'package:tv_maze_app/core/design_system/widgets/layouts/main_scaffold.widget.dart';
import 'package:tv_maze_app/core/design_system/widgets/texts/text.widget.dart';
import 'package:tv_maze_app/core/navigation/services/dialogs.service.dart';
import 'package:tv_maze_app/core/navigation/services/navigation.service.dart';
import 'package:tv_maze_app/features/authentication/state/authentication/authentication.cubit.dart';
import 'package:tv_maze_app/features/authentication/state/authentication/authentication.state.dart';
import 'package:tv_maze_app/features/settings/data/auth_method.repository.dart';
import 'package:tv_maze_app/features/settings/domain/enums/auth_method_type.enum.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final TextEditingController _pinController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _hasDeviceAuthentication = false;
  List<AuthMethodType> _authMethods = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _hasDeviceAuthentication =
          await getIt<LocalAuthentication>().isDeviceSupported();
      _authMethods = await getIt<AuthMethodRepository>().getAuthMethods();
      setState(() {});
    });
  }

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (BuildContext context, AuthenticationState state) {
        return UIMainScaffold(
          canPop: false,
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(
                          color: AppColors.dark1,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          '🍿',
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      const UIText(
                        'MazeTv',
                        maxLines: 1,
                        color: AppColors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w300,
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                  const UIText(
                    'Authentication',
                    fontSize: 36,
                    fontWeight: FontWeight.w300,
                  ),
                  const Spacer(),
                  UITextField(
                    controller: _pinController,
                    label: 'PIN (4 Digits)',
                    isRequired: true,
                    minLenght: 4,
                    maxLength: 4,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Spacer(),
                  UIButton(
                    text: 'Validate Pin',
                    onPressed: _authenticateWithPin,
                    isLoading: state is AuthenticationPinLoadingState,
                  ),
                  KeyboardVisibilityBuilder(
                      builder: (BuildContext context, bool visible) {
                    if (visible ||
                        !_hasDeviceAuthentication ||
                        !_authMethods.contains(AuthMethodType.device)) {
                      return const SizedBox();
                    }
                    return Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Row(
                            children: [
                              Expanded(
                                child: UIDivider(),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                child: UIText('Or'),
                              ),
                              Expanded(
                                child: UIDivider(),
                              ),
                            ],
                          ),
                        ),
                        UIButton(
                          text: 'Authenticate with Device',
                          onPressed: _authenticateWithDevice,
                          color: Colors.transparent,
                          textColor: AppColors.primary,
                          borderColor: AppColors.primary,
                          isLoading: state is AuthenticationDeviceLoadingState,
                        ),
                      ],
                    );
                  }),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _authenticateWithPin() async {
    if (_formKey.currentState?.validate() ?? false) {
      final AuthenticationState authenticationState = await context
          .read<AuthenticationCubit>()
          .authenticateWithPin(authPin: _pinController.text);

      if (authenticationState is AuthenticationAuthorizedState) {
        getIt<AppNavigationService>().routeToTvShows();
      } else {
        getIt<AppDialogsService>().showErrorDialog(
          text:
              'Failed to validate your PIN, please check your credentials and try again.',
        );
      }
    }
  }

  Future<void> _authenticateWithDevice() async {
    final AuthenticationState authenticationState =
        await context.read<AuthenticationCubit>().authenticateWithDevice();

    if (authenticationState is AuthenticationAuthorizedState) {
      getIt<AppNavigationService>().routeToTvShows();
    } else {
      getIt<AppDialogsService>().showErrorDialog(
        text:
            'Failed to authenticate with your device, please try again or authenticate with your PIN.',
      );
    }
  }
}
