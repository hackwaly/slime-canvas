git clone 'https://chromium.googlesource.com/chromium/tools/depot_tools.git'
export PATH="${PWD}/depot_tools:${PATH}"
git clone https://skia.googlesource.com/skia.git
cd skia
python tools/git-sync-deps
tools/install_dependencies.sh
bin/gn gen ../out/Release --args='is_official_build=false is_debug=false'
ninja -C ../out/Release
cd ../out/Release
zstd libskia.a
curl --upload-file libskia.a.zst https://transfer.sh/libskia-linux-$(git rev-parse --short HEAD).a.zst
