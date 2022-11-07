{

  inputs.packument.url   = "https://registry.npmjs.org/is-npm?rev=11-fce702bc5f92c71ae07816929f78d499";
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
    ident = "is-npm";
    ldir  = "info/unscoped/i/is-npm";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
