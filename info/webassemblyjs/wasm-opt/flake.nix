{

  inputs.packument.url   = "https://registry.npmjs.org/@webassemblyjs/wasm-opt?rev=58-5c89069beb6503eb4f1cc1439016565b";
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
    ident = "@webassemblyjs/wasm-opt";
    ldir  = "info/webassemblyjs/wasm-opt";
    inherit packument fetchInfo;
  } // latest';

}
