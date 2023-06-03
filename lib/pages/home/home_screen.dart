import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/home/home_bloc.dart';
import '../../service/dummy_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("My First App"),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  restorationId: "MenuList",
                  itemCount: items.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return MenuCardWidget(
                      isSelected: (state.currentMenu == index) ? true : false,
                      title: items[index].title,
                      subtitle: items[index].subTitle,
                      icon: items[index].icon,
                      color: items[index].color,
                      ontap: () {
                        context.read<HomeBloc>().add(OnMenuChangeEvent(index));
                      },
                    );
                  },
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text("${state.currentMenu}"),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

class MenuCardWidget extends StatelessWidget {
  const MenuCardWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.icon,
    required this.ontap,
    required this.isSelected,
  });
  final String title;
  final String subtitle;
  final Color color;
  final IconData icon;
  final Function() ontap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: isSelected ? Colors.white : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12.0)),
          child: InkWell(
            onTap: ontap,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                // first child for icon
                Container(
                  decoration: BoxDecoration(
                      color: color.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Icon(
                    icon,
                    size: 30,
                    color: color,
                  ),
                ),
                const SizedBox(width: 8.0),
                // second child for title and sub title
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
