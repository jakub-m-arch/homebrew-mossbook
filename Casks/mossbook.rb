# Homebrew cask for Mossbook, rendered by .github/workflows/homebrew.yml into the
# jakub-m-arch/homebrew-mossbook tap. Placeholders: 0.1.3, 528bd1e9fefd1d2fcd35768450420054054e91d6aad0ac65038dda6b57491ddd, 029cef71112ce776a7c4a10828ada8a12b3dcd14d1fb201183813c8889703a20.
cask "mossbook" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.3"
  sha256 arm:   "528bd1e9fefd1d2fcd35768450420054054e91d6aad0ac65038dda6b57491ddd",
         intel: "029cef71112ce776a7c4a10828ada8a12b3dcd14d1fb201183813c8889703a20"

  url "https://github.com/jakub-m-arch/mossbook/releases/download/v#{version}/Mossbook_#{version}_#{arch}.dmg"
  name "Mossbook"
  desc "Private, offline well-being journal"
  homepage "https://github.com/jakub-m-arch/mossbook"

  depends_on :macos

  app "Mossbook.app"

  # Mossbook is not notarized yet. Without this, macOS refuses to open the
  # downloaded app ("damaged" or "cannot be verified"). Homebrew has already
  # checked the download's SHA-256 against this cask before installing it.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Mossbook.app"]
  end

  # No `zap` stanza on purpose: the app's data folder is the user's journal and
  # must never be removed by an uninstall command.

  caveats <<~EOS
    Your journal stays in ~/Library/Application Support/io.github.jakubmarch.mossbook
    when you uninstall. Keep a backup (Settings > Backup) before deleting it by hand.
  EOS
end
