{ pkgs, config, ... }:

{
  # Install firefox.
  programs.firefox = {
    enable = true;
    preferences = {
      # Disable sponsored content, because I hate it.
      "browser.newtabpage.activity-stream.discoverystream.newSponsoredLabel.enabled" = false;
      "browser.newtabpage.activity-stream.showSponsored" = false;
      "browser.newtabpage.activity-stream.showSponsoredCheckboxes" = false;
      "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
      "browser.newtabpage.activity-stream.system.showSponsored" = false;
      "browser.urlbar.sponsoredTopSites" = false;
      "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
      "browser.urlbar.suggest.quicksuggest.sponsored" = false;
      "services.sync.prefs.sync-seen.browser.newtabpage.activity-stream.showSponsored" = false;
      "services.sync.prefs.sync-seen.browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
      "services.sync.prefs.sync.browser.newtabpage.activity-stream.showSponsored" = false;
      "services.sync.prefs.sync.browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
    };
  }
  programs.firefox.enable = true;
}
