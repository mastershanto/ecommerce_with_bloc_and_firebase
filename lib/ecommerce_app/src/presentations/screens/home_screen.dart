import 'package:ecommerce_with_bloc_and_firebase/ecommerce_app/src/data/preferences/local_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../blocs/blocs.dart';
import '../../routs/route_pages.dart';
import '../../utils/asset_manager.dart';
import '../../utils/values.dart';
import '../widgets/widgets.dart';
@override
// void initState() {
//   super.initState();
//   context.read<ProductBloc>().add(RequestFetchProduct());
// }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
void initState() {
  super.initState();
  context.read<ProductBloc>().add(RequestFetchProduct());
}
  @override
  Widget build(BuildContext context) {
    final layout = MediaQuery.of(context).size;
    final _themeColor = Theme.of(context).colorScheme;
    final _themeText = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, isScrollable) => [
            SliverAppBar(
              floating: true,
              leading: IconButton.filled(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                      _themeColor.surfaceContainerHighest),
                ),
                onPressed: () {},
                icon: SvgPicture.asset(AssetManager.MENU_ICON),
              ),
              actions: [
                BlocListener<LoginBloc, LoginState>(
                  listener: (context, state) {
                    context.goNamed(Routes.WELCOME_ROUTE);
                  },
                  child: IconButton(
                    icon: Icon(
                      Icons.logout_rounded,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    onPressed: () {
                      context.read<LoginBloc>().add(RequestSignOut());
                    },
                  ),
                ),
                IconButton.filled(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                        _themeColor.surfaceContainerHighest),
                  ),
                  onPressed: () {},
                  icon: SvgPicture.asset(AssetManager.CART_ICON),
                )
              ],
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                        '${Values.GREETINGS} ${LocalPreferences.getString('username')}'),
                    titleTextStyle: _themeText.titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                    subtitle: const Text(Values.WELCOME_SUB_TITLE),
                    subtitleTextStyle: _themeText.labelMedium,
                  ),
                  const CustomSearchBar(),
                  const Gap(20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Choose Brand',
                          style: _themeText.titleMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'View All',
                          style: _themeText.labelSmall,
                        )
                      ],
                    ),
                  ),
                  const Gap(10),
                  SizedBox(
                    height: layout.width * 0.13,
                    child: BlocBuilder<BrandBloc, BrandState>(
                      builder: (context, state) {
                        if (state is BrandFetchSuccessfully) {
                          return ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              if (index == 0) {
                                return const Gap(10);
                              }
                              return BrandCard(
                                brandLogo: state.brands[index].brandLogo,
                                brandTitle: state.brands[index].brandName,
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const Gap(8.0),
                            itemCount: state.brands.length,
                          );
                        } else {
                          return ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              if (index == 0) {
                                return const Gap(10);
                              }
                              return ShimmerEffect.rectangular(
                                  width: 70, height: layout.width * 1.3);
                            },
                            separatorBuilder: (context, index) =>
                                const Gap(8.0),
                            itemCount: 10,
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              const SliverToBoxAdapter(
                child: Gap(20),
              ),
              SliverToBoxAdapter(
                child: ListTile(
                  title: const Text('New Arrival'),
                  titleTextStyle: _themeText.titleMedium
                      ?.copyWith(fontWeight: FontWeight.w600),
                  trailing: Text(
                    'View All',
                    style: _themeText.labelSmall,
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(8.0),
                sliver: BlocBuilder<ProductBloc, ProductState>(
                  builder: (context, state) {
                    if (state is ProductFetchSuccess) {
                      return SliverGrid.builder(
                          itemCount: 10,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 8,
                                  crossAxisSpacing: 8,
                                  mainAxisExtent: layout.width * 0.7),
                                  // mainAxisExtent: layout.width * 0.63),
                          itemBuilder: (context, index) => ProductCard(
                                onItemTap: () {
                                  // context.pushNamed(Routes.PRODUCT_DETAILS_ROUTE);
                                  context.goNamed(Routes.PRODUCT_DETAILS_ROUTE);
                                  context.read<ProductBloc>().add(RequestFetchSingleProduct(state.products[index].productId));
                                },
                                productName:
                                    state.products[index].productName ??
                                        "Unknown",
                                productPrice:
                                    state.products[index].productPrice,
                                productThumbnail: state
                                    .products[index].imageGallery?.first.url,
                              ));
                    }
                    else {
                      return SliverToBoxAdapter(
                        child: Center(
                          child: LoadingAnimationWidget.hexagonDots(
                              color: _themeColor.primary, size: 35.w),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
