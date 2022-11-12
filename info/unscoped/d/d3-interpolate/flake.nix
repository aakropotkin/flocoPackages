{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/d3-interpolate?_rev=51-041e131e633fbc0fa71c18bbc2ed1a4f";
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
    ident = "d3-interpolate";
    ldir  = "info/unscoped/d/d3-interpolate";
    inherit packument fetchInfo;
  } // latest';

}
