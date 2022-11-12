{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/is-regexp?_rev=11-6f1d2724fc0a8da201c9d7d7b245c00f";
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
    ident = "is-regexp";
    ldir  = "info/unscoped/i/is-regexp";
    inherit packument fetchInfo;
  } // latest';

}
