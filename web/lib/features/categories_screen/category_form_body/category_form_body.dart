import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:furniture_shop/features/categories_screen/category_form_body/category_form_body_cubit.dart';
import 'package:furniture_shop/utils/forms/form_row.dart';
import 'package:furniture_shop/utils/spaced.dart';
import 'package:furniture_shop/utils/text_button.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class CategoryFormBody extends StatelessWidget {
  const CategoryFormBody({
    Key? key,
    required this.onConfirmPressed,
    required this.confirmText,
    this.initialValue,
    this.categoryId,
  }) : super(key: key);

  final AsyncCallback onConfirmPressed;
  final String confirmText;
  final String? initialValue; // for updateing existing category
  final String? categoryId; // for updateing existing category

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoryFormBodyCubit>(
      create: (context) => CategoryFormBodyCubit(
        cqrs: context.read(),
      )..init(),
      child: BlocConsumer<CategoryFormBodyCubit, CategoryFormBodyState>(
        listener: (context, state) async {
          if (state is CategoryFormBodyStateFinished) {
            Navigator.of(context).pop();
            await onConfirmPressed();
          }
        },
        builder: (context, state) {
          return state.map(
              ready: (state) {
                return _CategoryFormBodyReady(
                  state: state,
                  confirmText: confirmText,
                  categoryId: categoryId,
                  initialValue: initialValue,
                );
              },
              finished: (_) => const SizedBox(),
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

class _CategoryFormBodyReady extends HookWidget {
  const _CategoryFormBodyReady({
    Key? key,
    required this.state,
    required this.confirmText,
    this.initialValue,
    this.categoryId,
  }) : super(key: key);

  final CategoryFormBodyStateReady state;
  final String confirmText;
  final String? initialValue; // for updateing existing category
  final String? categoryId; // for updateing existing category

  @override
  Widget build(BuildContext context) {
    final categoryId = this.categoryId;

    final cubit = context.read<CategoryFormBodyCubit>();

    final formKey = useMemoized(GlobalKey<FormState>.new);
    final autovalidateMode = useState(AutovalidateMode.disabled);

    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FormRow(
            childrenFlex: const {1: 2, 2: 5},
            children: [
              const SizedBox(),
              const Text('Name'),
              TextFormField(
                initialValue: initialValue,
                onChanged: (value) => cubit.updateCategoryText(name: value),
                validator: Validators.required('Enter value'),
              ),
            ],
          ),
          AppTextButton(
            text: confirmText,
            onPressed: () async {
              autovalidateMode.value = AutovalidateMode.onUserInteraction;

              if (formKey.currentState?.validate() ?? false) {
                if (categoryId != null) {
                  await cubit.updateCategory(categoryId);
                } else {
                  await cubit.createCategory();
                }
              }
            },
          ),
        ].spaced(16),
      ),
    );
  }
}
