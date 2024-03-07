import 'package:bs23_task/core/utils/size_utils.dart';
import 'package:bs23_task/presentation/details_screen/details_screen.dart';
import 'package:bs23_task/presentation/home_screen/repository_list_bloc/repository_list_bloc.dart';
import 'package:bs23_task/presentation/home_screen/repository_list_bloc/repository_list_bloc.dart';
import 'package:bs23_task/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController scrollController = ScrollController();
  RepositoryListBloc repositoryListBloc = RepositoryListBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // scrollController.addListener(() {
    //   // call your api here
    // });
    repositoryListBloc.add(RepositoryListLoadedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: Text(
            'Repository List',
            style: TextStyle(fontSize: 19.fSize, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          height: 54.v,
          actions: [
            PopupMenuButton(
              onSelected: (value) {
                // Handle the selected option
                print('Selected option: $value');
              },
              itemBuilder: (BuildContext context) {
                return ['Filter by Date', 'Filter by star'].map((String option) {
                  return PopupMenuItem(
                    value: option,
                    child: Text(option),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.v),
          child: BlocBuilder<RepositoryListBloc, RepositoryListState>(
            bloc: repositoryListBloc,
            builder: (context, state) {
              if (state is RepositoryListInitialState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is RepositoryListLoadedState) {
                return ListView.separated(
                  controller: scrollController,
                  itemCount: state.repositoryList.length,
                  itemBuilder: (BuildContext context, int index) {
                    // your code
                    return ListTile(
                      tileColor: Colors.grey[100],
                      title: Text(
                        state.repositoryList[index]['id'].toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.adaptSize,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      leading: Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 24.adaptSize,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward,
                        color: Colors.blue,
                        size: 24.adaptSize,
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(ownerData: state.repositoryList[index])));
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 4.v);
                  },
                );
              } else {
                return const Text('error');
              }
            },
          ),
        ),
      ),
    );
  }
}
