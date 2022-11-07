{

  inputs.packument.url   = "https://registry.npmjs.org/jade?rev=713-9576911609747acbc6e1709b33310c5c";
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
    ident = "jade";
    ldir  = "info/unscoped/j/jade";
    inherit packument fetchInfo;
  } // latest';

}
