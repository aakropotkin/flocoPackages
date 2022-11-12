{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/through?_rev=216-29a80764055aa8068fa78d6c2de88a7c";
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
    ident = "through";
    ldir  = "info/unscoped/t/through";
    inherit packument fetchInfo;
  } // latest';

}
