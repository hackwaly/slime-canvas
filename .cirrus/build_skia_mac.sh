brew install ninja zstd python curl
git clone 'https://chromium.googlesource.com/chromium/tools/depot_tools.git'
export PATH="${PWD}/depot_tools:${PATH}"
git clone https://skia.googlesource.com/skia.git
cd skia
python tools/git-sync-deps
bin/gn gen ../out/Release --args='is_official_build=false is_component_build=true is_debug=false'
ninja -C ../out/Release
cd ../out/Release
zstd libskia.so
curl --upload-file libskia.so.zst https://transfer.sh/libskia-mac-$(git rev-parse --short HEAD).so.zst
