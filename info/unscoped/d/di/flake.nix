{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/di?_rev=69-e78abfecf56a009c5ab199d76e3ee0d3";
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
    ident = "di";
    ldir  = "info/unscoped/d/di";
    inherit packument fetchInfo;
  } // latest';

}
