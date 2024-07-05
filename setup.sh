echo "Cleaning up..."
rm -rf mastodon_source
echo "Fetching the mastodon source online..."
git clone -b v4.2.10 --single-branch --depth=1 https://github.com/mastodon/mastodon.git mastodon_source
echo "Patching mastodon source..."
sh ./patch.sh
sed -i 's|ARG MASTODON_VERSION_METADATA=""|ARG MASTODON_VERSION_METADATA="yai"|' mastodon_source/Dockerfile
sed -i '/ARG MASTODON_VERSION_METADATA="yai"/a\ARG GITHUB_REPOSITORY="lori3f6/mastodon"' mastodon_source/Dockerfile
echo "Setup done!"

