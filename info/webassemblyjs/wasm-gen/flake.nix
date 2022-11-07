{

  inputs.packument.url   = "https://registry.npmjs.org/@webassemblyjs/wasm-gen?rev=82-8b47cce3a76c34a5c0911a90c6812b11";
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
    ident = "@webassemblyjs/wasm-gen";
    ldir  = "info/webassemblyjs/wasm-gen";
    inherit packument fetchInfo;
  } // latest';

}
