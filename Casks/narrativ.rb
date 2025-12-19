cask "narrativ" do
  version "1.0.7"
  sha256 "e58bf21430240753fedf001c7e126f8edc14ebfac0a6928da0ca74b94ebb4c47"

  url "https://github.com/chaiovercode/homebrew-getnarrativ/releases/download/v#{version}/Narrativ_#{version}_aarch64.dmg"
  name "Narrativ"
  desc "AI-powered visual storytelling app"
  homepage "https://chaiovercode.com/narrativ"

  depends_on arch: :arm64
  depends_on macos: ">= :monterey"

  app "Narrativ.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Narrativ.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/com.narrativ.app",
    "~/Library/Caches/com.narrativ.app",
    "~/Library/Preferences/com.narrativ.app.plist",
  ]
end
