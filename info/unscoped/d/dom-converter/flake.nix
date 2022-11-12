{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/dom-converter?_rev=16-1c1b6a753956fde64019dc1788acc573";
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
    ident = "dom-converter";
    ldir  = "info/unscoped/d/dom-converter";
    inherit packument fetchInfo;
  } // latest';

}
