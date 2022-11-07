{

  inputs.packument.url   = "https://registry.npmjs.org/@webassemblyjs/wasm-edit?rev=79-16f0774260f059bec9ff563105867872";
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
    ident = "@webassemblyjs/wasm-edit";
    ldir  = "info/webassemblyjs/wasm-edit";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
