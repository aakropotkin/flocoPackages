{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@wry/equality?_rev=23-7043003a46376ab80ff91fb718d52309";
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
    scope = "@wry";
    ident = "@wry/equality";
    ldir  = "info/wry/equality";
    inherit packument fetchInfo;
  } // latest';

}
