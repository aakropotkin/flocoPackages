{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/joi?_rev=746-4962bfad13549efcb7fd72f125f07efa";
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
    ident = "joi";
    ldir  = "info/unscoped/j/joi";
    inherit packument fetchInfo;
  } // latest';

}
