{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/array-differ?_rev=18-95cd680c8c129fe336789d5dc5fbf84a";
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
    ident = "array-differ";
    ldir  = "info/unscoped/a/array-differ";
    inherit packument fetchInfo;
  } // latest';

}
