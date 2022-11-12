{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/zen-observable-ts?_rev=53-ac7980383626e6bd6ac08faa6bcdf3fb";
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
    ident = "zen-observable-ts";
    ldir  = "info/unscoped/z/zen-observable-ts";
    inherit packument fetchInfo;
  } // latest';

}
