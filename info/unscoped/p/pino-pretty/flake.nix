{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/pino-pretty?_rev=75-819f4137332286c0eb1669a63abd69f1";
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
    ident = "pino-pretty";
    ldir  = "info/unscoped/p/pino-pretty";
    inherit packument fetchInfo;
  } // latest';

}
