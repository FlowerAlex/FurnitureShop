import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:furniture_shop/data/contracts.dart';
import 'package:furniture_shop/features/products_screen/product_form_body/product_form_body_cubit.dart';
import 'package:furniture_shop/resources/app_colors.dart';
import 'package:furniture_shop/utils/forms/form_row.dart';
import 'package:furniture_shop/utils/spaced.dart';
import 'package:furniture_shop/utils/text_button.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class ProductFormBody extends StatelessWidget {
  const ProductFormBody({
    Key? key,
    this.editingProduct,
  }) : super(key: key);

  final ProductDetailsDTO? editingProduct;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductFormBodyCubit>(
      create: (context) => ProductFormBodyCubit(
        cqrs: context.read(),
        azureStorage: context.read(),
      )..init(
          editingProduct: editingProduct,
        ),
      child: BlocConsumer<ProductFormBodyCubit, ProductFormBodyState>(
        listener: (context, state) {
          if (state is ProductFormBodyStateFinished) {
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          return state.map(
              ready: (state) {
                return _ProductFormBodyReady(
                  state: state,
                  editingProduct: editingProduct,
                );
              },
              error: (state) => Center(
                    child: Text(
                      state.error,
                    ),
                  ),
              finished: (_) => const SizedBox());
        },
      ),
    );
  }
}

class _ProductFormBodyReady extends HookWidget {
  const _ProductFormBodyReady({
    Key? key,
    required this.state,
    required this.editingProduct,
  }) : super(key: key);

  final ProductFormBodyStateReady state;
  final ProductDetailsDTO? editingProduct;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductFormBodyCubit>();

    final formKey = useMemoized(GlobalKey<FormState>.new);
    final autovalidateMode = useState(AutovalidateMode.disabled);
    final currentImage = state.currentImage;
    final currentModel = state.currentModel;

    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode.value,
      child: SingleChildScrollView(
        child: Column(
          children: [
            FormRow(
              childrenFlex: const {1: 2, 2: 5},
              children: [
                const SizedBox(),
                const Text('Name'),
                TextFormField(
                  initialValue: editingProduct?.name,
                  validator: Validators.required('Enter value'),
                  onChanged: (value) => cubit.updateProduct(
                    name: value,
                  ),
                ),
              ],
            ),
            FormRow(
              childrenFlex: const {1: 2, 2: 5},
              children: [
                const SizedBox(),
                const Text('Price'),
                TextFormField(
                  initialValue: editingProduct?.price.toString(),
                  validator: Validators.required('Enter value'),
                  onChanged: (value) => cubit.updateProduct(
                    price: value,
                  ),
                ),
              ],
            ),
            FormRow(
              childrenFlex: const {1: 2, 2: 5},
              children: [
                const SizedBox(),
                const Text('Description'),
                TextFormField(
                  initialValue: editingProduct?.description,
                  validator: Validators.required('Enter value'),
                  onChanged: (value) => cubit.updateProduct(
                    description: value,
                  ),
                  maxLines: null,
                ),
              ],
            ),
            FormRow(childrenFlex: const {
              1: 2,
              2: 5
            }, children: [
              const SizedBox(),
              const Text('Category'),
              DropdownButtonFormField<String>(
                items: state.categories
                    .map(
                      (e) => DropdownMenuItem<String>(
                        child: Text(e.name),
                        value: e.id,
                      ),
                    )
                    .toList(),
                value: state.selectedCategoryId,
                onChanged: (selectedCategoryId) => cubit.updateProduct(
                  selectedCategoryId: selectedCategoryId,
                ),
                focusColor: Colors.transparent,
                validator: Validators.required('Enter value'),
              ),
            ]),
            PickFileSection(
              context: context,
              title: 'Preview photo',
              currentFile: currentImage,
              buttonLabel: 'Pick image',
              onPickFilePressed: () => cubit.pickFile(AppBlobType.image),
              isValid: currentImage != null,
            ),
            PickFileSection(
              context: context,
              title: 'Model of the product',
              currentFile: currentModel,
              buttonLabel: 'Pick model',
              onPickFilePressed: () => cubit.pickFile(AppBlobType.model),
              isValid: true,
            ),
            AppTextButton(
              text: editingProduct != null ? 'Edit product' : 'Create product',
              onPressed: () async {
                autovalidateMode.value = AutovalidateMode.onUserInteraction;

                if (formKey.currentState?.validate() ?? false) {
                  if (editingProduct != null) {}
                  await cubit.createProduct();
                }
              },
            ),
          ].spaced(16),
        ),
      ),
    );
  }
}

class PickFileSection extends FormField<bool> {
  PickFileSection({
    Key? key,
    required BuildContext context,
    required bool isValid,
    required String title,
    required String buttonLabel,
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

            return Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(title),
                    AppTextButton(
                      text: buttonLabel,
                      onPressed: onPickFilePressed,
                    ),
                    if (currentFile != null) ...[
                      Text(currentFile.name),
                    ],
                    if (errorText != null) ...[
                      Text(
                        errorText,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppColors.errorRed,
                        ),
                      ),
                    ],
                  ].spaced(8),
                ),
              ),
            );
          },
        );
}
