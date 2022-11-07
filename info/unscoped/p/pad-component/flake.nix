{

  inputs.packument.url   = "https://registry.npmjs.org/pad-component?rev=5-68d765604911b79f9afebda971cae046";
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
    ident = "pad-component";
    ldir  = "info/unscoped/p/pad-component";
    inherit packument fetchInfo;
  } // latest';

}
