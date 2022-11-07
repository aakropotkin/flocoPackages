{

  inputs.packument.url   = "https://registry.npmjs.org/console-browserify?rev=38-fe60d5b9138373641fc397d547351e43";
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
    ident = "console-browserify";
    ldir  = "info/unscoped/c/console-browserify";
    inherit packument fetchInfo;
  } // latest';

}
