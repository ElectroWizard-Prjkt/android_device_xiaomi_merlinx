# Hardcode High Memory Parallel Process
export NINJA_HIGHMEM_NUM_JOBS=1

# GMS Partition Size Enabler
export WITH_GMS=true

# Media: Import extractor changes from t-alps-q0.mp1-V9.122.1
git -C "frameworks/av" am <<<"$(curl -sL "https://github.com/orkunsdumps/android_frameworks_av/commit/0fce53bdf414efc4fa42c5bccab20eafb97816c9.patch")"
6
# begonia: media: libstagefright: Limit max width/height to display size
git -C "frameworks/av" am <<<"$(curl -sL "https://github.com/orkunsdumps/android_frameworks_av/commit/7e5ed12f933dd5c0b43b54e588cdc0e6ee39dd2d.patch")"

# Media: Import codecs/omx changes from t-alps-q0.mp1-V9.122.1
git -C "frameworks/av" am <<<"$(curl -sL "https://github.com/orkunsdumps/android_frameworks_av/commit/fd880bdb6742564e6567fea55949117ee5cdfbbd.patch")"

# stagefright: remove HW_TEXTRUE usage from SurfaceMediaSource
git -C "frameworks/av" am <<<"$(curl -sL "https://github.com/orkunsdumps/android_frameworks_av/commit/4cdfda973cdb4e5a283fe57c5e6491f766c287c6.patch")"

# REThreaded: Use gen- and delete- textures on all render engines
git -C "frameworks/native" am <<<"$(curl -sL "https://github.com/begonia-dev/android_frameworks_native/commit/16eb76b5b1aa021dc3f00852c50a2f1fcf282088.patch")"

# Sepolicy vendor
rm -rf device/mediatek/sepolicy_vndr
git clone --depth 1 https://github.com/PixelBuildsROM/android_device_mediatek_sepolicy_vndr -b unity device/mediatek/sepolicy_vndr

# Hardware trees
rm -rf hardware/mediatek
rm -rf hardware/xiaomi
git clone --depth 1 https://github.com/PixelBuildsROM/android_hardware_mediatek -b unity hardware/mediatek
git clone --depth 1 https://github.com/PixelBuildsROM/android_hardware_xiaomi -b unity hardware/xiaomi
