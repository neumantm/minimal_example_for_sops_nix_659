{ config, ... }:

{
  sops.secrets.my-password.neededForUsers = true;
}
