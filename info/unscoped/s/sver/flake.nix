{

  inputs.packument.url   = "https://registry.npmjs.org/sver?rev=23-d24b1a5819d1cd173046b1eeb5eca34f";
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
    ident = "sver";
    ldir  = "info/unscoped/s/sver";
    inherit packument fetchInfo;
  } // latest';

}
