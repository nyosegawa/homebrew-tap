cask "markdown-viewer" do
  version "0.1.0"
  sha256 "e4a387b693410a9916bbc7b6b2ea5b1bff92cd71abc430dcddbabd327c77b1e7"

  url "https://github.com/nyosegawa/markdown-viewer/releases/download/v#{version}/markdown-viewer_#{version}_universal.dmg"
  name "markdown-viewer"
  desc "Fast native Markdown viewer"
  homepage "https://github.com/nyosegawa/markdown-viewer"

  depends_on macos: ">= :big_sur"

  app "markdown-viewer.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/markdown-viewer.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/markdown-viewer",
    "~/Library/Preferences/com.nyosegawa.markdownviewer.plist",
  ]
end
