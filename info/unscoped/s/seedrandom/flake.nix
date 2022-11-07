{

  inputs.packument.url   = "https://registry.npmjs.org/seedrandom?rev=47-9b365e3160ac1796f34244fbe4dc9b6a";
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
    ident = "seedrandom";
    ldir  = "info/unscoped/s/seedrandom";
    inherit packument fetchInfo;
  } // latest';

}
