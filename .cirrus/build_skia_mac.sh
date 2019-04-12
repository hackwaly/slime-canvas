brew install ninja python curl
git clone 'https://chromium.googlesource.com/chromium/tools/depot_tools.git'
export PATH="${PWD}/depot_tools:${PATH}"
git clone https://skia.googlesource.com/skia.git
cd skia
python tools/git-sync-deps
bin/gn gen ../out/Release --args='is_official_build=false is_debug=false'
ninja -C ../out/Release
cd ../out/Release
curl --upload-file ./libskia.a https://transfer.sh/libskia-$(git rev-parse --short HEAD).a
