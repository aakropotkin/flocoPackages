{

  inputs.packument.url   = "https://registry.npmjs.org/date-format?rev=77-e3006b189924f5b052249159eb595431";
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
    ident = "date-format";
    ldir  = "info/unscoped/d/date-format";
    inherit packument fetchInfo;
  } // latest';

}
