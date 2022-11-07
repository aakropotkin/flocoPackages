{

  inputs.packument.url   = "https://registry.npmjs.org/jquery-ui?rev=82-cc68bb280f2fac2afb7c764abb662327";
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
    ident = "jquery-ui";
    ldir  = "info/unscoped/j/jquery-ui";
    inherit packument fetchInfo;
  } // latest';

}
