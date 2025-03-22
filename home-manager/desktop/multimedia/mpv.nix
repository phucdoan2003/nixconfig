{
  pkgs,
  config,
  inputs,
  ...
}: {
  programs.mpv = {
    enable = true;
      config = {
      # general
      keep-open = true;
      fullscreen = true;
      save-position-on-quit = true;

      # video
      alang = "ja,jp";
      slang = "enm,nm,eng";
      demuxer-mkv-subtitle-preroll = true;
      sub-fix-timing = true;
      sub-auto = "fuzzy";
      profile = "high-quality";
      hwdec = "auto";
      vo = "gpu,libmpv";

      # subtitles
      sub-font = "Inter";

      # audio
      volume = 80;

      # screenshot
      screenshot-format = "jpg";
      screenshot-jpeg-quality = 100;
      screenshot-directory = "${config.home.homeDirectory}/Pictures/mpv";
      screenshot-template = "%f-%wH.%wM.%wS.%wT-#%#00n";

      # yt-dlp
      ytdl-format = "bestvideo+bestaudio";
    };
  };
}
