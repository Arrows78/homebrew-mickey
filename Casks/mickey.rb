cask "mickey" do
  version "0.4.1"
  sha256 "943746b54869f8a82ae4bceb4f47ebabe3d1e1b951520466e3a7cd54c7c6cd1b"

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
