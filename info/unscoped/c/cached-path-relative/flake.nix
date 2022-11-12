{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/cached-path-relative?_rev=7-6d61120964eeabf1cf372108a0dfa821";
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
    ident = "cached-path-relative";
    ldir  = "info/unscoped/c/cached-path-relative";
    inherit packument fetchInfo;
  } // latest';

}
