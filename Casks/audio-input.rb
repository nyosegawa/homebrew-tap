cask "audio-input" do
  version "1.0.2"
  sha256 :no_check

  url "https://github.com/nyosegawa/audio-input/releases/download/v#{version}/AudioInput.dmg"
  name "AudioInput"
  desc "AI voice input tool for macOS menu bar"
  homepage "https://github.com/nyosegawa/audio-input"

  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64

  app "AudioInput.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/AudioInput.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/AudioInput",
    "~/Library/Preferences/com.nyosegawa.audio-input.plist",
  ]
end
