{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@webassemblyjs%2fhelper-wasm-bytecode?_rev=79-dd8469d3f256a4c903df4ca2d86c55d8";
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
    ident = "@webassemblyjs/helper-wasm-bytecode";
    ldir  = "info/webassemblyjs/helper-wasm-bytecode";
    inherit packument fetchInfo;
  } // latest';

}
