# Homebrew cask for Mossbook, rendered by .github/workflows/homebrew.yml into the
# jakub-m-arch/homebrew-mossbook tap. Placeholders: 0.1.1, a4bf9504fccdc2ff6e811fc835172518e2e173c639bcdfd474935502d2be9a85, 8422b42c26ad2793f5ea92fd11615b419dd289fb7a854de8fc7f1197faaf910a.
cask "mossbook" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.1"
  sha256 arm:   "a4bf9504fccdc2ff6e811fc835172518e2e173c639bcdfd474935502d2be9a85",
         intel: "8422b42c26ad2793f5ea92fd11615b419dd289fb7a854de8fc7f1197faaf910a"

  url "https://github.com/jakub-m-arch/mossbook/releases/download/v#{version}/Mossbook_#{version}_#{arch}.dmg"
  name "Mossbook"
  desc "Private, offline well-being journal"
  homepage "https://github.com/jakub-m-arch/mossbook"

  depends_on :macos

  app "Mossbook.app"

  # No `zap` stanza on purpose: the app's data folder is the user's journal and
  # must never be removed by an uninstall command.

  caveats <<~EOS
    Mossbook is not notarized yet. The first time, right-click the app and choose
    Open (or allow it in System Settings > Privacy & Security).

    Your journal stays in ~/Library/Application Support/io.github.jakubmarch.mossbook
    when you uninstall. Keep a backup (Settings > Backup) before deleting it by hand.
  EOS
end
