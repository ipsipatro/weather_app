import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/constants/app_strings.dart';
import 'package:weather_app/core/theme/app_pallete.dart';
import '../bloc/weather_bloc.dart';
import '../bloc/weather_event.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 64, 24, 10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              cursorHeight: 16.0,
              cursorColor: AppPallete.blueGray900,
              controller: searchController,
              decoration: const InputDecoration(
                hintText: AppStrings.searchLocation,
              ),
              onSubmitted: (query) {
                searchForQuery(query, context);
              },
              textAlignVertical: TextAlignVertical.center,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.search),
            color: AppPallete.gray400,
            onPressed: () {
              final query = searchController.text;
              searchForQuery(query, context);
            },
          ),
        ],
      ),
    );
  }

  void searchForQuery(String query, BuildContext context) {
    if (query.isNotEmpty) {
      context.read<WeatherBloc>().add(FetchWeatherEvent(query));
      searchController.clear();
    }
  }
}
