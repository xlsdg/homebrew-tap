cask "flower-password" do
  version "1.2.20"
  sha256 "e260e588f1559223b4f8f1b65105920e40b2cd3643a5545854b2dd4d8685dc84"

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
