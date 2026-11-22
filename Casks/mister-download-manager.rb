cask "mister-download-manager" do
  arch arm: "arm64", intel: "x86_64"

  version "0.5.2"
  sha256 arm:   "0217160ba08f56c5dad07642508828f259fcc283ed0b930514af712cf01aeea6",
         intel: "1c4bbdf1450a841299db658d74dcb4db9912deaafd119f26557f0b4ba4951f8a"

  url "https://github.com/anefzaoui/misterdownloadmanager/releases/download/v#{version}/MisterDownloadManager-#{version}-macos-#{arch}-experimental.dmg"
  name "Mister Download Manager"
  desc "Open-source multi-connection download manager"
  homepage "https://misterdownloadmanager.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur

  app "Mister Download Manager.app"
  binary "#{appdir}/Mister Download Manager.app/Contents/MacOS/misterdownloadmanager-cli", target: "mdm"

  uninstall quit: "io.github.anefzaoui.misterdownloadmanager"

  zap trash: [
    "~/Library/Application Support/misterdownloadmanager",
    "~/Library/Caches/io.github.anefzaoui.misterdownloadmanager",
    "~/Library/Preferences/io.github.anefzaoui.misterdownloadmanager.plist",
    "~/Library/Saved Application State/io.github.anefzaoui.misterdownloadmanager.savedState",
  ]

  caveats <<~EOS
    Mister Download Manager for macOS is currently experimental and ad-hoc signed (not notarized by Apple).
    On first launch, if macOS Gatekeeper blocks it, open System Settings -> Privacy & Security -> Open Anyway.
    To keep Homebrew as the single update source, turn off "Check for updates at every start" in Help -> Check for updates.
  EOS
end
