{

  inputs.packument.url   = "https://registry.npmjs.org/d3-time?rev=45-e0638013a7e158205f47fb740be6dcd4";
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
    ident = "d3-time";
    ldir  = "info/unscoped/d/d3-time";
    inherit packument fetchInfo;
  } // latest';

}
