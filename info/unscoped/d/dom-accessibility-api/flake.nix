{

  inputs.packument.url   = "https://registry.npmjs.org/dom-accessibility-api?rev=28-e45c73e872f3633b252f17abffb63270";
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
    ident = "dom-accessibility-api";
    ldir  = "info/unscoped/d/dom-accessibility-api";
    inherit packument fetchInfo;
  } // latest';

}
