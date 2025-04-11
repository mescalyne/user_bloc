import 'package:async/async.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:userlist_app/app/app_theme.dart';
import 'package:userlist_app/app/localization/localization.dart';
import 'package:userlist_app/app/navigation/app_route.dart';
import 'package:userlist_app/features/user/domain/entities/user.dart';
import 'package:userlist_app/features/user/presentation/widgets/user_list_image.dart';

class UserList extends StatefulWidget {
  const UserList({
    required this.onUpdateList,
    required this.users,
    required this.isLoading,
    super.key,
  });
  final VoidCallback onUpdateList;
  final List<User> users;
  final bool isLoading;

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  ScrollController? _scrollController;
  final cache = AsyncCache<void>(const Duration(seconds: 1));

  @override
  void initState() {
    super.initState();
    _scrollController =
        ScrollController()..addListener(() {
          cache.fetch(() async {
            if (_scrollController != null) {
              final nextPageTrigger =
                  _scrollController!.position.maxScrollExtent - 25;

              if (_scrollController!.position.pixels > nextPageTrigger &&
                  !widget.isLoading) {
                widget.onUpdateList();
              }
            }
            return;
          });
        });
  }

  void initScrollController() {}

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final users = widget.users;

    return ListView.builder(
      controller: _scrollController,
      itemCount: widget.isLoading ? users.length + 1 : users.length,
      itemBuilder: (context, index) {
        if (index < users.length) {
          final user = users[index];
          return _UserListElement(user: user);
        } else {
          return const _UserListLoader();
        }
      },
    );
  }
}

class _UserListElement extends StatelessWidget {
  const _UserListElement({required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        AutoRouter.of(context).push(UserInfoRoute(user: user));
      },
      minTileHeight: 96,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      titleAlignment: ListTileTitleAlignment.center,
      title: Row(
        children: [
          GradientImageLoader(
            imageUrl: user.image,
            borderRadius: BorderRadius.circular(20),
            width: 60,
            height: 60,
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${user.firstName} ${user.lastName}',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 2),
              Text(user.address.country, style: const TextStyle(fontSize: 14)),
              const SizedBox(height: 2),
              Text(
                '${user.age} ${context.localize('years')}',
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _UserListLoader extends StatelessWidget {
  const _UserListLoader();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minTileHeight: 96,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      titleAlignment: ListTileTitleAlignment.center,
      title: Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            context.theme.white.withValues(alpha: 0.6),
          ),
        ),
      ),
    );
  }
}
