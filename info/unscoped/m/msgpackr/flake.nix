{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/msgpackr?_rev=96-ebac08fc4b08893b6067419ac56f9594";
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
    ident = "msgpackr";
    ldir  = "info/unscoped/m/msgpackr";
    inherit packument fetchInfo;
  } // latest';

}
