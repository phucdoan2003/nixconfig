{
  services.syncthing = {
    enable = true;
    settings = {
      devices = {
        "lap" = {id = "LW67UVM-AB6RRT3-2PLQRSE-FBEE35X-7ZDSV7C-HPZEU4X-JWTZI7W-7VOJRAL";};
        "home" = {id = "EM3KOMP-5T6F5KL-NMKYSBK-4OP7ELL-F2WTGS4-OYPMEVH-CGJCSUR-EXCPHAZ";};
      };
      folders = {
        "Documents" = {
          path = "/home/phuc/Documents";
          devices = ["lap" "home"];
        };
      };
    };
  };
}
