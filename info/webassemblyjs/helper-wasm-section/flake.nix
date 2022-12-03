{

  inputs.packument.url   = "https://registry.npmjs.org/@webassemblyjs/helper-wasm-section";
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
    ident = "@webassemblyjs/helper-wasm-section";
    ldir  = "info/webassemblyjs/helper-wasm-section";
    inherit packument fetchInfo;
  } // latest';

}
