import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import '../themes/app_theme.dart';
import '../../core/constants/image_paths.dart';
import '../../features/profile/presentation/mobx/profile_store.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/notifications/presentation/widgets/notification_bell.dart';

class AppHeader extends StatelessWidget {
  final String? title;
  final String subtitle;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onLeadingTap;
  final bool showBackButton;
  final ProfileStore? profileStore;

  const AppHeader({
    super.key,
    this.title,
    this.subtitle = 'Welcome back!',
    this.leading,
    this.trailing,
    this.onLeadingTap,
    this.showBackButton = false,
    this.profileStore,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          // Leading: back button or profile avatar
          leading ??
              (showBackButton
                  ? _buildSystemLikeBackButton(context)
                  : (profileStore != null
                      ? Observer(builder: (_) => _buildProfileAvatar(context))
                      : const SizedBox.shrink())),

          const SizedBox(width: 12),

          // Title section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 12,
                  ),
                ),
                if (title != null)
                  Text(
                    title!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                else if (profileStore != null)
                  Observer(
                    builder: (_) => Text(
                      profileStore!.user?.name ?? 'Start Recycling Today',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
              ],
            ),
          ),

          // Trailing: notification bell (or custom trailing)
          trailing ??
              NotificationBell(
                iconColor: Colors.white,
                iconSize: 20,
              ),
        ],
      ),
    );
  }

  Widget _buildSystemLikeBackButton(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        } else {
          // Root of the app → show confirm exit dialog
          final bool? shouldExit = await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: const Color(0xFF1A1A2E),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              title: const Text(
                'Exit App',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              content: const Text(
                'Do you want to close the application?',
                style: TextStyle(color: Colors.white70),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text(
                    'Exit',
                    style: TextStyle(color: Colors.redAccent),
                  ),
                ),
              ],
            ),
          );

          if (shouldExit == true) {
            SystemNavigator.pop();
          }
        }
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.arrow_back_rounded,
          color: Colors.white,
          size: 22,
        ),
      ),
    );
  }

  Widget _buildProfileAvatar(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProfilePage(),
          ),
        );
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppTheme.primaryGreen,
          shape: BoxShape.circle,
        ),
        child: profileStore!.user?.profilePhoto != null &&
                profileStore!.user!.profilePhoto!.isNotEmpty
            ? ClipOval(
                child: CachedNetworkImage(
                  imageUrl: profileStore!.user!.profilePhoto!,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                  httpHeaders: const {
                    'User-Agent': 'Mozilla/5.0',
                  },
                  placeholder: (context, url) => Container(
                    color: AppTheme.primaryGreen,
                    child: const Center(
                      child: SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) {
                    return Image.asset(
                      ImagePaths.avatar,
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              )
            : Image.asset(
                ImagePaths.avatar,
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
