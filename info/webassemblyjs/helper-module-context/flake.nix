{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@webassemblyjs%2fhelper-module-context?_rev=39-672b3abac09c6f75571e0f4acc62a992";
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
    ident = "@webassemblyjs/helper-module-context";
    ldir  = "info/webassemblyjs/helper-module-context";
    inherit packument fetchInfo;
  } // latest';

}
