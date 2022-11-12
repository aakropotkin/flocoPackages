{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@blueprintjs/icons?_rev=94-fa354a02431f6204905f17f834162c68";
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
    scope = "@blueprintjs";
    ident = "@blueprintjs/icons";
    ldir  = "info/blueprintjs/icons";
    inherit packument fetchInfo;
  } // latest';

}
