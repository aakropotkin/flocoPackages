{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/typescript-tuple?_rev=39-bb600b5cf83d8fab0acb353e48eb5fc0";
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
    ident = "typescript-tuple";
    ldir  = "info/unscoped/t/typescript-tuple";
    inherit packument fetchInfo;
  } // latest';

}
