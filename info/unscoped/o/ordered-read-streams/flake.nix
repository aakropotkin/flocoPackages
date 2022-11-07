{

  inputs.packument.url   = "https://registry.npmjs.org/ordered-read-streams?rev=25-14841156df5a0ea805e5e31cb351f771";
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
    ident = "ordered-read-streams";
    ldir  = "info/unscoped/o/ordered-read-streams";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
