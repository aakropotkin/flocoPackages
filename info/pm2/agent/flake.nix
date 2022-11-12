{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@pm2/agent?_rev=51-639cd26e851fff5049c9683a7a0c75cd";
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
    scope = "@pm2";
    ident = "@pm2/agent";
    ldir  = "info/pm2/agent";
    inherit packument fetchInfo;
  } // latest';

}
