{

  inputs.packument.url   = "https://registry.npmjs.org/stable?rev=24-3b50580a93ac0c24e1807f989015e0b9";
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
    ident = "stable";
    ldir  = "info/unscoped/s/stable";
    inherit packument fetchInfo;
  } // latest';

}
