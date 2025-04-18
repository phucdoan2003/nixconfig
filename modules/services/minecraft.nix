{pkgs, ...}: {
  services.minecraft-servers = {
    enable = true;
    eula = true;
    openFirewall = true;

    servers = {
      skibidi = {
        enable = true;
        autoStart = true;
        package = pkgs.fabricServers.fabric;
        serverProperties = {
          difficulty = 3;
          white-list = true;
        };
        whitelist = {
          "syyr3nnn" = "e9274e0b-80ca-4ef9-9aaf-045e01d208d0";
          "Catouberos" = "4d15938d-1245-4086-a8d1-e43b6ea4720d";
        };
      };
    };
  };
}
