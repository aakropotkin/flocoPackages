{

  inputs.packument.url   = "https://registry.npmjs.org/sinon?rev=495-56e36b786b73b76a3836569722938987";
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
    ident = "sinon";
    ldir  = "info/unscoped/s/sinon";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
