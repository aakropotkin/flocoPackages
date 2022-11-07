{

  inputs.packument.url   = "https://registry.npmjs.org/require-directory?rev=63-b8090da430c3acf202ecea2df489b2da";
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
    ident = "require-directory";
    ldir  = "info/unscoped/r/require-directory";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
