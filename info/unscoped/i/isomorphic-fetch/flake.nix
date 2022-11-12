{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/isomorphic-fetch?_rev=179-7934a4b7f2157e2ac0bebc0485ef83a6";
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
    ident = "isomorphic-fetch";
    ldir  = "info/unscoped/i/isomorphic-fetch";
    inherit packument fetchInfo;
  } // latest';

}
