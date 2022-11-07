{

  inputs.packument.url   = "https://registry.npmjs.org/uglify-js?rev=717-e953d8c68b478bfc340f9b78986fa562";
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
    ident = "uglify-js";
    ldir  = "info/unscoped/u/uglify-js";
    inherit packument fetchInfo;
  } // latest';

}
