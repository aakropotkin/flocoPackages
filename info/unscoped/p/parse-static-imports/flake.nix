{

  inputs.packument.url   = "https://registry.npmjs.org/parse-static-imports?rev=7-01028446eacc2aa9d614f51ebd3c61f3";
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
    ident = "parse-static-imports";
    ldir  = "info/unscoped/p/parse-static-imports";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
