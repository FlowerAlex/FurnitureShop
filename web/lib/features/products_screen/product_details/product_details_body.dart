import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:furniture_shop/features/products_screen/product_details/product_details_body_cubit.dart';
import 'package:furniture_shop/resources/app_colors.dart';
import 'package:furniture_shop/utils/forms/form_row.dart';
import 'package:furniture_shop/utils/spaced.dart';
import 'package:furniture_shop/utils/text_button.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductDetailsBodyCubit>(
      create: (context) => ProductDetailsBodyCubit(
        cqrs: context.read(),
      ),
      child: BlocBuilder<ProductDetailsBodyCubit, ProductDetailsBodyState>(
        builder: (context, state) {
          return state.map(
              ready: (state) {
                return _ProductDetailsBodyReady(state: state);
              },
              error: (state) => Center(
                    child: Text(
                      state.error,
                    ),
                  ));
        },
      ),
    );
  }
}

class _ProductDetailsBodyReady extends HookWidget {
  const _ProductDetailsBodyReady({
    Key? key,
    required this.state,
  }) : super(key: key);

  final ProductDetailsBodyStateReady state;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductDetailsBodyCubit>();

    final formKey = useMemoized(GlobalKey<FormState>.new);
    final autovalidateMode = useState(AutovalidateMode.disabled);
    final currentFile = state.currentFile;

    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode.value,
      child: Column(
        children: [
          FormRow(
            childrenFlex: const {1: 2, 2: 5},
            children: [
              const SizedBox(),
              const Text('Name'),
              TextFormField(
                validator: Validators.required('Enter value'),
              ),
            ],
          ),
          FormRow(
            childrenFlex: const {1: 2, 2: 5},
            children: [
              const SizedBox(),
              const Text('Price'),
              TextFormField(
                validator: Validators.required('Enter value'),
              ),
            ],
          ),
          PickFileSection(
            context: context,
            currentFile: currentFile,
            onPickFilePressed: cubit.pickFile,
            isValid: currentFile != null,
          ),
          AppTextButton(
            text: 'Create product',
            onPressed: () async {
              autovalidateMode.value = AutovalidateMode.onUserInteraction;

              if (formKey.currentState?.validate() ?? false) {
                await cubit.createProduct();
              }
            },
          ),
        ].spaced(16),
      ),
    );
  }
}

class PickFileSection extends FormField<bool> {
  PickFileSection({
    Key? key,
    required BuildContext context,
    required bool isValid,
    required VoidCallback onPickFilePressed,
    required PlatformFile? currentFile,
  }) : super(
          key: key,
          initialValue: isValid,
          validator: (value) {
            if (value ?? false) {
              return null;
            }

            return 'File not picked';
          },
          builder: (state) {
            if (isValid != state.value) {
              WidgetsBinding.instance!.scheduleFrameCallback((_) {
                state.didChange(isValid);
              });
            }
            final theme = Theme.of(context);

            final errorText = state.errorText;

            return Column(
              children: [
                AppTextButton(
                  text: 'Pick file',
                  onPressed: onPickFilePressed,
                ),
                if (currentFile != null) ...[
                  const SizedBox(height: 8),
                  Text(currentFile.name),
                ],
                if (errorText != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    errorText,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppColors.errorRed,
                    ),
                  ),
                ],
              ],
            );
          },
        );
}
