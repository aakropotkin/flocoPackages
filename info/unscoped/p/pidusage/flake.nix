{

  inputs.packument.url   = "https://registry.npmjs.org/pidusage?rev=81-dc672a15212ab9193f4b88641d694073";
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
    ident = "pidusage";
    ldir  = "info/unscoped/p/pidusage";
    inherit packument fetchInfo;
  } // latest';

}
