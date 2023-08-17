import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:max_store/Faetures/Cart/peresentation/manager/cart_cubit/cart_cubit.dart';
import 'package:max_store/Faetures/Cart/peresentation/views/widgets/purchase_details_section.dart';
import 'package:max_store/core/Models/CheckOut_model.dart';
import 'package:max_store/core/Models/product_model.dart';
import 'package:max_store/core/utils/size_config.dart';

import '../../manager/cubit/check_out_cubit.dart';
import 'inpust_section_checkout.dart';

class CheckOutVIewBody extends StatefulWidget {
  const CheckOutVIewBody({
    super.key,
  });

  @override
  State<CheckOutVIewBody> createState() => _CheckOutVIewBodyState();
}

class _CheckOutVIewBodyState extends State<CheckOutVIewBody> {
  late List<ProductModel> products;
  CheckoutModel checkout = CheckoutModel();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        autovalidateMode: autovalidateMode,
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Inputfield(
                        sectionTitle: 'CUSTOMER INFORMATION',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RowOfinputLine(
                        rowtitle: 'Email',
                        onchanged: (value) {
                          checkout.email = value;
                        },
                      ),
                      RowOfinputLine(
                        rowtitle: 'Full Name',
                        onchanged: (value) {
                          checkout.fullName = value;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Inputfield(sectionTitle: 'DELEVIERY INFORMATION'),
                      RowOfinputLine(
                        rowtitle: 'Adress',
                        onchanged: (value) {
                          checkout.adress = value;
                        },
                      ),
                      RowOfinputLine(
                        rowtitle: 'City',
                        onchanged: (value) {
                          checkout.city = value;
                        },
                      ),
                      RowOfinputLine(
                        rowtitle: 'Country',
                        onchanged: (value) {
                          checkout.country = value;
                        },
                      ),
                      RowOfinputLine(
                        rowtitle: 'Zip Code',
                        onchanged: (value) {
                          checkout.zipCode = value;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Inputfield(sectionTitle: 'ORDER SUMMARY'),
                      const Divider(
                        thickness: 2,
                        indent: 25,
                        endIndent: 20,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const PurchaseDetailsSection(),
                    ],
                  ),
                )
              ],
            ),
            CustomCheckOutBottomNavBar(),
          ],
        ),
      ),
    );
  }

  Container CustomCheckOutBottomNavBar() {
    return Container(
      width: SizeConfig.screenwidth,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 95, vertical: 10),
        child: BlocBuilder<CheckOutCubit, CheckOutState>(
          builder: (context, state) {
            return AbsorbPointer(
              absorbing: state is CheckOutSuccess ? true : false,
              child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      checkout.delevieryFee = CheckOutCubit.delevieryFee!;
                      checkout.subTotal = CheckOutCubit.subTotal!;
                      checkout.total = CheckOutCubit.total!;
                      checkout.products = CheckOutCubit.products!;

                      BlocProvider.of<CheckOutCubit>(context)
                          .uploadOrderToFirebase(checkout: checkout);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                    }
                    BlocProvider.of<CartCubit>(context).clearCart();
                  },
                  child: BlocBuilder<CheckOutCubit, CheckOutState>(
                    builder: (context, state) {
                      if (state is CheckOutSuccess) {
                        return const Text(
                          'DONE !',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        );
                      } else if (state is CheckOuLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return const Text(
                          'ORDER NOW',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        );
                      }
                    },
                  )),
            );
          },
        ),
      ),
    );
  }
}
