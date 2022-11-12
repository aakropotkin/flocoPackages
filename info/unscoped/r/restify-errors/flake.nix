{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/restify-errors?_rev=42-010eab58de25fcef93736071a66e388f";
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
    ident = "restify-errors";
    ldir  = "info/unscoped/r/restify-errors";
    inherit packument fetchInfo;
  } // latest';

}
