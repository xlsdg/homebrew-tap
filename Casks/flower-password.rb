cask "flower-password" do
  version "1.2.14"
  sha256 "cce5e31cffef77fd70cac6639071c3ab0bf3a8273cade2ae287ada9bd145874a"

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
