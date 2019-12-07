import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upsplash_app/blocs/collection_list/bloc.dart';
import 'package:upsplash_app/repository/collection_repository.dart';
import 'package:upsplash_app/ui/widgets/bottom_loader.dart';

class CollectionListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocProvider(
      create: (context) => CollectionListBloc(MainCollectionRepository()),
      child: _CollectionListWidget());
}

class _CollectionListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CollectionListState();
}

class _CollectionListState extends State<_CollectionListWidget>
    with AutomaticKeepAliveClientMixin {
  CollectionListBloc _bloc;
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    _bloc = BlocProvider.of<CollectionListBloc>(context)..add(FetchEvent());
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _bloc.add(FetchEvent());
    }
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CollectionListBloc, CollectionListState>(
      builder: (context, state) {
        if (state is CollectionListError)
          return Center(
            child: Text("error"),
          );
        if (state is InitialCollectionListState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CollectionListLoaded) {
          return ListView.builder(
              itemCount: state.collections.length + 1,
              controller: _scrollController,
              itemBuilder: (context, index) {
                if (index >= state.collections.length) return BottomLoader();

                final item = state.collections[index];
                double displayHeight = MediaQuery.of(context).size.height;
                double displayWidth = MediaQuery.of(context).size.width;

                return Stack(children: <Widget>[
                  Image.network(item.coverPhoto.urls.regular,
                      height: displayHeight / 3,
                      width: displayWidth,
                      fit: BoxFit.cover),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Text(
                      item.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                  ),
                ]);
              });
        }

        return Center();
      },
    );
  }
}
