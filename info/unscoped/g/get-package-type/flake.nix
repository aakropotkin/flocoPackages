{

  inputs.packument.url   = "https://registry.npmjs.org/get-package-type?rev=1-21a2cde41ea94e143daa5d324475ad2f";
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
    ident = "get-package-type";
    ldir  = "info/unscoped/g/get-package-type";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
