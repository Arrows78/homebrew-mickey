cask "mickey" do
  version "0.3.1"
  sha256 "d4f8e6486b908f74643ed9ee0c1adf83fd28630962a970de68ecaf14e9e982b7"

  url "https://github.com/Arrows78/Mickey/releases/download/v#{version}/Mickey-#{version}.zip"
  name "Mickey"
  desc "Cursor highlighter and presentation toolkit"
  homepage "https://github.com/Arrows78/Mickey"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Mickey.app"

  # Recordings in ~/Movies/Mickey are the user's files: they are never removed.
  zap trash: [
    "~/Library/Containers/dev.local.mickey",
    "~/Library/Preferences/dev.local.mickey.plist",
  ]

  caveats <<~EOS
    Mickey is signed ad hoc and not notarized, so macOS blocks the first launch.
    Open System Settings > Privacy & Security and click "Open Anyway",
    or run: xattr -dr com.apple.quarantine /Applications/Mickey.app
  EOS
end
