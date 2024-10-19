echo "Setting up tanderine ui..."

repo_folder=tmp/tangerine-ui
mastodon_folder=mastodon_source

git clone -b main --single-branch --depth=1 https://github.com/nileane/TangerineUI-for-Mastodon.git $repo_folder

cp -rv $repo_folder/mastodon/app/javascript/styles/* $mastodon_folder/app/javascript/styles

echo "tangerineui: styles/tangerineui.scss" >> $mastodon_folder/config/themes.yml
echo "tangerineui-purple: styles/tangerineui-purple.scss" >> $mastodon_folder/config/themes.yml
echo "tangerineui-cherry: styles/tangerineui-cherry.scss" >> $mastodon_folder/config/themes.yml
echo "tangerineui-lagoon: styles/tangerineui-lagoon.scss" >> $mastodon_folder/config/themes.yml

sed -i '/mastodon-light/a\    tangerineui: Tangerine UI\n    tangerineui-purple: Tangerine UI (Purple)\n    tangerineui-cherry: Tangerine UI (Cherry)\n    tangerineui-lagoon: Tangerine UI (Lagoon)' $mastodon_folder/config/locales/en.yml
sed -i '/mastodon-light/a\    tangerineui: Tangerine UI\n    tangerineui-purple: Tangerine UI（紫）\n    tangerineui-cherry: Tangerine UI（樱）\n    tangerineui-lagoon: Tangerine UI（礁湖）' $mastodon_folder/config/locales/zh-CN.yml
sed -i '/mastodon-light/a\    tangerineui: Tangerine UI\n    tangerineui-purple: Tangerine UI（紫）\n    tangerineui-cherry: Tangerine UI（櫻）\n    tangerineui-lagoon: Tangerine UI（礁湖）' $mastodon_folder/config/locales/zh-TW.yml
sed -i '/mastodon-light/a\    tangerineui: Tangerine UI\n    tangerineui-purple: Tangerine UI（紫）\n    tangerineui-cherry: Tangerine UI（櫻）\n    tangerineui-lagoon: Tangerine UI（礁湖）' $mastodon_folder/config/locales/zh-HK.yml
sed -i '/mastodon-light/a\    tangerineui: Tangerine UI\n    tangerineui-purple: Tangerine UI (パープル)\n    tangerineui-cherry: Tangerine UI (チェリー)\n    tangerineui-lagoon: Tangerine UI (ラグーン)' $mastodon_folder/config/locales/ja.yml



