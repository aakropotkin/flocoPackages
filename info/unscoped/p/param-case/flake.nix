{

  inputs.packument.url   = "https://registry.npmjs.org/param-case?rev=28-1e83382ca3ad9728953de4c4c07e3865";
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
    ident = "param-case";
    ldir  = "info/unscoped/p/param-case";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
