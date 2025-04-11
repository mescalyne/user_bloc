import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:userlist_app/app/app_theme.dart';
import 'package:userlist_app/app/extensions/format_date.dart';
import 'package:userlist_app/app/localization/localization.dart';
import 'package:userlist_app/features/user/domain/entities/user.dart';

@RoutePage()
class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({required this.user, super.key});
  static const routeName = '/user';
  final User user;

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        child: CustomScrollView(
          slivers: [
            _CustomSliverAppBar(image: widget.user.image),
            _BodyCustomSliverBox(user: widget.user),
          ],
        ),
      ),
    );
  }
}

class _TextInfoWidget extends StatelessWidget {
  const _TextInfoWidget({required this.title, required this.info});
  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: context.theme.text2,
            ),
          ),
          const TextSpan(text: ': '),
          TextSpan(
            text: info,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: context.theme.text1,
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomSliverAppBar extends StatelessWidget {
  const _CustomSliverAppBar({required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenPadding = MediaQuery.of(context).padding;
    final appBarHeight = screenSize.width * 0.45 + screenPadding.top;

    return SliverAppBar(
      backgroundColor: Colors.transparent,
      expandedHeight: appBarHeight,
      pinned: true,
      stretch: true,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final expandRatio = ((constraints.maxHeight - kToolbarHeight) /
                  (appBarHeight - kToolbarHeight))
              .clamp(0.0, 1.0);

          final imageSize = (screenSize.width * 0.426) * expandRatio;

          return Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                left: -screenSize.width * 0.1,
                top: 0,
                bottom: 0,
                width: screenSize.width * 1.2,
                child: Container(
                  decoration: BoxDecoration(
                    color: context.theme.black.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(screenSize.width * 0.33),
                      bottomRight: Radius.circular(screenSize.width * 0.33),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                bottom: 0,
                width: screenSize.width,
                child: Container(
                  decoration: BoxDecoration(
                    color: context.theme.black.withValues(
                      alpha: 0.2 * expandRatio,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(screenSize.width * 0.33),
                      bottomRight: Radius.circular(screenSize.width * 0.33),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                child: Center(
                  child: Container(
                    width: screenSize.width * 0.77,
                    decoration: BoxDecoration(
                      color: context.theme.black.withValues(
                        alpha: 0.2 * expandRatio,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(screenSize.width * 0.33),
                        bottomRight: Radius.circular(screenSize.width * 0.33),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                child: Center(
                  child: Container(
                    width: screenSize.width * 0.568,
                    decoration: BoxDecoration(
                      color: context.theme.black.withValues(
                        alpha: 0.2 * expandRatio,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(screenSize.width * 0.33),
                        bottomRight: Radius.circular(screenSize.width * 0.33),
                      ),
                    ),
                  ),
                ),
              ),
              if (expandRatio > 0.3)
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Center(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      width: imageSize,
                      height: imageSize,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            imageSize * 0.375,
                          ),
                          color: context.theme.white,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            opacity: expandRatio * 2 > 1 ? 1 : expandRatio * 2,
                            image: NetworkImage(image),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              Positioned(
                left: -screenSize.width * 0.1,
                top: 0,
                bottom: 0,
                width: screenSize.width * 1.2,
                child: Container(
                  width: screenSize.width,
                  height: 300,
                  decoration: BoxDecoration(
                    color: context.theme.black.withValues(
                      alpha: 1 - expandRatio,
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                      bottomRight: Radius.circular(100),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _BodyCustomSliverBox extends StatelessWidget {
  const _BodyCustomSliverBox({required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    colors: [context.theme.white, context.theme.purple],
                  ).createShader(bounds);
                },
                child: Text(
                  '${user.firstName} ${user.lastName}',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                    color: context.theme.text1,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.localize('dateOfBirth'),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: context.theme.text2,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  '•',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: context.theme.text2.withValues(alpha: 0.4),
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  formatDate(user.birthDate),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: context.theme.text2,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _TextInfoWidget(title: context.localize('email'), info: user.email),
            const SizedBox(height: 14),
            _TextInfoWidget(
              title: context.localize('address'),
              info: user.address.toString(),
            ),
            const SizedBox(height: 14),
            _TextInfoWidget(
              title: context.localize('company'),
              info: user.company.toString(),
            ),
            const SizedBox(height: 14),
            _TextInfoWidget(title: context.localize('role'), info: user.role),
            const SizedBox(height: 14),
            _TextInfoWidget(
              title: context.localize('university'),
              info: user.university,
            ),
            const SizedBox(height: 24),
            Text(
              context.localize('loremIpsum'),
              style: TextStyle(fontSize: 12, color: context.theme.text1),
            ),
          ],
        ),
      ),
    );
  }
}
