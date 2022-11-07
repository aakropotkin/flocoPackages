{

  inputs.packument.url   = "https://registry.npmjs.org/napi-macros?rev=17-46630c5dd19a20d9da34a560642f3e4f";
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
    ident = "napi-macros";
    ldir  = "info/unscoped/n/napi-macros";
    inherit packument fetchInfo;
  } // latest';

}
