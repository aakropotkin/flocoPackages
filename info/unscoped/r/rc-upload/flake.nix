{

  inputs.packument.url   = "https://registry.npmjs.org/rc-upload?rev=150-a7ba9bfa4098e0cc1c39c9cd271e46f1";
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
    ident = "rc-upload";
    ldir  = "info/unscoped/r/rc-upload";
    inherit packument fetchInfo;
  } // latest';

}
