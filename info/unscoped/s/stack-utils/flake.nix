{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/stack-utils?_rev=25-12c264d6ea57895520062675c81db758";
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
    ident = "stack-utils";
    ldir  = "info/unscoped/s/stack-utils";
    inherit packument fetchInfo;
  } // latest';

}
