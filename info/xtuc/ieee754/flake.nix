{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@xtuc/ieee754?_rev=1-eccdc5a77ecdb411d558f6d1ea08b9a1";
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
    scope = "@xtuc";
    ident = "@xtuc/ieee754";
    ldir  = "info/xtuc/ieee754";
    inherit packument fetchInfo;
  } // latest';

}
