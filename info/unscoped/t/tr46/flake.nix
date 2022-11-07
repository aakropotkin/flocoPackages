{

  inputs.packument.url   = "https://registry.npmjs.org/tr46?rev=16-88c7a209f666b51e8ab46c77024c6693";
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
    ident = "tr46";
    ldir  = "info/unscoped/t/tr46";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
