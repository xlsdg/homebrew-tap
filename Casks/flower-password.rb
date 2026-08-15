cask "flower-password" do
  version "1.2.8"
  sha256 "50fd49e3847848ba6396d6458db9065af29f3ed02262399d154bd7a3ee0d35fe"

  url "https://github.com/xlsdg/flower-password-swift/releases/download/v#{version}/FlowerPassword-#{version}.zip"
  name "FlowerPassword"
  desc "Menu bar password generator using the Flower Password method"
  homepage "https://github.com/xlsdg/flower-password-swift"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

  app "FlowerPassword.app"

  uninstall quit: "org.xlsdg.flowerpassword"

  zap trash: "~/Library/Preferences/org.xlsdg.flowerpassword.plist"

  caveats <<~EOS
    FlowerPassword is not notarized. Either reinstall with:
      brew reinstall --cask --no-quarantine flower-password
    or approve it once in System Settings > Privacy & Security after the
    first launch is blocked.
  EOS
end
