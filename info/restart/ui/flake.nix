{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@restart/ui?_rev=25-3fd0fd5452c7176b4b7242217ae0d45b";
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
    scope = "@restart";
    ident = "@restart/ui";
    ldir  = "info/restart/ui";
    inherit packument fetchInfo;
  } // latest';

}
