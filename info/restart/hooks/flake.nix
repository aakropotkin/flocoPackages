{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@restart/hooks?_rev=57-fe99b5b0a0c9bff97c734b9b1e5c92f6";
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
    ident = "@restart/hooks";
    ldir  = "info/restart/hooks";
    inherit packument fetchInfo;
  } // latest';

}
