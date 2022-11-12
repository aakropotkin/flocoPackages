{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@webassemblyjs/wast-printer?_rev=85-fe738884ec9e9c8dd732c4e14e85c293";
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
    scope = "@webassemblyjs";
    ident = "@webassemblyjs/wast-printer";
    ldir  = "info/webassemblyjs/wast-printer";
    inherit packument fetchInfo;
  } // latest';

}
