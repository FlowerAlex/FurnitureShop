import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:furniture_shop/features/categories_screen/category_form_body/category_form_body_cubit.dart';
import 'package:furniture_shop/utils/forms/form_row.dart';
import 'package:furniture_shop/utils/spaced.dart';
import 'package:furniture_shop/utils/text_button.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class CategoryFormBody extends StatelessWidget {
  const CategoryFormBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoryFormBodyCubit>(
      create: (context) => CategoryFormBodyCubit(
        cqrs: context.read(),
      )..init(),
      child: BlocBuilder<CategoryFormBodyCubit, CategoryFormBodyState>(
        builder: (context, state) {
          return state.map(
              ready: (state) {
                return _CategoryFormBodyReady(state: state);
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

class _CategoryFormBodyReady extends HookWidget {
  const _CategoryFormBodyReady({
    Key? key,
    required this.state,
  }) : super(key: key);

  final CategoryFormBodyStateReady state;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CategoryFormBodyCubit>();

    final formKey = useMemoized(GlobalKey<FormState>.new);
    final autovalidateMode = useState(AutovalidateMode.disabled);

    return Form(
      key: formKey,
      child: Column(
        children: [
          FormRow(
            childrenFlex: const {1: 2, 2: 5},
            children: [
              const SizedBox(),
              const Text('Name'),
              TextFormField(
                onChanged: (value) => cubit.updateCategory(name: value),
                validator: Validators.required('Enter value'),
              ),
            ],
          ),
          AppTextButton(
            text: 'Create product',
            onPressed: () async {
              autovalidateMode.value = AutovalidateMode.onUserInteraction;

              if (formKey.currentState?.validate() ?? false) {
                await cubit.createCategory();
              }
            },
          ),
        ].spaced(16),
      ),
    );
  }
}
