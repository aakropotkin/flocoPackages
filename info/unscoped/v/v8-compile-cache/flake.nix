{

  inputs.packument.url   = "https://registry.npmjs.org/v8-compile-cache?rev=17-3c0d6b8afc57ef5839b6cdd79dc3045f";
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
    ident = "v8-compile-cache";
    ldir  = "info/unscoped/v/v8-compile-cache";
    inherit packument fetchInfo;
  } // latest';

}
