{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/archy?_rev=38-1d9c23e19f2f61ab128f00b3aafda169";
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
    ident = "archy";
    ldir  = "info/unscoped/a/archy";
    inherit packument fetchInfo;
  } // latest';

}
