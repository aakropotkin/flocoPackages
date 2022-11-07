{

  inputs.packument.url   = "https://registry.npmjs.org/babel?rev=525-bc71bc5f8d32ff3d847b32b40ce6c0a4";
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
    ident = "babel";
    ldir  = "info/unscoped/b/babel";
    inherit packument fetchInfo;
  } // latest';

}
