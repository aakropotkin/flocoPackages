{

  inputs.packument.url   = "https://registry.npmjs.org/strict-uri-encode?rev=7-51d13673360768db50f60ab1d632fb88";
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
    ident = "strict-uri-encode";
    ldir  = "info/unscoped/s/strict-uri-encode";
    inherit packument fetchInfo;
  } // latest';

}
