cask "clashx" do
  version "1.96.2"
  sha256 "26dc384905bb55b10324c8ba690d8ca52d6a99bb3b491b9bb96cfa86ed0efa86"

  url "https://github.com/yichengchen/clashX/releases/download/#{version}/ClashX.dmg"
  name "ClashX"
  desc "Rule-based custom proxy with GUI based on clash"
  homepage "https://github.com/yichengchen/clashX"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :sierra"

  app "ClashX.app"

  uninstall delete:    [
              "/Library/LaunchDaemons/com.west2online.ClashX.ProxyConfigHelper.plist",
              "/Library/PrivilegedHelperTools/com.west2online.ClashX.ProxyConfigHelper",
            ],
            launchctl: "com.west2online.ClashX.ProxyConfigHelper",
            quit:      "com.west2online.ClashX"

  zap trash: [
    "~/Library/Application Support/com.west2online.ClashX",
    "~/Library/Caches/com.crashlytics.data/com.west2online.ClashX",
    "~/Library/Caches/com.west2online.ClashX",
    "~/Library/Caches/io.fabric.sdk.mac.data/com.west2online.ClashX",
    "~/Library/Cookies/com.west2online.ClashX.binarycookies",
    "~/Library/Logs/ClashX",
    "~/Library/Preferences/com.west2online.ClashX.plist",
    "~/.config/clash/",
  ]
end
