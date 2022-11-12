{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@babel/helper-remap-async-to-generator?_rev=91-e7577d7dfb0388410392024815765e0a";
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
    scope = "@babel";
    ident = "@babel/helper-remap-async-to-generator";
    ldir  = "info/babel/helper-remap-async-to-generator";
    inherit packument fetchInfo;
  } // latest';

}
