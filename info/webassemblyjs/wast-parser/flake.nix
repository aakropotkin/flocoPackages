{

  inputs.packument.url   = "https://registry.npmjs.org/@webassemblyjs/wast-parser?rev=86-64c50de827dc64f727884d4e594f3760";
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
    ident = "@webassemblyjs/wast-parser";
    ldir  = "info/webassemblyjs/wast-parser";
    inherit packument fetchInfo;
  } // latest';

}
