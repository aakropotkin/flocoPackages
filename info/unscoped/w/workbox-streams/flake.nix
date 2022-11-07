{

  inputs.packument.url   = "https://registry.npmjs.org/workbox-streams?rev=74-ecec05c4319bac6ac964f2f8cd0ac371";
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
    ident = "workbox-streams";
    ldir  = "info/unscoped/w/workbox-streams";
    inherit packument fetchInfo;
  } // latest';

}
