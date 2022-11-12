{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/expand-template?_rev=14-d1978a17f52d115922f71903887a1d9b";
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
    ident = "expand-template";
    ldir  = "info/unscoped/e/expand-template";
    inherit packument fetchInfo;
  } // latest';

}
