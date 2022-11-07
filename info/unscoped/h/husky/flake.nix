{

  inputs.packument.url   = "https://registry.npmjs.org/husky?rev=442-9999e4fb038322629f5b911636f04a74";
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
    ident = "husky";
    ldir  = "info/unscoped/h/husky";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
