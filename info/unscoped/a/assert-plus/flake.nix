{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/assert-plus?_rev=65-d7cd9165deda16d53385bc578729d0fa";
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
    ident = "assert-plus";
    ldir  = "info/unscoped/a/assert-plus";
    inherit packument fetchInfo;
  } // latest';

}
