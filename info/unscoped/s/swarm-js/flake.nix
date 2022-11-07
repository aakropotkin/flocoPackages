{

  inputs.packument.url   = "https://registry.npmjs.org/swarm-js?rev=45-a506693922e0b138e8308c4f988da8e1";
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
    ident = "swarm-js";
    ldir  = "info/unscoped/s/swarm-js";
    inherit packument fetchInfo;
  } // latest';

}
