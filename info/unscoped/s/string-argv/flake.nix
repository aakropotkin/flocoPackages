{

  inputs.packument.url   = "https://registry.npmjs.org/string-argv?rev=25-366cbb1bb849a01f80c45cea512626ed";
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
    ident = "string-argv";
    ldir  = "info/unscoped/s/string-argv";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
