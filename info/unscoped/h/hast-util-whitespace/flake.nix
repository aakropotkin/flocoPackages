{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/hast-util-whitespace?_rev=12-1b8fa048dff7a02412464e8922485a19";
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
    ident = "hast-util-whitespace";
    ldir  = "info/unscoped/h/hast-util-whitespace";
    inherit packument fetchInfo;
  } // latest';

}
