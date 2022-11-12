{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@ster5/global-mutex?_rev=4-931bce0311c4e98b399ffb52427a90f0";
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
    scope = "@ster5";
    ident = "@ster5/global-mutex";
    ldir  = "info/ster5/global-mutex";
    inherit packument fetchInfo;
  } // latest';

}
