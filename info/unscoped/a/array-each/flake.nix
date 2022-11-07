{

  inputs.packument.url   = "https://registry.npmjs.org/array-each?rev=8-7d93ded8edaf9e63d82ec5ae90b52396";
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
    ident = "array-each";
    ldir  = "info/unscoped/a/array-each";
    inherit packument fetchInfo;
  } // latest';

}
