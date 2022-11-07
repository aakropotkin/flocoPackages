{

  inputs.packument.url   = "https://registry.npmjs.org/rc-tree?rev=311-2d35c0b11f843c14d4431bf533663fe7";
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
    ident = "rc-tree";
    ldir  = "info/unscoped/r/rc-tree";
    inherit packument fetchInfo;
  } // latest';

}
