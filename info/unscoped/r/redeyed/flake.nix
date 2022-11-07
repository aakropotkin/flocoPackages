{

  inputs.packument.url   = "https://registry.npmjs.org/redeyed?rev=69-fa0bb35f4d87a2cdc2500386d8a1180e";
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
    ident = "redeyed";
    ldir  = "info/unscoped/r/redeyed";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
