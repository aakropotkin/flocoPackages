{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/upath2?_rev=29-e6a3b77414e870dae57b397dfb6f1fd8";
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
    ident = "upath2";
    ldir  = "info/unscoped/u/upath2";
    inherit packument fetchInfo;
  } // latest';

}
