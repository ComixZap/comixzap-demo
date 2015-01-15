api_root="http://cz-api-demo.coverslide.me"

cwd=$(pwd)

pushd $(dirname $0) > /dev/null
scriptdir=$(pwd)
popd > /dev/null


rootdir=$(dirname "$scriptdir")
browserdir="$rootdir/.comixzap-browser-ui"

cd "$browserdir"
npm install
echo '{"api_root":"'$api_root'"}' > config.json
APPLICATION_ENVIRONMENT=production ./node_modules/.bin/gulp build --verbose

cp dist/index.html "$rootdir/"
cp -r dist/css "$rootdir/"
cp -r dist/js "$rootdir/"

cd "$cwd"
