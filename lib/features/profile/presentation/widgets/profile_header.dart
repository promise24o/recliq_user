import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/constants/image_paths.dart';
import '../../../../shared/themes/app_theme.dart';
import '../mobx/profile_store.dart';

class ProfileHeader extends StatelessWidget {
  final ProfileStore profileStore;
  final VoidCallback onUploadPhoto;

  const ProfileHeader({
    super.key,
    required this.profileStore,
    required this.onUploadPhoto,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Profile Photo
            GestureDetector(
              onTap: onUploadPhoto,
              child: Stack(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[800],
                    ),
                    child: profileStore.user?.profilePhoto != null
                        ? ClipOval(
                            child: CachedNetworkImage(
                              imageUrl: profileStore.user!.profilePhoto!,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Container(
                                color: Colors.grey[800],
                              ),
                              errorWidget: (context, url, error) => Image.asset(
                                ImagePaths.avatar,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : Image.asset(
                            ImagePaths.avatar,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        color: AppTheme.primaryGreen,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              profileStore.user?.name ?? 'User Name',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              profileStore.user?.email ?? 'user@example.com',
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
