{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/ammo?_rev=54-7802039fd7dd372cf26b52bfbae1f054";
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
    ident = "ammo";
    ldir  = "info/unscoped/a/ammo";
    inherit packument fetchInfo;
  } // latest';

}
