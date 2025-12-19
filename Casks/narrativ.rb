cask "narrativ" do
  version "1.0.11"
  sha256 "8bede51882aa349490cbb02df1a92ea53f674140ad7840f260dd0879a5d8666c"

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
