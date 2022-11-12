{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/rc-picker?_rev=189-bf27e841c9c195bf3cbd2a5a086c224d";
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
    ident = "rc-picker";
    ldir  = "info/unscoped/r/rc-picker";
    inherit packument fetchInfo;
  } // latest';

}
