# ref: https://github.com/ronilaukkarinen/mastodon-bird-ui

export MASTODON_VERSION_FOR_BIRD_UI="main"

# Create a new folder for the theme
mkdir -p mastodon_source/app/javascript/styles/mastodon-bird-ui

# Download the CSS file for single column layout
wget https://raw.githubusercontent.com/ronilaukkarinen/mastodon-bird-ui/$MASTODON_VERSION_FOR_BIRD_UI/layout-single-column.css -O mastodon_source/app/javascript/styles/mastodon-bird-ui/layout-single-column.scss

# Download the CSS file for multiple column layout
wget https://raw.githubusercontent.com/ronilaukkarinen/mastodon-bird-ui/$MASTODON_VERSION_FOR_BIRD_UI/layout-multiple-columns.css -O mastodon_source/app/javascript/styles/mastodon-bird-ui/layout-multiple-columns.scss

# Replace theme-contrast with theme-mastodon-bird-ui-contrast for single column layout
sed -i 's/theme-contrast/theme-mastodon-bird-ui-contrast/g' mastodon_source/app/javascript/styles/mastodon-bird-ui/layout-single-column.scss

# Replace theme-mastodon-light with theme-mastodon-bird-ui-light for single column layout
sed -i 's/theme-mastodon-light/theme-mastodon-bird-ui-light/g' mastodon_source/app/javascript/styles/mastodon-bird-ui/layout-single-column.scss

# Replace theme-contrast with theme-mastodon-bird-ui-contrast for multiple column layout
sed -i 's/theme-contrast/theme-mastodon-bird-ui-contrast/g' mastodon_source/app/javascript/styles/mastodon-bird-ui/layout-multiple-columns.scss

# Replace theme-mastodon-light with theme-mastodon-bird-ui-light for multiple column layout
sed -i 's/theme-mastodon-light/theme-mastodon-bird-ui-light/g' mastodon_source/app/javascript/styles/mastodon-bird-ui/layout-multiple-columns.scss

# Create high contrast theme file
echo -e "@import 'contrast/variables';\n@import 'application';\n@import 'contrast/diff';\n@import 'mastodon-bird-ui/layout-single-column.scss';\n@import 'mastodon-bird-ui/layout-multiple-columns.scss';" > mastodon_source/app/javascript/styles/mastodon-bird-ui-contrast.scss

# Create light theme file
echo -e "@import 'mastodon-light/variables';\n@import 'application';\n@import 'mastodon-light/diff';\n@import 'mastodon-bird-ui/layout-single-column.scss';\n@import 'mastodon-bird-ui/layout-multiple-columns.scss';" > mastodon_source/app/javascript/styles/mastodon-bird-ui-light.scss

# Create dark theme file
echo -e "@import 'application';\n@import 'mastodon-bird-ui/layout-single-column.scss';\n@import 'mastodon-bird-ui/layout-multiple-columns.scss';" > mastodon_source/app/javascript/styles/mastodon-bird-ui-dark.scss

# Write config into themes.yml
echo -e "mastodon-bird-ui-dark: styles/mastodon-bird-ui-dark.scss\nmastodon-bird-ui-light: styles/mastodon-bird-ui-light.scss\nmastodon-bird-ui-contrast: styles/mastodon-bird-ui-contrast.scss" >> mastodon_source/config/themes.yml

# Add i18n 
# ref: https://github.com/wxwmoe/mastodon
sed -i '/mastodon-light/a\    mastodon-bird-ui-dark: Mastodon Bird UI (Dark)\n    mastodon-bird-ui-contrast: Mastodon Bird UI (High contrast)\n    mastodon-bird-ui-light: Mastodon Bird UI (Light)' mastodon_source/config/locales/en.yml 
sed -i '/mastodon-light/a\    mastodon-bird-ui-dark: Mastodon Bird UI（暗色主题）\n    mastodon-bird-ui-contrast: Mastodon Bird UI（高对比度）\n    mastodon-bird-ui-light: Mastodon Bird UI（亮色主题）' mastodon_source/config/locales/zh-CN.yml 
sed -i '/mastodon-light/a\    mastodon-bird-ui-dark: Mastodon Bird UI（深色）\n    mastodon-bird-ui-contrast: Mastodon Bird UI（高對比）\n    mastodon-bird-ui-light: Mastodon Bird UI（亮色）' mastodon_source/config/locales/zh-TW.yml 
sed -i '/mastodon-light/a\    mastodon-bird-ui-dark: Mastodon Bird UI\n    mastodon-bird-ui-contrast: Mastodon Bird UI（高對比）\n    mastodon-bird-ui-light: Mastodon Bird UI（亮色主題）' mastodon_source/config/locales/zh-HK.yml 
sed -i '/mastodon-light/a\    mastodon-bird-ui-dark: Mastodon Bird UI (ダーク)\n    mastodon-bird-ui-contrast: Mastodon Bird UI (ハイコントラスト)\n    mastodon-bird-ui-light: Mastodon Bird UI (ライト)' mastodon_source/config/locales/ja.yml 

