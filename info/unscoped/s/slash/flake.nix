{

  inputs.packument.url   = "https://registry.npmjs.org/slash?rev=37-05f8901989a1e5d9044becff1d7d96ed";
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
    ident = "slash";
    ldir  = "info/unscoped/s/slash";
    inherit packument fetchInfo;
  } // latest';

}
