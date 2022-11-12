{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/mkdirp-classic?_rev=2-18e1c2eb48265f748b36718925782a6a";
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
    ident = "mkdirp-classic";
    ldir  = "info/unscoped/m/mkdirp-classic";
    inherit packument fetchInfo;
  } // latest';

}
