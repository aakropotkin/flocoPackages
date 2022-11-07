{

  inputs.packument.url   = "https://registry.npmjs.org/camelize?rev=27-1af4737ec00ad92828284ec939e4aa9d";
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
    ident = "camelize";
    ldir  = "info/unscoped/c/camelize";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
