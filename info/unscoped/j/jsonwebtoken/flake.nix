{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/jsonwebtoken?_rev=465-38a2918c1acb52c4805044494991106c";
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
    ident = "jsonwebtoken";
    ldir  = "info/unscoped/j/jsonwebtoken";
    inherit packument fetchInfo;
  } // latest';

}
