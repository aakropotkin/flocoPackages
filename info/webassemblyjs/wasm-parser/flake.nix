{

  inputs.packument.url   = "https://registry.npmjs.org/@webassemblyjs/wasm-parser?rev=86-afb3a1c3bb6aeae8a049f6a0b76b90c4";
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
    ident = "@webassemblyjs/wasm-parser";
    ldir  = "info/webassemblyjs/wasm-parser";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
