{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@webassemblyjs%2fhelper-fsm?_rev=64-b2697ccd43d25e5a3abea8606334755b";
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
    ident = "@webassemblyjs/helper-fsm";
    ldir  = "info/webassemblyjs/helper-fsm";
    inherit packument fetchInfo;
  } // latest';

}
