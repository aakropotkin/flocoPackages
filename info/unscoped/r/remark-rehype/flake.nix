{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/remark-rehype?_rev=45-7b4b851700d919ebfad1f2f13395691f";
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
    ident = "remark-rehype";
    ldir  = "info/unscoped/r/remark-rehype";
    inherit packument fetchInfo;
  } // latest';

}
