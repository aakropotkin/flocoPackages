{

  inputs.packument.url   = "https://registry.npmjs.org/rc-switch?rev=49-675bc3ef7232f7d39e832119d4fa613d";
  inputs.packument.flake = false;

  outputs = inputs: let
    importJSON = f: builtins.fromJSON ( builtins.readFile f );
    packument  = importJSON inputs.packument;
    fetchInfo  = if ! builtins.pathExists ./fetchInfo.json then {} else
                 importJSON ./fetchInfo.json;
    latest'    = if ! ( packument ? dist-tags.latest ) then {} else {
      latestVersion = packument.dist-tags.latest;
      latest        = packument.versions.${packument.dist-tags.latest};
    };
  in {
    scope = null;
    ident = "rc-switch";
    ldir  = "info/unscoped/r/rc-switch";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
