{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@aws-sdk%2fmiddleware-serde?_rev=99-0e5f2ce7ea976972a7f153cf5328f78f";
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
    scope = "@aws-sdk";
    ident = "@aws-sdk/middleware-serde";
    ldir  = "info/aws-sdk/middleware-serde";
    inherit packument fetchInfo;
  } // latest';

}
