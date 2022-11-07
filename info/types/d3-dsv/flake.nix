{

  inputs.packument.url   = "https://registry.npmjs.org/@types/d3-dsv?rev=640-3e414f925017c5be78198ad87c937527";
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
    scope = "@types";
    ident = "@types/d3-dsv";
    ldir  = "info/types/d3-dsv";
    inherit packument fetchInfo;
  } // latest';

}
