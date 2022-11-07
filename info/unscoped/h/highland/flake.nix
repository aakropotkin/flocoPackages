{

  inputs.packument.url   = "https://registry.npmjs.org/highland?rev=198-5887c8c444e6167255ca82bf6f382a13";
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
    ident = "highland";
    ldir  = "info/unscoped/h/highland";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
