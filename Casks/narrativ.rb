cask "narrativ" do
  version "1.0.3"
  sha256 "aeadf87648467b35bd41f120f96e51667c75e87e61d65a776605a83491f3e7c0"

  url "https://github.com/chaiovercode/getnarrativ/releases/download/v#{version}/Narrativ_#{version}_aarch64.dmg"
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
