{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/htmlparser2?_rev=262-3db9f67fd427a41186056d5d99660010";
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
    ident = "htmlparser2";
    ldir  = "info/unscoped/h/htmlparser2";
    inherit packument fetchInfo;
  } // latest';

}
