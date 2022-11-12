{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@formatjs/fast-memoize?_rev=10-4207956606987b6e9be1a7b28feef506";
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
    scope = "@formatjs";
    ident = "@formatjs/fast-memoize";
    ldir  = "info/formatjs/fast-memoize";
    inherit packument fetchInfo;
  } // latest';

}
