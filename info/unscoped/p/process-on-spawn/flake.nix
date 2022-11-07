{

  inputs.packument.url   = "https://registry.npmjs.org/process-on-spawn?rev=1-445a4cb3a42ff9ef6a3735e9e29a28af";
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
    ident = "process-on-spawn";
    ldir  = "info/unscoped/p/process-on-spawn";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
