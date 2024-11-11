{ config, ... }:

{
  sops.secrets.my-password.neededForUsers = true;
  users = {
    users = {
      example = {
        isNormalUser = true;
        uid = 1001;
        hashedPasswordFile = config.sops.secrets.my-password.path;
      };
    };
  };
}
