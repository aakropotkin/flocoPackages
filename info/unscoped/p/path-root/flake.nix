{

  inputs.packument.url   = "https://registry.npmjs.org/path-root?rev=4-a05a13552bbfc4caf3e8db0049541d10";
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
    ident = "path-root";
    ldir  = "info/unscoped/p/path-root";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
