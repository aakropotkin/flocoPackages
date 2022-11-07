{

  inputs.packument.url   = "https://registry.npmjs.org/mem-fs?rev=19-9b460cafd6573018fcabab78e22810e6";
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
    ident = "mem-fs";
    ldir  = "info/unscoped/m/mem-fs";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
