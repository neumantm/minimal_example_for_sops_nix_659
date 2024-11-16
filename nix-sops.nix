{config, pkgs, ...}:

{
  sops.age.keyFile = "/etc/age-keys.txt";
  sops.defaultSopsFile = ./secrets/main.yaml;
  # disable importing host ssh keys
  sops.gnupg.sshKeyPaths = [];

  sops.secrets.example_key = {};
  sops.templates."some.conf".content = ''
    pass = ${config.sops.placeholder.example_key}
  '';
  sops.secrets.my-password.neededForUsers = true;
}
