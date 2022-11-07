{

  inputs.packument.url   = "https://registry.npmjs.org/lodash.get?rev=21-5a5a0376428156188e636f97442636ad";
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
    ident = "lodash.get";
    ldir  = "info/unscoped/l/lodash.get";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
