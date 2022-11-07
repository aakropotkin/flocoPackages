{

  inputs.packument.url   = "https://registry.npmjs.org/@webassemblyjs/leb128?rev=64-764e44e8f20dad2832626ba2d4155db1";
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
    ident = "@webassemblyjs/leb128";
    ldir  = "info/webassemblyjs/leb128";
    inherit packument fetchInfo;
  } // latest';

}
