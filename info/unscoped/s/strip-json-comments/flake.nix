{

  inputs.packument.url   = "https://registry.npmjs.org/strip-json-comments?rev=52-b1b09ff7b5681a2bceb7ffb917b5c132";
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
    ident = "strip-json-comments";
    ldir  = "info/unscoped/s/strip-json-comments";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
