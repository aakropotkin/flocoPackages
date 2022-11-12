{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/quickjs-emscripten?_rev=30-07514df0bbb4b05361698f67edd61c8c";
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
    scope = null;
    ident = "quickjs-emscripten";
    ldir  = "info/unscoped/q/quickjs-emscripten";
    inherit packument fetchInfo;
  } // latest';

}
