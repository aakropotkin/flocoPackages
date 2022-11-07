{

  inputs.packument.url   = "https://registry.npmjs.org/d3-timer?rev=39-a959626e5ca9e12899122a0050e5aeae";
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
    ident = "d3-timer";
    ldir  = "info/unscoped/d/d3-timer";
    inherit packument fetchInfo;
  } // latest';

}
