{

  inputs.packument.url   = "https://registry.npmjs.org/quote-unquote?rev=6-85c3ce4603fb071b9e1b9038c2e50d3d";
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
    ident = "quote-unquote";
    ldir  = "info/unscoped/q/quote-unquote";
    inherit packument fetchInfo;
  } // latest';

}
