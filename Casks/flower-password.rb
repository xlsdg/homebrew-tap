cask "flower-password" do
  version "1.2.21"
  sha256 "1f1a988b83750fbf11b61633b75ccf6e6ded003acf35d621b8ab1d49d96f858a"

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
